#define _GNU_SOURCE
#define ONAME isatty

#if __APPLE__
    #define NAME _isatty
    #include <unistd.h>
#else
    #define NAME isatty
    #include <stdlib.h>
#endif

int NAME(int fd) {
    switch (fd) {
        case 0:
        case 1:
        case 2:
            return 1;
    }
    return 0;
}

#if __APPLE__
    #define DYLD_INTERPOSE(_replacment,_replacee) \
        __attribute__((used)) static struct{ const void* replacment; const void* replacee; } _interpose_##_replacee \
        __attribute__ ((section ("__DATA,__interpose"))) = { (const void*)(unsigned long)&_replacment, (const void*)(unsigned long)&_replacee };

    DYLD_INTERPOSE(NAME, ONAME);
#endif
