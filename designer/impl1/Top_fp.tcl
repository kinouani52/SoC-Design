new_project \
    -name {Top} \
    -location {D:\SystemFiles\ESIGELEC-2021\Intro\designer\impl1\Top_fp} \
    -mode {single}
set_device_type -type {A2F200M3F}
set_device_package -package {484 FBGA}
update_programming_file \
    -feature {prog_fpga:on} \
    -fdb_source {fdb} \
    -fdb_file {D:\SystemFiles\ESIGELEC-2021\Intro\designer\impl1\Top.fdb} \
    -feature {prog_from:off} \
    -feature {prog_nvm:on} \
    -efm_content {location:0;source:efc} \
    -efm_block {location:0;config_file:{D:\SystemFiles\ESIGELEC-2021\Intro\component\work\Intro\MSS_ENVM_0\MSS_ENVM_0.efc}} \
    -pdb_file {D:\SystemFiles\ESIGELEC-2021\Intro\designer\impl1\Top_fp\Top.pdb}
set_programming_action -action {PROGRAM}
run_selected_actions
save_project
close_project
