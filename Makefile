SRCFILE = preload.c
LIBFILE = preload.so
LIBFILE_OSX = preload.dylib
TESTFILE = test.sh

$(LIBFILE) : $(SRCFILE)
	gcc $(SRCFILE) -o $(LIBFILE) -shared -fPIC

$(LIBFILE_OSX) : $(SRCFILE)
	gcc $(SRCFILE) -o $(LIBFILE_OSX) -dynamiclib

compile : $(LIBFILE)

compile-osx : $(LIBFILE_OSX)

test : compile $(TESTFILE)
	LD_PRELOAD=$(shell pwd)/$(LIBFILE) bash $(TESTFILE)

test-osx : compile-osx $(TESTFILE)
	DYLD_INSERT_LIBRARIES=$(shell pwd)/$(LIBFILE_OSX) bash $(TESTFILE)

testneg : $(TESTFILE)
	bash $(TESTFILE)

clean :
	rm -f $(LIBFILE) $(LIBFILE_OSX)
