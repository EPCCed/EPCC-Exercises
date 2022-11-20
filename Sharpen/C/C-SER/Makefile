MF=	Makefile

CC=${EPCC_SER_CC} 

CFLAGS=${EPCC_SER_CFLAGS} -DC_SERIAL_PRACTICAL

LFLAGS=${EPCC_SER_LFLAGS}

EXE=	sharpen

SRC= \
	sharpen.c \
	dosharpen.c \
	filter.c \
	cio.c \
	utilities.c

INC = \
	sharpen.h \
	utilities.h

#
# No need to edit below this line
#

.SUFFIXES:
.SUFFIXES: .c .o

OBJ=	$(SRC:.c=.o)

.c.o:
	$(CC) $(CFLAGS) -c $<

all:	$(EXE)

$(EXE):	$(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LFLAGS)

$(OBJ):	$(MF) $(INC)

clean:
	rm -f $(OBJ) $(EXE) core
