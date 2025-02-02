#include "os.hpp"
#include "cli.hpp"

struct point3d {
    float x;
    float y;
    float z;
};

void point3d_print(point3d* p) {  //
    printf("p3d(%g;%g;%g)\n", p->x, p->y, p->z);
}

void setup() { fprintf(stderr, "\tdone\n"); }

void arg(int argc, char* argv) {
    fprintf(stderr, "\t%i\t%s\n", argc, argv);
    if (argc) cli(argv);
}

void loop() { halt(); }
