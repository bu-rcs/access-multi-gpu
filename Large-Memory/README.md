# Large Memory Jobs on Bridges-2 EM

To launch a job using the extreme memory (EM) partition on Bridges-2, you must specify the partition and number of cores with the `sbatch` command. 
Note, you can only submit jobs to the EM partition via `ssh`, you cannot submit via an OnDemand session. 

# Example Submission From the Command Line:
This example is requesting a 1-hour session on a node within the EM partition with 1TB memory and 24 cores.
`[user@login005 ~] sbatch -p EM -t 1:00:00 --ntasks-per-node=24 my_compiled_program`
 
# Example Submission Using a Jobscript:
This example is requesting a 1-hour session on a whole-node within the EM partition with 4TB memory and 96 cores. Please open `bridges2-em.job` and `bridges2-em.py` files to review.
`[user@login005 ~] sbatch bridges2-em.job`

# Monitor Job Status:
`[user@login005 ~] squeue -u user`
