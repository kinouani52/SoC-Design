onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /intro_test_stimulus/SYSCLK 
add wave -noupdate -radix hexadecimal /intro_test_stimulus/NSYSRESET 
add wave -noupdate -radix hexadecimal /intro_test_stimulus/Top_0/CoreAPB3_0/PADDR 
add wave -noupdate -radix hexadecimal /intro_test_stimulus/Top_0/CoreAPB3_0/PSEL 
add wave -noupdate -radix hexadecimal /intro_test_stimulus/Top_0/CoreTimer_0/PADDR 
add wave -noupdate -radix hexadecimal /intro_test_stimulus/Top_0/CoreTimer_0/PSEL 
add wave -noupdate -radix hexadecimal /intro_test_stimulus/Top_0/CoreTimer_0/PWRITE 
add wave -noupdate -radix hexadecimal /intro_test_stimulus/Top_0/CoreTimer_0/PWDATA 
add wave -noupdate -radix hexadecimal /intro_test_stimulus/Top_0/CoreTimer_0/PRDATA 
add wave -noupdate -radix hexadecimal /intro_test_stimulus/Top_0/CoreTimer_0/TIMINT 
add wave -noupdate -radix hexadecimal /intro_test_stimulus/Top_0/FlashLED_control_wrapper_0/PSEL
add wave -noupdate -radix hexadecimal /intro_test_stimulus/Top_0/FlashLED_control_wrapper_0/PADDR 
add wave -noupdate -radix hexadecimal /intro_test_stimulus/Top_0/FlashLED_control_wrapper_0/RD 



TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10000 ns} 0}
configure wave -namecolwidth 265
configure wave -valuecolwidth 75
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {80000 ns}
