#pragma once
/// @defgroup cli cli
/// @brief @ref cli
/// @ingroup core
/// @{

/// @defgroup parser parser
/// @{
#ifdef POSIX
extern char* yyfile;  ///< current file name
extern int yyin;      ///< current file handler
#endif

/// @brief parse disk file
extern void cli(char* filename);

/// @brief parse string in memory
/// @param[in] p data pointer (current position)
/// @param[in] pe data end pointer (end of data)
extern void cli(char* p, char* pe);

/// @}

/// @name commands
/// @{

extern void nop();   ///< `( -- )` do nothing: empty command
extern void halt();  ///< `( -- )` stop system

/// @}

/// @}
