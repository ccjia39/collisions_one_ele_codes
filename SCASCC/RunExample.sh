#source /public/intel/oneapi/setvars.sh intel64
#FLIB_ROOT=/storage/home/hznu/jiacc/xmlf90/macros ; export FLIB_ROOT

###
# export OMP_NUM_THREADS=N  
# where N is the number of CPU cores
###

export OMP_NUM_THREADS=1

dir=$(pwd)
direx=$(pwd)'/Example/'
echo $dir
echo $direx

cd $direx
sed "s#dir#$dir#g" getsta_h.tmp > getsta_h.xml
$dir/bin/GetSta getsta_h
sed "s#dir#$dir#g" getsta_nitrogen.tmp > getsta_nitrogen.xml
$dir/bin/GetSta getsta_nitrogen
$dir/bin/Coll collinput
$dir/bin/Sigma
cd ..

