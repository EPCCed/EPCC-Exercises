MF=	Makefile

#COMPILER

# On ARCHER, cc is a wrapper for whichever C compiler - GNU (gcc),
# Intel (icc), or Cray (craycc) - has been chosen by loading the
# appropriate PrgEnv module prior to compilation.

#CC=	cc
#CFLAGS=	-g -DC_MPI_PRACTICAL
#LFLAGS=	-lm

#For Cirrus use mpicc
#CC=	mpicc
#CFLAGS=	-cc=icc -g -DC_MPI_PRACTICAL
#LFLAGS=	-lm

EXE=	sharpen

SRC= \
	sharpen.c \
	dosharpen.c \
	../C-Common/filter.c \
	../C-Common/cio.c \
	../C-Common/utilities.c

INC = \
	sharpen.h \
	../C-Common/utilities.h

#
# No need to edit below this line
#

.SUFFIXES:
.SUFFIXES: .c .o

RSRC=	$(notdir $(SRC))

ROBJ=	$(RSRC:.c=.o)

OBJ=	$(SRC:.c=.o)

.c.o:
	$(CC) $(CFLAGS) -c $<

all:	$(EXE)

$(EXE):	$(ROBJ)
	$(CC) $(CFLAGS) -o $@ $(ROBJ) $(LFLAGS) 

$(OBJ):	$(MF) $(INC)

clean:
	rm -f $(ROBJ) $(EXE) core
