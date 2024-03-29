#!/bin/bash
#SBATCH --job-name="pytorch_distributed_reduce_all"
#SBATCH --partition=gpuA100x4 # specify GPU partition
#SBATCH --mem=32G # specify memory
#SBATCH --nodes=2 # specify the number of nodes
#SBATCH --gpus-per-node=2 # specify gpus-per-node, must equal ntasks-per-node
#SBATCH --ntasks-per-node=2 # specify ntasks-per-node, must equal gpus-per-node
#SBATCH --cpus-per-task=8 # specify cpus per task
#SBATCH --gpu-bind=closest   # select a cpu close to gpu on pci bus topology
#SBATCH --account=your-account-name # specify account name
#SBATCH -t 12:00:00 # specify length of job 
#SBATCH --mail-user=your_email@bu.edu # specify email address
#SBATCH --mail-type="BEGIN,END" # specify when to be emailed

echo "SLURM_NTASK_PER_NODE="$SLURM_NTASKS_PER_NODE
# WORLD_SIZE is the number of nodes x tasks (gpus) per node
export WORLD_SIZE=$(($SLURM_NNODES * $SLURM_NTASKS_PER_NODE))
echo "WORLD_SIZE="$WORLD_SIZE

# Have to set the MASTER_ADDR and MASTER_PORT for pytorch distributed operations
master_addr=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
export MASTER_ADDR=$master_addr
export MASTER_PORT=12355
echo "MASTER_ADDR="$MASTER_ADDR
echo "MASTER_PORT="$MASTER_PORT

# Load modules on Delta
module load anaconda3_gpu
module load nccl/2.19.3-1

srun python pytorch_distributed_training.py --epochs=2
