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
ExecStep $xv_path/bin/xsim Seven_upSeven_down_behav -key {Behavioral:sim_1:Functional:Seven_upSeven_down} -tclbatch Seven_upSeven_down.tcl -log simulate.log
