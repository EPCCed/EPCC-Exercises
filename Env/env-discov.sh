#!/bin/bash

ulimit -s unlimited

##### C #####

### Serial case ###

export EPCC_SER_CC=cc
export EPCC_SER_CFLAGS=-g
export EPCC_SER_LFLAGS=-lm

### MPI case ###

module load mpich/3/gcc/latest

export EPCC_MPI_CC=mpicc
export EPCC_MPI_CFLAGS=-g
export EPCC_MPI_LFLAGS=-lm

### OpenMP case ###

export EPCC_OMP_CC=cc
export EPCC_OMP_CFLAGS="-g -fopenmp"
export EPCC_OMP_LFLAGS=-lm

### Shared Mem case ###

export EPCC_SHM_CC=cc
export EPCC_SHM_CFLAGS=-g
export EPCC_SHM_LFLAGS=-lm

### Hybrid case ###

export EPCC_HYB_CC=mpicc
export EPCC_HYB_CFLAGS="-g -fopenmp"
export EPCC_HYB_LFLAGS=-lm

##### Fortran #####

### Serial case ###

export EPCC_SER_FC=cc
export EPCC_SER_FFLAGS=-g

### MPI case ###

export EPCC_MPI_FC=cc
export EPCC_MPI_FFLAGS=-g

### OpenMP case ###

export EPCC_OMP_FC=cc
export EPCC_OMP_FFLAGS=-g

### Shared Mem case ###

export EPCC_SHM_FC=cc
export EPCC_SHM_FFLAGS=-g

### Hybrid case ###

export EPCC_HYB_FC=cc
export EPCC_HYB_FFLAGS=-g
