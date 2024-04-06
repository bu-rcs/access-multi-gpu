# MPI Jobs on Stampede3

To launch an MPI application, use the TACC-specific MPI launcher `ibrun`, which is a Stampede3-aware replacement for generic MPI launchers like mpirun and mpiexec. In most cases the only arguments are the name of your executable followed by the ones your executable needs. 

When you call `ibrun` without other arguments, your Slurm `#SBATCH` directives will determine the number of ranks (MPI tasks) and number of nodes on which your program runs. Read more on launching MPI, multi-threaded, serial, and hybrid compute jobs on [Stampede3 documentation](https://docs.tacc.utexas.edu/hpc/stampede3/#launching).

# Gromacs Example
GROningen MAchine for Chemical Simulations (GROMACS) is a free, open-source, molecular dynamics package that many research groups use for exploring non-biological systems, such as polymers. It's often advantageous to use GROMACS with MPI to accelerate its algorithms. An example submission script and it's input file are in this directory:

## Required Files:
Submission Script: `gromacs_mpi.sbatch`

Input Data File: `1AKI_clean.pdb`

## Instructions:
1. Copy the required files above to your Stampede3 space. 

2. Submit this GROMACS jobscript.
   
`[login2.stampede3(4)$ ~] sbatch my_gmx.script`
 
4. Monitor your job status with:
   
`[login2.stampede3(4)$ ~] squeue -u myusername`

6. You should have the following output files.
```
1AKI_processed.gro
posre.itp
topol.top
```
