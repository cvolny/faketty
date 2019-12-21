#include <stdlib.h>

int isatty(int fd) {
    switch (fd) {
        case 0:
        case 1:
        case 2:
            return 1;
    }
    return 0;
}
