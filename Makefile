
CFLAGS=$(shell root-config --cflags)

all: libSclass.so

libSclass.so: Sclass.o SclassDict.o
	echo g++ -o $@

Sclass.cpp: Sclass.h

SclassDict.cpp: Sclass.h LinkDef.h
	rootcint -f $@ -c $^

%.o: %.cpp
	g++ -c -o $@ $^ $(CFLAGS)
