#ifndef CORTEX
#error MCU only
#endif

void nop() {}
void halt() { for (;;); }
