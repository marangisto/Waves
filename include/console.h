#pragma once

#include <textio.h>

extern const char *noyes[2];

unsigned menu(const char *s, const char **xs, unsigned n);
void pause(const char *message);

