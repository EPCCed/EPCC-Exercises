# System dependent definitions

# For ARCHER
#CC=	cc
#CFLAGS=
#LFLAGS=

# For Cirrus or any standard Linux system
#CC=	icc
#CFLAGS=	-qopenmp
#LFLAGS=	-lm

CC=${EPCC_OMP_CC}

CFLAGS=${EPCC_OMP_CFLAGS}
LFLAGS=${EPCC_OMP_LFLAGS}

# System independent definitions

MF=	Makefile

EXE=	cfd

INC= \
	arraymalloc.h \
	boundary.h \
	cfdio.h \
	jacobi.h

SRC= \
	arraymalloc.c \
	boundary.c \
	cfd.c \
	cfdio.c \
	jacobi.c

#
# No need to edit below this line
#

.SUFFIXES:
.SUFFIXES: .c .o

OBJ=	$(SRC:.c=.o)

.c.o:
	$(CC) $(CFLAGS) -c $<

all:	$(EXE)

$(OBJ):	$(INC)

$(EXE):	$(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LFLAGS)

$(OBJ):	$(MF)

tar:
	tar cvf cfd.tar $(MF) $(INC) $(SRC)

clean:
	rm -f $(OBJ) $(EXE) velocity.dat colourmap.dat cfd.plt core
