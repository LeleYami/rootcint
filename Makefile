
CFLAGS=$(shell root-config --cflags)
LDFLAGS=$(shell root-config --libs)

all: libSclass.so read_write

read_write: libSclass.so read_write.o
	g++ -o $@ $^ $(LDFLAGS)

libSclass.so: Sclass.o SclassDict.o
	g++ -shared -o $@ $^ $(LDFLAGS)

Sclass.cpp: Sclass.h

SclassDict.cpp: Sclass.h LinkDef.h
	rootcint -f $@ -c $^

%.o: %.cpp
	g++ -c -fPIC -o $@ $^ $(CFLAGS)

#############################################################################
# Run the command
#############################################################################
run_read_write: read_write
	@LD_LIBRARY_PATH=.:${LD_LIBRARY_PATH} ./read_write
