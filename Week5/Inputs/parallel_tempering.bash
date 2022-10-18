#!/bin/bash

# run parallel tempering for 4 temperatures

# load gromacs
module purge
module load gromacs/openmpi/intel/2018.3

# set paremeters for parallel tempering
temperature=(300 400 500 600)
deltaT=100
ns=20
# calculate number of steps
steps=$(echo "${ns} * 1000 / 0.002" | bc)
folders=()
# loop over temperatures to create md input files
for t in "${temperature[@]}"
do
    t_dir="dT${deltaT}_${ns}ns_T${t}"
    mkdir ${t_dir}
    cp adp.gro ${t_dir}/
    cp adp.top ${t_dir}/
    cp adp_T300.mdp ${t_dir}/adp_t${t}.mdp
    # replace the ref_t in the mdp file with the current temperature
    sed -i "s/ref_t               = 300.000/ref_t               = ${t}.000/g" ${t_dir}/adp_t${t}.mdp
    sed -i "s/gen_temp            = 300.000/gen_temp            = ${t}.000/g" ${t_dir}/adp_t${t}.mdp
    sed -i "s/nsteps              =  2500000/nsteps               = ${steps}/g" ${t_dir}/adp_t${t}.mdp
    gmx_mpi grompp -f ${t_dir}/adp_t${t}.mdp -c ${t_dir}/adp.gro -p ${t_dir}/adp.top -o ${t_dir}/adp.tpr
    folders+=(${t_dir})
done

# run a parallel tempering simulation that exchanges every 100 fs
mpirun -np 4 gmx_mpi mdrun -s adp -multidir ${folders[@]} -deffnm adp_exchange4temps -replex 50 