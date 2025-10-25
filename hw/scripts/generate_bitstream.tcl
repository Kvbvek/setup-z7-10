if {[llength $argv] < 1} {
    puts "ERROR: Put path to hw folder as an argument"
    exit 1
}
set hw_dir [lindex $argv 0]

set proj_name "counter"
set proj_dir [file join $hw_dir "vivado" counter "${proj_name}.xpr"]

puts "Opening prj: $proj_dir"
open_project $proj_dir

reset_run synth_1
launch_runs synth_1 -jobs 3
wait_on_run synth_1

# Run implemenatation up to bitstream generation
launch_runs impl_1 -to_step write_bitstream -jobs 3
wait_on_run impl_1

# Close project
close_project

puts "Bitstream generated!"
exit
