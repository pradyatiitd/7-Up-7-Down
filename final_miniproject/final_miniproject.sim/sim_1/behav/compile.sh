#!/bin/bash -f
xv_path="/home/ansh/2ndYearSem1/COL215_Digital_Logic_and_System_design/Vivado/2016.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
echo "xvhdl -m64 --relax -prj Seven_upSeven_down_vhdl.prj"
ExecStep $xv_path/bin/xvhdl -m64 --relax -prj Seven_upSeven_down_vhdl.prj 2>&1 | tee -a compile.log
