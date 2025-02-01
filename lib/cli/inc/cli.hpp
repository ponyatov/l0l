#pragma once
/// @defgroup cli cli
/// @brief @ref cli
/// @ingroup core
/// @{

/// @defgroup parser parser
/// @{
#ifdef POSIX
extern char* yyfile;  ///< current file name
extern int yyin;    ///< current file handler
#endif
/// @}

extern void cli(char* filename);  ///< process command line
extern void cli(char* p, char *pe);///< process string in memory

extern void bye();  ///< `( -- )` stop system
/// @}
