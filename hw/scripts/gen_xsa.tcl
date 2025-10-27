# ==========================================
# Vivado build script - generate .xsa for zybo
# Usage: vivado -mode batch -source build_xsa.tcl -tclargs <path_to_hw_folder>
# ==========================================

# --- Check argument ---
if {[llength $argv] < 1} {
    puts "ERROR: Put path to hw folder as an argument"
    exit 1
}

# --- Set up paths ---
set hw_dir [lindex $argv 0]
set proj_name "counter"
set proj_dir [file join $hw_dir "vivado" $proj_name "${proj_name}.xpr"]
set export_dir [file join $hw_dir "export"]
set xsa_name "zybo-agh.xsa"

# --- Check if project exists ---
if {![file exists $proj_dir]} {
    puts "ERROR: Project file not found: $proj_dir"
    exit 1
}

puts "Opening project: $proj_dir"
open_project $proj_dir

set xsa_path [file join $export_dir $xsa_name]
puts "Exporting XSA: $xsa_path"

write_hw_platform -fixed -include_bit -force $xsa_path

close_project

puts "✅ XSA successfully generated: $xsa_path"
exit
