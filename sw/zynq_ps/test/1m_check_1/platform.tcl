# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/jakub/zybo_latest/setup-z7-10/sw/zynq_ps/test/1m_check_1/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/jakub/zybo_latest/setup-z7-10/sw/zynq_ps/test/1m_check_1/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {1m_check_1}\
-hw {/home/jakub/zybo_latest/setup-z7-10/hw/export/1m_check.xsa}\
-out {/home/jakub/zybo_latest/setup-z7-10/sw/zynq_ps/test}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {1m_check_1}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
