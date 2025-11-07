#!/bin/bash


###   to make sure run the makefile correctly :
###   to source your Intel
###   source /public/intel/oneapi/setvars.sh
###   declare the xml path
###   FLIB_ROOT=/storage/home/hznu/ccjia/Coll-test/xmlf90-1.2g/macros ; export FLIB_ROOT


###   export OMP_NUM_THREADS=N
###   where N is the CPU cores you need

export OMP_NUM_THREADS=1

###
###   Now start to run the code
###   !!!Important!!!  assume the SCASCC-code is installed in     
###      /your/path/to/SCASCC/
###   run 'ls' command, you may find
###      bin/   src/   mod/   Examlpe/   RunExample.sh
###   One can also correct the path below to fit their own path
###   e.g.: /path/to/your/bin/
###

###
###   The present $dir, where you run this Example.sh.
###   The /Example/ should be in the $dir.
###

dir=$(pwd)
direx=$(pwd)'/Example/'
echo $dir
echo $direx


###
###   Move to the $direx, and run the code now.
###   The /SCASCC/bin/ path is ../../SCASCC/bin/
###
cd $direx

###
###   Run the GetSta for Target. "GetSta' code is installed 
###   in the $dir/SCASCC/bin/. 'getsta_h.tmp'is corrected 
###   by 'sed' command to place the present path 
###

sed "s#dir#$dir#g" getsta_h.tmp > getsta_h.xml
$dir/bin/GetSta getsta_h

###
###   Run the GetSta for Projectile. 'getsta_h.tmp' is 
###   corrected by 'sed' command to place the present path
###

sed "s#dir#$dir#g" getsta_nitrogen.tmp > getsta_nitrogen.xml
$dir/bin/GetSta getsta_nitrogen


###
###   'Coll' code is installed in the $dir/SCASCC/bin/. The
###   input.xml information will be move to $direx/collinput/
###   All output information (e.g. state energy, transition probabilities)
###   will be in $direx/collinput/ as 'prop1' and 'formatted_prob1' 
###

$dir/bin/Coll collinput -rep

###
###   Run the 'Sigma' code to compute the cross section:
###   The prop1 is saved in /Example/collinput_coll/
###   e.g.: $dir/bin/Sigma collinput_coll 1
###

$dir/bin/Sigma collinput_coll 1

### 
###   move back to the RunExample.sh
###
cd ..
