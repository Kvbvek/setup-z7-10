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
set proj_name "zybo-agh"
set proj_path [file join $hw_dir $proj_name "${proj_name}.xpr"]

# Folder projektu Vivado (gdzie jest .xpr)
set proj_root [file dirname $proj_path]

# Nazwa wyjściowego XSA
set xsa_name "${proj_name}.xsa"
set xsa_out [file join $proj_root $xsa_name]

# --- Check if project exists ---
if {![file exists $proj_path]} {
    puts "ERROR: Project file not found: $proj_path"
    exit 1
}

puts "Opening project: $proj_path"
open_project $proj_path

puts "Exporting XSA with bitstream to: $xsa_out"

write_hw_platform -fixed -include_bit -force $xsa_out

close_project

puts "✅ XSA successfully generated: $xsa_out"
exit
