#!/bin/bash

module purge
source /scratch/work/courses/CHEM-GA-2671-2022fa/software/lammps-gcc-30Oct2022/setup_lammps.bash
cd ../Data/

densities=(0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5)

for density in "${densities[@]}"
do
    new_dir="3dWCA_density${density}"
    mkdir ${new_dir}
    cd ${new_dir}
    lmp -var density ${density} -in ../../Inputs/3dWCA.in -log logfile_3dWCA_density${density}.log
    cd ..
done