CC=gcc
FLAGS=-Wall -g
LIBS=-lm
OBJECTS_MAIN=main.o
OBJECTS_BASIC=basicClassification.o
OBJECTS_LOOP=advancedClassificationLoop.o
OBJECTS_RECURSE=advancedClassificationRecursion.o

all: loops recursives recursived loopd mains maindloop maindrec
loops: libclassloops.a
recursives: libclassrec.a
recursived: libclassrec.so
loopd: libclassloops.so
mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains $(OBJECTS_MAIN) libclassrec.a $(LIBS) # static lib + basic + loop
maindloop: $(OBJECTS_MAIN) libclassloops.so
	$(CC) $(FLAGS) -o maindloop $(OBJECTS_MAIN) ./libclassloops.so $(LIBS) # dynamic lib + basic + loop
maindrec: $(OBJECTS_MAIN) libclassrec.so
	$(CC) $(FLAGS) -o maindrec $(OBJECTS_MAIN) ./libclassrec.so $(LIBS) # dynamic lib + basic + rec
libclassloops.a: $(OBJECTS_LOOP) $(OBJECTS_BASIC)
	ar -rcs libclassloops.a $(OBJECTS_LOOP) $(OBJECTS_BASIC) # static lib for loops
libclassloops.so: $(OBJECTS_LOOP) $(OBJECTS_BASIC)
	$(CC) $(FLAGS) -shared -o libclassloops.so $(OBJECTS_LOOP) $(OBJECTS_BASIC) # dynamic lib for loops
libclassrec.a: $(OBJECTS_RECURSE) $(OBJECTS_BASIC)
	ar -rcs libclassrec.a $(OBJECTS_RECURSE) $(OBJECTS_BASIC) # static lib for recursives
libclassrec.so: $(OBJECTS_RECURSE) $(OBJECTS_BASIC)
	$(CC) $(FLAGS) -shared -o libclassrec.so $(OBJECTS_RECURSE) $(OBJECTS_BASIC) # dynamic lib for recursives
main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c # NumClass libary
basicClassification.o: basicClassification.c
	$(CC) $(FLAGS) -c basicClassification.c $(LIBS) # basic GCC compiling succeeded!
advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) $(FLAGS) -c advancedClassificationLoop.c $(LIBS) # loop GCC compiling succeeded!
advancedClassificationRecursion.o: advancedClassificationRecursion.c
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c # recursion GCC compiling succeeded!

.PHONY: clean all

clean: 
	rm -f *.o *.a *.so mains maindloop maindrec # clean all