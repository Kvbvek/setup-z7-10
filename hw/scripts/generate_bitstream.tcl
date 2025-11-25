if {[llength $argv] < 1} {
    puts "ERROR: Put path to hw folder as an argument"
    exit 1
}

set hw_dir [lindex $argv 0]

# Pełna ścieżka do projektu XPR
set proj_path [file join $hw_dir "zybo-agh" "zybo-agh.xpr"]

puts "Opening project: $proj_path"
open_project $proj_path

# Uruchomienie syntezy
reset_run synth_1
launch_runs synth_1 -jobs 3
wait_on_run synth_1

# Implementacja + generacja bitstreamu
launch_runs impl_1 -to_step write_bitstream -jobs 3
wait_on_run impl_1

close_project

puts "Bitstream generated!"
exit
