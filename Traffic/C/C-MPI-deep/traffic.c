#include <stdlib.h>
#include <stdio.h>

#include "traffic.h"

#define NCELL 100000

int main(int argc, char **argv)
{
  int *oldroad, *newroad, *bigroad;

  int i, iter, nmove, ncars;
  int maxiter, printfreq; 

  int doswap;

  float density; 

  double tstart, tstop;

  int procid, nproc, nlocal;

  maxiter = 200000000/NCELL; 
  printfreq = maxiter/10; 

  // Set target density of cars

  density = 0.52;

  // Start message passing system

  mpstart(&nproc, &procid);

  if (procid == 0)
    {
      printf("Length of road is %d\n", NCELL);
      printf("Number of iterations is %d \n", maxiter);
      printf("Target density of cars is %f \n", density);
      printf("Running on %d processes\n", nproc);
    }

  nlocal = NCELL/nproc;

  oldroad = (int *) malloc((nlocal+4)*sizeof(int));
  newroad = (int *) malloc((nlocal+4)*sizeof(int));

  for (i=0; i < nlocal+4; i++)
    {
      oldroad[i] = 0;
      newroad[i] = 0;
    }

  if (procid == 0)
    {
      bigroad = (int *) malloc(NCELL*sizeof(int));

      // Initialise road accordingly using random number generator

      printf("Initialising road ...\n");
  
      ncars = initroad(bigroad, NCELL, density, SEED);

      printf("...done\n");
      printf("Actual density is %f\n", (float) ncars / (float) NCELL);
      printf("Scattering data ...\n");
    }

  mpscatter(bigroad, &oldroad[2], nlocal);

  if (procid == 0)
    {
      printf("... done\n\n");
    }


  //  printf("procid %d: ", procid);
  //  for (i=0; i < nlocal+4; i++)
  //    {
  //      printf("%1d ", oldroad[i]);
  //    }
  //  printf("\n\n");
	  
  tstart = gettime();

  for (iter=1; iter<=maxiter; iter++)
    { 
      doswap = iter%2;

      if (doswap)
	{
	  //	  printf("calling swap\n");
	  mpupdatebcs(oldroad, nlocal, procid, nproc);
	}

      //      printf("procid %d: ", procid);
      //      for (i=0; i < nlocal+4; i++)
      //	{
      //	  printf("%1d ", oldroad[i]);
      //	}
      //      printf("\n\n");

      // Apply CA rules to all cells

      nmove = updateroad(&newroad[1-doswap], &oldroad[1-doswap], nlocal+2*doswap);

      //      printf("procid %d: ", procid);
      //      for (i=0; i < nlocal+4; i++)
      //	{
      //	  printf("%1d ", newroad[i]);
      //	}
      //      printf("\n\n");

      // Globally sum the value

      mpgsum(&nmove);

      // Copy new to old array

      for (i=2-doswap; i<=nlocal+1+doswap; i++)
	{
	  oldroad[i] = newroad[i]; 
	}

      if (iter%printfreq == 0)
	{
	  if (procid == 0)
	    {
	      printf("At iteration %d average velocity is %f \n",
		     iter, (float) nmove / (float) ncars);
	    }
	} 
    }

  tstop = gettime();

  //  free(oldroad);
  //  free(newroad);

  if (procid == 0)
    {
      //      free(bigroad);

      printf("\nFinished\n");
      printf("\nTime taken was  %f seconds\n", tstop-tstart);
      printf("Update rate was %f MCOPs\n", \
	     1.e-6*((double) NCELL)*((double) maxiter)/(tstop-tstart));
    }

  mpstop();
}
