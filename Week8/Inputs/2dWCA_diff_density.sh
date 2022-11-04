#!/bin/bash

module purge
source /scratch/work/courses/CHEM-GA-2671-2022fa/software/lammps-gcc-30Oct2022/setup_lammps.bash
cd ../Data/

densities=(0.5 0.6 0.7 0.8 0.9 1.0 1.1)

for density in "${densities[@]}"
do
    new_dir="2dWCA_density${density}"
    mkdir ${new_dir}
    cd ${new_dir}
    lmp -var density ${density} -in ../../Inputs/2dWCA.in -log logfile_2dWCA_density${density}.log
    cd ..
done