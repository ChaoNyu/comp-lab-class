# Setup

This directory contains the setup steps of the MD simulation of the lysozyme protein. The setup steps are organized as follows:
- box_solv (step 1)
    - `1AKI_newbox.gro`: The structure file where the protein is in a box.
    - `1AKI_solv.gro`: The structure file where the box filled with solvent (water).
- add_ions (step 2)
    - `ions.mdp`: parameters used as input into grompp to generate ions.tpr
    - `ions.tpr`: tpr file for adding ions
    - `1AKI_solv_ions.gro`: The structure file where the box filled with solvent (water) and ions.
- energy_minimization (step 3)
    - `energy_minim.mdp`: parameters used as input into grompp to generate energy_minim.tpr
    - `energy_minim.tpr`: tpr file for energy minimization
    - `energy_minim.log`: ASCII-text log file of the energy minimization process
    - `energy_minim.edr`: Binary file containing energy information
    - `energy_minim.trr`: Binary full-precision trajectory
    - `energy_minim.gro`: Energy-minimized structure
    - `energy_minim_potential.xvg`: Potential energy vs. time
- nvt_equilibration (step 4)
    - `nvt_equilibration.mdp`: parameters used as input into grompp to generate nvt_equilibration.tpr
    - `nvt_equilibration.tpr`: tpr file for nvt equilibration
    - `nvt_equilibration.log`: ASCII-text log file of the nvt equilibration process
    - `nvt_equilibration.edr`: Binary file containing energy information
    - `nvt_equilibration.trr`: Binary full-precision trajectory
    - `nvt_equilibration.gro`: nvt equilibrated structure
    - `nvt_equilibration.cpt`: Checkpoint file
    - `nvt_temperature.xvg`: Temperature vs. time
- npt_equilibration (step 5)
    - `npt_equilibration.mdp`: parameters used as input into grompp to generate npt_equilibration.tpr
    - `npt_equilibration.tpr`: tpr file for npt equilibration
    - `npt_equilibration.log`: ASCII-text log file of the npt equilibration process
    - `npt_equilibration.edr`: Binary file containing energy information
    - `npt_equilibration.trr`: Binary full-precision trajectory
    - `npt_equilibration.gro`: npt equilibrated structure
    - `npt_equilibration.cpt`: Checkpoint file