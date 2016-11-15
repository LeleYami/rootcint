
CFLAGS=$(shell root-config --cflags)
LDFLAGS=$(shell root-config --libs)

all: libSclass.so

libSclass.so: Sclass.o SclassDict.o
	g++ -shared -o $@ $^ $(LDFLAGS)

Sclass.cpp: Sclass.h

SclassDict.cpp: Sclass.h LinkDef.h
	rootcint -f $@ -c $^

%.o: %.cpp
	g++ -c -fPIC -o $@ $^ $(CFLAGS)
