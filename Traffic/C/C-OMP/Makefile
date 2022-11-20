MF=	Makefile

CC=${EPCC_OMP_CC}

CFLAGS=${EPCC_OMP_CFLAGS} -O3
LFLAGS=${EPCC_OMP_LFLAGS}

EXE=	traffic

INC= \
	traffic.h \
	uni.h

SRC= \
	traffic.c \
	trafficlib.c \
	uni.c

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

clean:
	rm -f $(OBJ) $(EXE) core
