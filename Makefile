MOVE = mv
DIR_INC = ./include
DIR_OBJ = ./obj
CC = gcc
CFLAGS = -g -Wall -I${DIR_INC}

TARGET = main


DIRS_Spk   += src
#DIRS_Spk   += src/part1


DIR_FILES  = $(foreach dir, $(DIRS_Spk),$(wildcard $(dir)/*.c))
DIR_OBJS   = $(patsubst %.c,%.o,$(DIR_FILES))


$(ALL):$(TARGET)

$(TARGET):$(DIR_OBJS)
	$(CC) -o $(TARGET) $(DIR_OBJS) $(CFLAGES)
	-$(MOVE) $(DIR_OBJS) ./$(DIR_OBJ)
	
.PHONY:clean
clean:
	find ${DIR_OBJ} -name *.o | xargs rm -rf {}
	rm -rf ${TARGET}

