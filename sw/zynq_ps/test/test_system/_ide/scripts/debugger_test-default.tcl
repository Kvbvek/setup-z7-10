# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/jakub/proj-zybo/setup-z7-10/sw/zynq_ps/test/test_system/_ide/scripts/debugger_test-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/jakub/proj-zybo/setup-z7-10/sw/zynq_ps/test/test_system/_ide/scripts/debugger_test-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B3FC2AA" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B3FC2AA-13722093-0"}
fpga -file /home/jakub/proj-zybo/setup-z7-10/sw/zynq_ps/test/test/_ide/bitstream/counter_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/jakub/proj-zybo/setup-z7-10/sw/zynq_ps/test/counter_wrapper/export/counter_wrapper/hw/counter_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/jakub/proj-zybo/setup-z7-10/sw/zynq_ps/test/test/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/jakub/proj-zybo/setup-z7-10/sw/zynq_ps/test/test/Debug/test.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
