#include "os.hpp"
#include "cli.hpp"

int main(int argc, char *argv[]) {
    setup();
    fprintf(stderr, "arg:\n");
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {
        arg(i, argv[i]);
        cli(argv[i]);
    }
    for (;;) loop();
    return 0;
}

extern void arg(int argc, char *argv) {  //
    fprintf(stderr, "\targ[%i] = <%s>\n", argc, argv);
}

void setup() {  //
    fprintf(stderr, "setup:\n");
}

#include "cli.hpp"

void loop() {
    fprintf(stderr, "loop:\n");
    halt();
}
