#################################################
###                                           ###
### Quick Installation and usage in Linux OS: ###
###                                           ###
#################################################

### 1. xmlf90-1.2g.tgz ###

*  tar -xvf xmlf90-1.2g.tgz

*  Define the environment variable FLIB_ROOT to point to the macros
*  directory in the xmlf90 distribution:
      FLIB_ROOT=/somewhere/xmlf90/macros ; export FLIB_ROOT (sh-like shells)
      setenv FLIB_ROOT /somewhere/xmlf90/macros           (csh-like shells)

*  Go into macros, look through the fortran-XXXX.mk files,
  and see if one of them applies to your computer/compiler combination.
*  If so, copy it or make a (symbolic) link to 'fortran.mk':
      ln -sf fortran-intel.mk fortran.mk

*  Go back to the top directory.
*  If you have a Fortran95 compiler, simply type "sh build.sh"
*  If not, edit build.sh and comment out the DOM sections as directed.

* After installation, the appropriate modules and library files should
  already be in $FLIB_ROOT/modules and  $FLIB_ROOT/lib, respectively. 
  To compile user programs, it is suggested that the user create a 
  separate directory to hold the program files and prepare a Makefile 
  following the templates in the Examples/ directory.


### 2. ion-collision codes ###

*  The current codes rely only on LAPACK which is fairly standard.
   In the Makefile, we suggest to employ the LAPACK implementation 
   from the  Intel MKL library. However, any version of LAPACK can be used. 
*  The Standard LAPACK can be downloaded and installed from e.g.:
   https://netlib.org/lapack/

*  A makefile is provided for quick installation.

*  Put your LAPACK path to MKLROOT(need to fix for your own machine)
   or within the intel oneAPI...:
*  Make sure the path to fortran.mk is exported correctly.
*  LIBS can be corrected based on your math library version.

*  In /path/to/your/code/ , run 

     make or make all

*  Three codes: Getsta, Coll, and Sigma are then available.
*  quick usage of this code is shown in RunExample.sh.


###############################################################
###                                                         ###
### To illustrate the different steps to compute inelastic  ###
### cross sections in ion-atom and ion-molecule collisions, ###
### we report and discuss here the the key parameters for   ### 
### the collision system.                                   ###
###                                                         ###
###############################################################

### 1. In collinput.xml: ###

  $ImpactParam$: Linear distribution from $bmin$ to $bmax$ with total $nb$ numbers 
                 of the impact parameter b, and easily to extend into other 
                 distribution types or read from files by any values.
 
  $ImpactVel$: Projectile velocity $v$ in a.u., usually it's along z-axis direction.
 
  $Zgrid$: Grids along z-axis direction from $zmin$ to $zmax$ with total $nzgrid$ number. 
           We provide linear and exponential distribution types.
 
  $InitState$: Initial electronic state on target. 
 
  $Position$: positions of the projectile or target nuclei.
 
  $Potential$: model potential, including the nuclear charge number and 
               the exponent value, for bare ions or a true potential, 
               the $exponent$ value is set up as 0, and for the model potential, 
               its value is provided by users.
 
  $Target$ or $Projectile$: 
  $file$: The files which save the eigenvalues and eigenvector of the T and P.
  $stamin$ and $stamax$: electronic state range included during the collision process.


### In getsta_P.xml or getsta_T.xml: ###

  $Position$: positions of the projectile(P) or target(T) nuclei.

  $Basisset$: Path where GTOs basis sets for the projectile(P) or target(T) are saved.

  $Potential$: Model potential parameters (charge and exponet), provided by users.

### With running the /GetSta: ###
  $eigenvalues$ and $eigenvectors$ will be generated in defined directory, including the 
  the eigenvalues and eigenvector of the T and P.

### With running the /Coll: ###
  The transition probabilities of all electronic channels for 
  all impact parameters are saved in $prob$.

### Details can be also found in the RunExample.sh
### We also provide a finished full Example_finished.


#############################
#### The model potential ####
#############################

* The model potential and its parameters are system-dependent, 
  the users can employ the model potentials from published references, 
  and fit it based on the formula (Eq. 6 in paper). 
* Besides, one can also obtain the model potentials following 
  the procedure of Bottcher (J. Phys. B 4, 1140 (1971)), 
  and then fit the analytic parameters based on the formula (Eq. 6).