#
# Makefile for DOM examples
#

default: all
all: getsta coll sigma

#
#---------------------------
#FLIB_ROOT=/storage/home/hznu/jiacc/xmlf90/macros ; export FLIB_ROOT

MK=$(FLIB_ROOT)/fortran.mk
include $(MK)

#---------------------------
#
# Uncomment the following line for debugging support
#
#MKLROOT=/opt/intel/oneapi/mkl/2024.1
#LIBS=$(LIB_PREFIX)$(LIB_STD) -lflib  ${MKLROOT}/lib/libmkl_lapack95_ilp64.a  -L${MKLROOT}/lib -lmkl_intel_ilp64 -lmkl_sequential -lmkl_core -lpthread -lm -ldl


LIBS=$(LIB_PREFIX)$(LIB_STD) -lflib -qmkl
LDFLAGS = -O2 -fopenmp #-parallel


#mod = abmlib.f colldyn.f90 computemat.f90 fdn.f90 inttrans.f90 newtypes.f90 \
      setup.f90 splineinterp.f90 centerlib.f90 collint.f90 diagolib.f90 \
      general.f90 linearinterp.f90 nuclear.f90 tools.f90 cgto.f90 colllib.f90 \
      f11.f90 inputlib.f90 matrices.f90 overlap.f90 special_functions.f90
#src = getsta.f90 coll.f90 sigma.f90

moddir = ../mod
srcdir = ../src

getsta: $(moddir)/general.o $(moddir)/tools.o $(moddir)/newtypes.o $(moddir)/matrices.o \
        $(moddir)/centerlib.o $(moddir)/fdn.o $(moddir)/setup.o $(moddir)/inputlib.o \
        $(moddir)/cgto.o $(moddir)/overlap.o $(moddir)/special_functions.o $(moddir)/f11.o \
        $(moddir)/nuclear.o $(moddir)/computemat.o $(moddir)/diagolib.o $(srcdir)/getsta.o
	$(FC) $(LDFLAGS) -o GetSta general.o tools.o newtypes.o matrices.o centerlib.o \
        fdn.o setup.o inputlib.o cgto.o overlap.o special_functions.o f11.o nuclear.o \
        computemat.o diagolib.o getsta.o $(LIBS)

coll: $(moddir)/general.o $(moddir)/abmlib.o $(moddir)/linearinterp.o $(moddir)/splineinterp.o \
      $(moddir)/tools.o $(moddir)/setup.o $(moddir)/newtypes.o $(moddir)/matrices.o \
      $(moddir)/inputlib.o $(moddir)/centerlib.o $(moddir)/fdn.o $(moddir)/colllib.o \
      $(moddir)/cgto.o $(moddir)/colldyn.o $(moddir)/overlap.o $(moddir)/special_functions.o \
      $(moddir)/f11.o nuclear.o  $(moddir)/collint.o  $(srcdir)/coll.o
	$(FC) $(LDFLAGS) -o Coll general.o abmlib.o linearinterp.o splineinterp.o \
        tools.o setup.o newtypes.o matrices.o inputlib.o centerlib.o fdn.o \
        colllib.o cgto.o colldyn.o overlap.o special_functions.o f11.o nuclear.o collint.o  coll.o $(LIBS)

sigma: $(moddir)/general.o $(moddir)/newtypes.o $(srcdir)/sigma.o
	$(FC) $(LDFLAGS) -o Sigma general.o newtypes.o sigma.o $(LIBS)
#
clean: 
	rm -f GetSta Coll Sigma *.o *.$(MOD_EXT)
#

tar:
	tar cvf Coll_CPC.tar *.f* makefile xmlf90-1.2g.tgz Example RunExample.sh
