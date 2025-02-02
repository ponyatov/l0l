#include "os.hpp"
#include "cli.hpp"

#ifdef POSIX
struct point3d {
    float x;
    float y;
    float z;
};

void point3d_print(point3d* p) {  //
    printf("p3d(%g;%g;%g)\n", p->x, p->y, p->z);
}
#endif

void setup() {
#ifdef POSIX
    fprintf(stderr, "\tdone\n");
#endif
}

void arg(int argc, char* argv) {
#ifdef POSIX
    if (argc) cli(argv);
#endif
}

void loop() { halt(); }
