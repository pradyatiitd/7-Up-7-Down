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
ExecStep $xv_path/bin/xelab -wto f975b2fd62c84410b3c2864b266bfd18 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot Seven_upSeven_down_behav xil_defaultlib.Seven_upSeven_down -log elaborate.log
