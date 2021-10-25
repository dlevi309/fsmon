FSMON_VERSION = 1
CC = gcc-iphone
TARGET = fsmon
SRC = src/*.c src/backend/*.c
FLAGS = -std=c99 -Wall -O3 $(CFLAGS)
CFLAGS = -Isrc -DFSMON_VERSION -DTARGET_IOS -framework MobileCoreServices -framework CoreServices
SIGN   := ldid -Sent.xml

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) -o $(TARGET) $(FLAGS) $(SRC)
	$(SIGN) $(TARGET)
