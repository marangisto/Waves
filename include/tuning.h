#pragma once

#include <types.h>
#include <algorithm>

static constexpr unsigned OCTAVES = 8;

static inline float adc2cv(const uint16_t tab[OCTAVES], uint16_t x)
{
    unsigned i = std::distance(tab, std::lower_bound(tab, tab + OCTAVES, x));

    i = std::min<unsigned>(OCTAVES - 1, std::max<unsigned>(1, i));

    return 6. - (i + (static_cast<float>(x) - tab[i-1]) / (tab[i] - tab[i-1]));
}

int load_tuning(ch_t ch, uint16_t tab[OCTAVES]);

void auto_tune();

