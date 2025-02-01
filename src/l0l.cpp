#include "os.hpp"

struct point3d {
    float x;
    float y;
    float z;
};

void point3d_print(point3d* p) {  //
    printf("p3d(%g;%g;%g)\n", p->x, p->y, p->z);
}
