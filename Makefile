VERSION = 1.8.5

CC = cc
TARGET = fsmon
SRC = src/*.c src/backend/*.c
FLAGS = -std=c99 -Wall -O3 $(CFLAGS)
CFLAGS = -Isrc -DFSMON_VERSION=\"$(VERSION)\" -DTARGET_IOS -D__APPLE__ -framework MobileCoreServices -framework CoreServices -framework CoreFoundation
SIGN   := ldid -Sent.xml

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) -o $(TARGET) $(FLAGS) $(SRC)
	$(SIGN) $(TARGET)
