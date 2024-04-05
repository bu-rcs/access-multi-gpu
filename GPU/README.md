# Access GPU examples

This repository contains two example codes that demonstrate how to run multi-GPU
distributed node computations. These codes have been designed and tested on the NCSA Delta
cluster at the University of Illinois. It should be possible to adopt these codes
to run on other clusters that use the SLURM batch system.

The repository contains the following sub-directories:

- DistributedReduceAll
- DistributedTraining

Both subdirectories contain a python script and accompanying SLURM batch submission script.
The codes use Pytorch and the Distributed Data Parallel (DDPO classe to parallelize
the computations. See the Pytorch DDP [documentation](https://pytorch.org/tutorials/intermediate/ddp_tutorial.html) 
for more details on how to use this class.

## Distributed Reduce All

This code distributes vectors to all of the GPUs. A reduce all operation is applied
which sums the vectors on eac GPU and stores a copy of the sum on each GPU.

## Distributed Training

This code trains a deep learning model on GPUs that are distributed on multiple
nodes. The model is replicated on each GPU but the minibatches are distributed
in parallel to each GPU.

## SLURM 

Batch jobs are submitted on a SLURM cluster using the command:

```sbatch slurm_script.slurm```

where `slurm_script.slurm` is the batch submission script.

Below are a subset of the SLURM resources you can request for your batch job.
See the batch scripts in the sub-repositories for resources that are specific to NCSA Delta.

```
#SBATCH --job-name="job_name" # name of the job
#SBATCH --partition=cluster_partition_name # specify the cluster partition name
#SBATCH --nodes=2 # specify the number of nodes
#SBATCH --gpus-per-node=2 # specify gpus-per-node, must equal ntasks-per-node
#SBATCH --ntasks-per-node=2 # specify ntasks-per-node, must equal gpus-per-node
#SBATCH --cpus-per-task=8 # specify cpus per task
#SBATCH --account=your-account-name # specify account name
#SBATCH -t 12:00:00 # specify length of job 
#SBATCH --mail-user=your_email@bu.edu # specify email
#SBATCH --mail-type="BEGIN,END" # specify when to be emailed
```

For Pytorch distributed programs the following environment variables need to be
defined:

- `WORLD_SIZE` - total number of GPUS. For 2 nodes with 4 GPUS each the world size is 8
- `MASTER_ADDRESS` - the IP address of the rank 0 node
- `MASTER_PORT` - the port of the rank 0 node