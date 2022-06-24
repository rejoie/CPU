@echo off
set xv_path=F:\\vivado\\Vivado\\2017.2\\bin
call %xv_path%/xsim pipeline_test_behav -key {Behavioral:sim_1:Functional:pipeline_test} -tclbatch pipeline_test.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
