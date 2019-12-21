SRCFILE = preload.c
LIBFILE = preload.so
TESTFILE = test.sh

$(LIBFILE) : $(SRCFILE)
	gcc $(SRCFILE) -o $(LIBFILE) -shared -fPIC

compile : $(LIBFILE)

test : compile $(TESTFILE)
	LD_PRELOAD=$(shell pwd)/$(LIBFILE) bash $(TESTFILE)

testneg : $(TESTFILE)
	bash $(TESTFILE)

clean :
	rm $(LIBFILE)
