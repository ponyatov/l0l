#include "os.hpp"
#include "cli.hpp"

#ifdef POSIX
int main(int argc, char *argv[]) {
    fprintf(stderr, "setup:\n");
    setup();
    fprintf(stderr, "arg:\n");
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {
        fprintf(stderr, "\targ[%i] = <%s>\n", argc, argv);
        arg(i, argv[i]);
    }
    fprintf(stderr, "loop:\n");
    for (;;) loop();
    return 0;
}
#endif  // POSIX

__attribute__((weak)) void setup() {}

__attribute__((weak)) void arg(int argc, char *argv) {}

__attribute__((weak)) void loop() { nop(); }
