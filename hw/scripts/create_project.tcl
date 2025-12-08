if {[llength $argv] < 1} {
    puts "ERROR: Put path to hw folder as an argument"
    exit 1
}

set hw_dir [lindex $argv 0]
puts "HW directory = $hw_dir"

set proj_name "zybo-agh"

# --------------------------------------------------------------------------
# Project create
create_project $proj_name "$hw_dir/$proj_name" -part xc7z010clg400-1
set_property board_part digilentinc.com:zybo-z7-10:part0:1.2 [current_project]

# Add sources
import_files -norecurse "$hw_dir/rtl/axis_data_generator.v"
import_files -norecurse "$hw_dir/rtl/csr.sv"
import_files -norecurse "$hw_dir/rtl/csr_pkg.sv"
import_files -norecurse "$hw_dir/rtl/csr_wrapper.sv"
import_files -norecurse "$hw_dir/rtl/csr_top.v"
update_compile_order -fileset sources_1


# Create block design
create_bd_design "design_1"
update_compile_order -fileset sources_1

# Add Zynq PS to block design, run block automation
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]

# Edit PS properties
startgroup
set_property -dict [list CONFIG.PCW_USE_S_AXI_HP0 {1} CONFIG.PCW_USE_FABRIC_INTERRUPT {1} CONFIG.PCW_IRQ_F2P_INTR {1}] [get_bd_cells processing_system7_0]
endgroup

# Add AXI DMA to block design, edit properties
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0
set_property -dict [list CONFIG.c_include_sg {0} CONFIG.c_sg_length_width {26} CONFIG.c_sg_include_stscntrl_strm {0}] [get_bd_cells axi_dma_0]

# Add axis_data_generator to block design
create_bd_cell -type module -reference axis_data_generator axis_data_generator_0

# Add axis fifo, edit properties
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0
endgroup
set_property -dict [list CONFIG.FIFO_DEPTH {4096} CONFIG.FIFO_MODE {1}] [get_bd_cells axis_data_fifo_0]
set_property -dict [list CONFIG.FIFO_MODE {2}] [get_bd_cells axis_data_fifo_0]

# Connect data_gen -> FIFO
connect_bd_intf_net [get_bd_intf_pins axis_data_generator_0/M_AXIS] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]

# apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config { Clk {/processing_system7_0/FCLK_CLK0 (50 MHz)} Freq {100} Ref_Clk0 {} Ref_Clk1 {} Ref_Clk2 {}}  [get_bd_pins axis_data_generator_0/M_AXIS_ACLK]

# Automation fod PS
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/axi_dma_0/M_AXI_MM2S} Slave {/processing_system7_0/S_AXI_HP0} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins processing_system7_0/S_AXI_HP0]

# concat setup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
endgroup
connect_bd_net [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins axi_dma_0/s2mm_introut] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins processing_system7_0/IRQ_F2P]

# Automation for AXI DMA
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {/processing_system7_0/FCLK_CLK0 (50 MHz)} Clk_xbar {/processing_system7_0/FCLK_CLK0 (50 MHz)} Master {/axi_dma_0/M_AXI_S2MM} Slave {/processing_system7_0/S_AXI_HP0} ddr_seg {Auto} intc_ip {/axi_mem_intercon} master_apm {0}}  [get_bd_intf_pins axi_dma_0/M_AXI_S2MM]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_dma_0/S_AXI_LITE} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
endgroup

# Connect FIFO -> AXI DMA
connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_0/M_AXIS] [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM]

# Automation for fifo, counter
connect_bd_net [get_bd_pins axis_data_generator_0/M_AXIS_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins axis_data_generator_0/M_AXIS_ARESETN] [get_bd_pins rst_ps7_0_50M/peripheral_aresetn]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins rst_ps7_0_50M/peripheral_aresetn]

# CSR
create_bd_cell -type module -reference csr_top csr_top_0
connect_bd_net [get_bd_pins csr_top_0/DG_ENABLE_value] [get_bd_pins axis_data_generator_0/enable]
connect_bd_net [get_bd_pins axis_data_generator_0/length] [get_bd_pins csr_top_0/DG_LENGTH_value]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {/processing_system7_0/FCLK_CLK0 (50 MHz)} Clk_slave {/processing_system7_0/FCLK_CLK0 (50 MHz)} Clk_xbar {/processing_system7_0/FCLK_CLK0 (50 MHz)} Master {/processing_system7_0/M_AXI_GP0} Slave {/csr_top_0/s_axil} ddr_seg {Auto} intc_ip {/ps7_0_axi_periph} master_apm {0}}  [get_bd_intf_pins csr_top_0/s_axil]
connect_bd_net [get_bd_pins csr_top_0/rst_n] [get_bd_pins rst_ps7_0_50M/peripheral_aresetn]

set_property top design_1_wrapper [current_fileset]

# ------------------------------
regenerate_bd_layout
save_bd_design
validate_bd_design

# Create HDL wrapper
make_wrapper -files [get_files "$hw_dir/$proj_name/$proj_name.srcs/sources_1/bd/design_1/design_1.bd"] -top
add_files -norecurse "$hw_dir/$proj_name/$proj_name.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v"

exit