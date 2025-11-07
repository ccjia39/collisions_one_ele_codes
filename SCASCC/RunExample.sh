#!/bin/bash

# make info :
# to source your Intel
#source /public/intel/oneapi/setvars.sh
# declare the xml path
#FLIB_ROOT=/storage/home/hznu/njj/ccjia-test/Coll-test/xmlf90-1.2g/macros ; export FLIB_ROOT

#export OMP_NUM_THREADS=4

# Assume the SCASCC-code is installed in 
#    
#      /your/path/to/SCASCC/
# run 'ls', you may find
#      bin/   src/   mod/   Examlpe/   RunExample.sh
#  
# # One can of course correct the path below to fit their own path


# The present $dir, where you run this Example.sh.
dir=$(pwd)
# The /Example/ should be in the $dir.
direx=$(pwd)'/Example/'
echo $dir
echo $direx


# Move to the $direx, and run the code now.
# the /SCASCC/bin/ path is ../../SCASCC/bin/
cd $direx

# Run the GetSta for Target.
# "GetSta' code is installed in the $dir/SCASCC/bin/ 
# # getsta_h.tmp is corrected by 'sed' command to place the
# # present path 
sed "s#dir#$dir#g" getsta_h.tmp > getsta_h.xml
$dir/bin/GetSta getsta_h

# Run the GetSta for Projectile. 
# # getsta_h.tmp is corrected by 'sed' command to place the
# # present path
sed "s#dir#$dir#g" getsta_nitrogen.tmp > getsta_nitrogen.xml
$dir/bin/GetSta getsta_nitrogen

# 'Coll' code is installed in the $dir/SCASCC/bin/
# The input.xml information will be move to $direx/collinput/
# # All output information (e.g. state energy, transition probabilities)
# # will be in $direx/collinput/ as 'prop1' and 'formatted_prob1' 
$dir/bin/Coll collinput -rep


# Run the 'Sigma' code to compute the cross section:
# e.g.:
#
#  $dir/bin/Sigma collinput_coll 1
#
#  whiere the prop1 is saved in /Example/collinput_coll/prop1
#$dir/bin/Sigma collinput_coll 1

cd ..
date



########
# export OMP_NUM_THREADS=4
#
# dir=$(pwd)
# direx=$(pwd)'/Example/'
# echo $dir
# echo $direx

# cd $direx

# sed "s#dir#$dir#g" getsta_h.tmp > getsta_h.xml
# $dir/bin/GetSta getsta_h

# sed "s#dir#$dir#g" getsta_nitrogen.tmp > getsta_nitrogen.xml
# $dir/bin/GetSta getsta_nitrogen

# $dir/bin/Coll collinput -rep

# $dir/bin/Sigma collinput_coll 1

# cd ..
#######
