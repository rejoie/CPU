@echo off
set xv_path=F:\\vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto e7cfa176e3b943149f693948fd1b5b50 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot pipeline_test_behav xil_defaultlib.pipeline_test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
