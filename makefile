ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

BINARIES = $(ROOT_DIR)/bin
CPP_VERSION = 17

DRIVER_SRC = $(ROOT_DIR)/Driver/src
ENGINE_SRC = $(ROOT_DIR)/Engine/src

CPP_FLAGS = 

ENGINE_SOURCES := $(shell find $(ENGINE_SRC) -name '*.cpp')
FILES := $(shell basename $(ENGINE_SOURCES))
OBJECTS := $(patsubst %.cpp,%.o,$(sources))

main: $(BINARIES) $(ENGINE_SOURCES)
	echo !! $(ROOT_DIR) !!
	echo !! $(ENGINE_SOURCES) !!
	echo !! $(FILES) !!
	g++ -std=c++$(CPP_VERSION) $(CPP_FLAGS) $(DRIVER_SRC)/main.cpp -o $(BINARIES)/Driver.exe
	$(BINARIES)/Driver.exe



$(ENGINE_SOURCES):
	g++ -std=c++$(CPP_VERSION) $(CPP_FLAGS) $(DRIVER_SRC)/main.cpp -o $(BINARIES)/$@.exe
 

$(BINARIES):
	mkdir -p $@
