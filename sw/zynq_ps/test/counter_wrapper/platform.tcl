# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/jakub/proj-zybo/setup-z7-10/sw/zynq_ps/test/counter_wrapper/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/jakub/proj-zybo/setup-z7-10/sw/zynq_ps/test/counter_wrapper/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {counter_wrapper}\
-hw {/home/jakub/proj-zybo/setup-z7-10/hw/vivado/export/counter_wrapper.xsa}\
-out {/home/jakub/proj-zybo/setup-z7-10/sw/zynq_ps/test}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {counter_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
