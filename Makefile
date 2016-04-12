CC = gcc
MOVE = mv

DIR_INC = ./include
DIR_OBJ = ./obj

#DIR_INC_CURL = 
#DIR_LIB_CURL = 

CFLAGS = -g -Wall -I$(DIR_INC) #-I$(DIR_INC_CURL)
LDFLAGS = #-L$(DIR_LIB_CURL)
LIBS = #-lcurl



TARGET = main


DIRS_SRC   += src
#DIRS_SRC   += src/part1


DIR_FILES  = $(foreach dir, $(DIRS_SRC),$(wildcard $(dir)/*.c))
DIR_OBJS   = $(patsubst %.c,%.o,$(DIR_FILES))


$(ALL):$(TARGET)

$(TARGET):$(DIR_OBJS)
	$(CC) -o $(TARGET) $(DIR_OBJS) $(CFLAGS) $(LDFLAGS) $(LIBS)
	-$(MOVE) $(DIR_OBJS) ./$(DIR_OBJ)
	


.PHONY:clean
clean:
	find ${DIR_OBJ} -name *.o | xargs rm -rf {}
	rm -rf ${TARGET}

