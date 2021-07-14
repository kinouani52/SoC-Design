quietly set ACTELLIBNAME SmartFusion
quietly set PROJECT_DIR "D:/SystemFiles/ESIGELEC-2021/Intro"
source "${PROJECT_DIR}/simulation/CompileDssBfm.tcl";source "${PROJECT_DIR}/simulation/bfmtovec_compile.tcl";

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap smartfusion "C:/Microsemi/Libero_SoC_v11.9/Designer/lib/modelsim/precompiled/vlog/smartfusion"
vmap MSS_BFM_LIB "../component/Actel/SmartFusionMSS/MSS/2.5.200/mti/user_verilog/MSS_BFM_LIB"
vcom -work MSS_BFM_LIB -force_refresh
vlog -work MSS_BFM_LIB -force_refresh
if {[file exists COREAPB3_LIB/_info]} {
   echo "INFO: Simulation library COREAPB3_LIB already exists"
} else {
   file delete -force COREAPB3_LIB 
   vlib COREAPB3_LIB
}
vmap COREAPB3_LIB "COREAPB3_LIB"
if {[file exists CORETIMER_LIB/_info]} {
   echo "INFO: Simulation library CORETIMER_LIB already exists"
} else {
   file delete -force CORETIMER_LIB 
   vlib CORETIMER_LIB
}
vmap CORETIMER_LIB "CORETIMER_LIB"

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/FlashLED_control.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/FlashLED_control_wrapper.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/Intro/MSS_CCC_0/Intro_tmp_MSS_CCC_0_MSS_CCC.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/Intro/Intro.vhd"
vcom -2008 -explicit  -work COREAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAPB3/4.1.100/rtl/vhdl/core/coreapb3_muxptob3.vhd"
vcom -2008 -explicit  -work COREAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAPB3/4.1.100/rtl/vhdl/core/coreapb3_iaddr_reg.vhd"
vcom -2008 -explicit  -work COREAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAPB3/4.1.100/rtl/vhdl/core/coreapb3.vhd"
vcom -2008 -explicit  -work CORETIMER_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreTimer/2.0.103/rtl/vhdl/core/coretimer_pkg.vhd"
vcom -2008 -explicit  -work CORETIMER_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreTimer/2.0.103/rtl/vhdl/core/coretimer.vhd"
vcom -2008 -explicit  -work COREAPB3_LIB "${PROJECT_DIR}/component/Actel/DirectCore/CoreAPB3/4.1.100/rtl/vhdl/core/components.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/Top/Top.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/intro_test_stimulus.vhd"

vsim -L smartfusion -L presynth -L MSS_BFM_LIB -L COREAPB3_LIB -L CORETIMER_LIB  -t 1ps presynth.intro_test_stimulus
do "${PROJECT_DIR}/simulation/wave.do"
add log -r /*
run 8000ns
