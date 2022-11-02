#!/bin/bash

##### C #####

### Serial case ###

export ARCH_SER_CC=cc
export ARCH_SER_CFLAGS=-g
export ARCH_SER_LFLAGS=-lm

### MPI case ###

export ARCH_MPI_CC=cc
export ARCH_MPI_CFLAGS=-g
export ARCH_MPI_LFLAGS=-lm

### OpenMP case ###

export ARCH_OMP_CC=cc
export ARCH_OMP_CFLAGS=-g
export ARCH_OMP_LFLAGS=-lm

### Shared Mem case ###

export ARCH_SHM_CC=cc
export ARCH_SHM_CFLAGS=-g
export ARCH_SHM_LFLAGS=-lm

### Hybrid case ###

export ARCH_HYB_CC=cc
export ARCH_HYB_CFLAGS=-g
export ARCH_HYB_LFLAGS=-lm


##### Fortran #####

### Serial case ###

export ARCH_SER_FC=cc
export ARCH_SER_FFLAGS=-g

### MPI case ###

export ARCH_SER_FC=cc
export ARCH_SER_FFLAGS=-g

### OpenMP case ###

export ARCH_SER_FC=cc
export ARCH_SER_FFLAGS=-g

### Shared Mem case ###

export ARCH_SER_FC=cc
export ARCH_SER_FFLAGS=-g

### Hybrid case ###

export ARCH_SER_FC=cc
export ARCH_SER_FFLAGS=-g
