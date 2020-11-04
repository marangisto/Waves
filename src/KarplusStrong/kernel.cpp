#include <fixed.h>

// Gaussian kernels normalized to 1 in Q31 fixed point format.

using namespace fixed;

constexpr q31_t gauss_kernel_1[2] = 
    { q31_t(0x40000000l), q31_t(0x40000000l)
    };

constexpr q31_t gauss_kernel_2[3] = 
    { q31_t(0x20000000l), q31_t(0x40000000l), q31_t(0x20000000l)
    };

constexpr q31_t gauss_kernel_3[4] = 
    { q31_t(0x10000000l), q31_t(0x30000000l), q31_t(0x30000000l)
    , q31_t(0x10000000l)
    };

constexpr q31_t gauss_kernel_4[5] = 
    { q31_t(0x8000000l), q31_t(0x20000000l), q31_t(0x30000000l)
    , q31_t(0x20000000l), q31_t(0x8000000l)
    };

constexpr q31_t gauss_kernel_5[6] = 
    { q31_t(0x4000000l), q31_t(0x14000000l), q31_t(0x28000000l)
    , q31_t(0x28000000l), q31_t(0x14000000l), q31_t(0x4000000l)
    };

constexpr q31_t gauss_kernel_6[7] = 
    { q31_t(0x2000000l), q31_t(0xc000000l), q31_t(0x1e000000l)
    , q31_t(0x28000000l), q31_t(0x1e000000l), q31_t(0xc000000l)
    , q31_t(0x2000000l)
    };

constexpr q31_t gauss_kernel_7[8] = 
    { q31_t(0x1000000l), q31_t(0x7000000l), q31_t(0x15000000l)
    , q31_t(0x23000000l), q31_t(0x23000000l), q31_t(0x15000000l)
    , q31_t(0x7000000l), q31_t(0x1000000l)
    };

constexpr q31_t gauss_kernel_8[9] = 
    { q31_t(0x800000l), q31_t(0x4000000l), q31_t(0xe000000l)
    , q31_t(0x1c000000l), q31_t(0x23000000l), q31_t(0x1c000000l)
    , q31_t(0xe000000l), q31_t(0x4000000l), q31_t(0x800000l)
    };

constexpr q31_t gauss_kernel_9[10] = 
    { q31_t(0x400000l), q31_t(0x2400000l), q31_t(0x9000000l)
    , q31_t(0x15000000l), q31_t(0x1f800000l), q31_t(0x1f800000l)
    , q31_t(0x15000000l), q31_t(0x9000000l), q31_t(0x2400000l)
    , q31_t(0x400000l)
    };

constexpr q31_t gauss_kernel_10[11] = 
    { q31_t(0x200000l), q31_t(0x1400000l), q31_t(0x5a00000l)
    , q31_t(0xf000000l), q31_t(0x1a400000l), q31_t(0x1f800000l)
    , q31_t(0x1a400000l), q31_t(0xf000000l), q31_t(0x5a00000l)
    , q31_t(0x1400000l), q31_t(0x200000l)
    };

constexpr q31_t gauss_kernel_11[12] = 
    { q31_t(0x100000l), q31_t(0xb00000l), q31_t(0x3700000l)
    , q31_t(0xa500000l), q31_t(0x14a00000l), q31_t(0x1ce00000l)
    , q31_t(0x1ce00000l), q31_t(0x14a00000l), q31_t(0xa500000l)
    , q31_t(0x3700000l), q31_t(0xb00000l), q31_t(0x100000l)
    };

constexpr q31_t gauss_kernel_12[13] = 
    { q31_t(0x80000l), q31_t(0x600000l), q31_t(0x2100000l)
    , q31_t(0x6e00000l), q31_t(0xf780000l), q31_t(0x18c00000l)
    , q31_t(0x1ce00000l), q31_t(0x18c00000l), q31_t(0xf780000l)
    , q31_t(0x6e00000l), q31_t(0x2100000l), q31_t(0x600000l)
    , q31_t(0x80000l)
    };

constexpr q31_t gauss_kernel_13[14] = 
    { q31_t(0x40000l), q31_t(0x340000l), q31_t(0x1380000l)
    , q31_t(0x4780000l), q31_t(0xb2c0000l), q31_t(0x141c0000l)
    , q31_t(0x1ad00000l), q31_t(0x1ad00000l), q31_t(0x141c0000l)
    , q31_t(0xb2c0000l), q31_t(0x4780000l), q31_t(0x1380000l)
    , q31_t(0x340000l), q31_t(0x40000l)
    };

constexpr q31_t gauss_kernel_14[15] = 
    { q31_t(0x20000l), q31_t(0x1c0000l), q31_t(0xb60000l)
    , q31_t(0x2d80000l), q31_t(0x7d20000l), q31_t(0xfa40000l)
    , q31_t(0x17760000l), q31_t(0x1ad00000l), q31_t(0x17760000l)
    , q31_t(0xfa40000l), q31_t(0x7d20000l), q31_t(0x2d80000l)
    , q31_t(0xb60000l), q31_t(0x1c0000l), q31_t(0x20000l)
    };

constexpr q31_t gauss_kernel_15[16] = 
    { q31_t(0x10000l), q31_t(0xf0000l), q31_t(0x690000l)
    , q31_t(0x1c70000l), q31_t(0x5550000l), q31_t(0xbbb0000l)
    , q31_t(0x138d0000l), q31_t(0x19230000l), q31_t(0x19230000l)
    , q31_t(0x138d0000l), q31_t(0xbbb0000l), q31_t(0x5550000l)
    , q31_t(0x1c70000l), q31_t(0x690000l), q31_t(0xf0000l)
    , q31_t(0x10000l)
    };

constexpr q31_t gauss_kernel_16[17] = 
    { q31_t(0x8000l), q31_t(0x80000l), q31_t(0x3c0000l)
    , q31_t(0x1180000l), q31_t(0x38e0000l), q31_t(0x8880000l)
    , q31_t(0xfa40000l), q31_t(0x16580000l), q31_t(0x19230000l)
    , q31_t(0x16580000l), q31_t(0xfa40000l), q31_t(0x8880000l)
    , q31_t(0x38e0000l), q31_t(0x1180000l), q31_t(0x3c0000l)
    , q31_t(0x80000l), q31_t(0x8000l)
    };

constexpr q31_t gauss_kernel_17[18] = 
    { q31_t(0x4000l), q31_t(0x44000l), q31_t(0x220000l)
    , q31_t(0xaa0000l), q31_t(0x2530000l), q31_t(0x60b0000l)
    , q31_t(0xc160000l), q31_t(0x12fe0000l), q31_t(0x17bd8000l)
    , q31_t(0x17bd8000l), q31_t(0x12fe0000l), q31_t(0xc160000l)
    , q31_t(0x60b0000l), q31_t(0x2530000l), q31_t(0xaa0000l)
    , q31_t(0x220000l), q31_t(0x44000l), q31_t(0x4000l)
    };

constexpr q31_t gauss_kernel_18[19] = 
    { q31_t(0x2000l), q31_t(0x24000l), q31_t(0x132000l)
    , q31_t(0x660000l), q31_t(0x17e8000l), q31_t(0x42f0000l)
    , q31_t(0x9108000l), q31_t(0xf8a0000l), q31_t(0x155dc000l)
    , q31_t(0x17bd8000l), q31_t(0x155dc000l), q31_t(0xf8a0000l)
    , q31_t(0x9108000l), q31_t(0x42f0000l), q31_t(0x17e8000l)
    , q31_t(0x660000l), q31_t(0x132000l), q31_t(0x24000l)
    , q31_t(0x2000l)
    };

constexpr q31_t gauss_kernel_19[20] = 
    { q31_t(0x1000l), q31_t(0x13000l), q31_t(0xab000l)
    , q31_t(0x3c9000l), q31_t(0xf24000l), q31_t(0x2d6c000l)
    , q31_t(0x69fc000l), q31_t(0xc4d4000l), q31_t(0x1273e000l)
    , q31_t(0x168da000l), q31_t(0x168da000l), q31_t(0x1273e000l)
    , q31_t(0xc4d4000l), q31_t(0x69fc000l), q31_t(0x2d6c000l)
    , q31_t(0xf24000l), q31_t(0x3c9000l), q31_t(0xab000l)
    , q31_t(0x13000l), q31_t(0x1000l)
    };

constexpr q31_t gauss_kernel_20[21] = 
    { q31_t(0x800l), q31_t(0xa000l), q31_t(0x5f000l)
    , q31_t(0x23a000l), q31_t(0x976800l), q31_t(0x1e48000l)
    , q31_t(0x4bb4000l), q31_t(0x9768000l), q31_t(0xf609000l)
    , q31_t(0x1480c000l), q31_t(0x168da000l), q31_t(0x1480c000l)
    , q31_t(0xf609000l), q31_t(0x9768000l), q31_t(0x4bb4000l)
    , q31_t(0x1e48000l), q31_t(0x976800l), q31_t(0x23a000l)
    , q31_t(0x5f000l), q31_t(0xa000l), q31_t(0x800l)
    };

constexpr q31_t gauss_kernel_21[22] = 
    { q31_t(0x400l), q31_t(0x5400l), q31_t(0x34800l)
    , q31_t(0x14c800l), q31_t(0x5d8400l), q31_t(0x13df400l)
    , q31_t(0x34fe000l), q31_t(0x718e000l), q31_t(0xc6b8800l)
    , q31_t(0x11f0a800l), q31_t(0x15873000l), q31_t(0x15873000l)
    , q31_t(0x11f0a800l), q31_t(0xc6b8800l), q31_t(0x718e000l)
    , q31_t(0x34fe000l), q31_t(0x13df400l), q31_t(0x5d8400l)
    , q31_t(0x14c800l), q31_t(0x34800l), q31_t(0x5400l)
    , q31_t(0x400l)
    };

constexpr q31_t gauss_kernel_22[23] = 
    { q31_t(0x200l), q31_t(0x2c00l), q31_t(0x1ce00l), q31_t(0xc0800l)
    , q31_t(0x392600l), q31_t(0xcdbc00l), q31_t(0x246ea00l)
    , q31_t(0x5346000l), q31_t(0x9c23400l), q31_t(0xf2e1800l)
    , q31_t(0x13bbec00l), q31_t(0x15873000l), q31_t(0x13bbec00l)
    , q31_t(0xf2e1800l), q31_t(0x9c23400l), q31_t(0x5346000l)
    , q31_t(0x246ea00l), q31_t(0xcdbc00l), q31_t(0x392600l)
    , q31_t(0xc0800l), q31_t(0x1ce00l), q31_t(0x2c00l), q31_t(0x200l)
    };

constexpr q31_t gauss_kernel_23[24] = 
    { q31_t(0x100l), q31_t(0x1700l), q31_t(0xfd00l), q31_t(0x6eb00l)
    , q31_t(0x229700l), q31_t(0x837100l), q31_t(0x18a5300l)
    , q31_t(0x3bda500l), q31_t(0x77b4a00l), q31_t(0xc782600l)
    , q31_t(0x11750200l), q31_t(0x14a18e00l), q31_t(0x14a18e00l)
    , q31_t(0x11750200l), q31_t(0xc782600l), q31_t(0x77b4a00l)
    , q31_t(0x3bda500l), q31_t(0x18a5300l), q31_t(0x837100l)
    , q31_t(0x229700l), q31_t(0x6eb00l), q31_t(0xfd00l)
    , q31_t(0x1700l), q31_t(0x100l)
    };

constexpr q31_t gauss_kernel_24[25] = 
    { q31_t(0x80l), q31_t(0xc00l), q31_t(0x8a00l), q31_t(0x3f400l)
    , q31_t(0x14c100l), q31_t(0x530400l), q31_t(0x106e200l)
    , q31_t(0x2a3fc00l), q31_t(0x59c7780l), q31_t(0x9f9b800l)
    , q31_t(0xef69400l), q31_t(0x130b4800l), q31_t(0x14a18e00l)
    , q31_t(0x130b4800l), q31_t(0xef69400l), q31_t(0x9f9b800l)
    , q31_t(0x59c7780l), q31_t(0x2a3fc00l), q31_t(0x106e200l)
    , q31_t(0x530400l), q31_t(0x14c100l), q31_t(0x3f400l)
    , q31_t(0x8a00l), q31_t(0xc00l), q31_t(0x80l)
    };

constexpr q31_t gauss_kernel_25[26] = 
    { q31_t(0x40l), q31_t(0x640l), q31_t(0x4b00l), q31_t(0x23f00l)
    , q31_t(0xc5a80l), q31_t(0x33e280l), q31_t(0xacf300l)
    , q31_t(0x1d56f00l), q31_t(0x42039c0l), q31_t(0x7cb17c0l)
    , q31_t(0xc782600l), q31_t(0x1100ee00l), q31_t(0x13d66b00l)
    , q31_t(0x13d66b00l), q31_t(0x1100ee00l), q31_t(0xc782600l)
    , q31_t(0x7cb17c0l), q31_t(0x42039c0l), q31_t(0x1d56f00l)
    , q31_t(0xacf300l), q31_t(0x33e280l), q31_t(0xc5a80l)
    , q31_t(0x23f00l), q31_t(0x4b00l), q31_t(0x640l), q31_t(0x40l)
    };

constexpr q31_t gauss_kernel_26[27] = 
    { q31_t(0x20l), q31_t(0x340l), q31_t(0x28a0l), q31_t(0x14500l)
    , q31_t(0x74cc0l), q31_t(0x201e80l), q31_t(0x706ac0l)
    , q31_t(0x1413100l), q31_t(0x2fad460l), q31_t(0x5f5a8c0l)
    , q31_t(0xa219ee0l), q31_t(0xebc8a00l), q31_t(0x126bac80l)
    , q31_t(0x13d66b00l), q31_t(0x126bac80l), q31_t(0xebc8a00l)
    , q31_t(0xa219ee0l), q31_t(0x5f5a8c0l), q31_t(0x2fad460l)
    , q31_t(0x1413100l), q31_t(0x706ac0l), q31_t(0x201e80l)
    , q31_t(0x74cc0l), q31_t(0x14500l), q31_t(0x28a0l), q31_t(0x340l)
    , q31_t(0x20l)
    };

constexpr q31_t gauss_kernel_27[28] = 
    { q31_t(0x10l), q31_t(0x1b0l), q31_t(0x15f0l), q31_t(0xb6d0l)
    , q31_t(0x448e0l), q31_t(0x13b5a0l), q31_t(0x4844a0l)
    , q31_t(0xd8cde0l), q31_t(0x21e02b0l), q31_t(0x4783e90l)
    , q31_t(0x80ba3d0l), q31_t(0xc6f1470l), q31_t(0x10941b40l)
    , q31_t(0x13210bc0l), q31_t(0x13210bc0l), q31_t(0x10941b40l)
    , q31_t(0xc6f1470l), q31_t(0x80ba3d0l), q31_t(0x4783e90l)
    , q31_t(0x21e02b0l), q31_t(0xd8cde0l), q31_t(0x4844a0l)
    , q31_t(0x13b5a0l), q31_t(0x448e0l), q31_t(0xb6d0l)
    , q31_t(0x15f0l), q31_t(0x1b0l), q31_t(0x10l)
    };

constexpr q31_t gauss_kernel_28[29] = 
    { q31_t(0x8l), q31_t(0xe0l), q31_t(0xbd0l), q31_t(0x6660l)
    , q31_t(0x27fd8l), q31_t(0xbff40l), q31_t(0x2dfd20l)
    , q31_t(0x908940l), q31_t(0x17b6848l), q31_t(0x34b20a0l)
    , q31_t(0x641f130l), q31_t(0xa3d5c20l), q31_t(0xe8197d8l)
    , q31_t(0x11da9380l), q31_t(0x13210bc0l), q31_t(0x11da9380l)
    , q31_t(0xe8197d8l), q31_t(0xa3d5c20l), q31_t(0x641f130l)
    , q31_t(0x34b20a0l), q31_t(0x17b6848l), q31_t(0x908940l)
    , q31_t(0x2dfd20l), q31_t(0xbff40l), q31_t(0x27fd8l)
    , q31_t(0x6660l), q31_t(0xbd0l), q31_t(0xe0l), q31_t(0x8l)
    };

constexpr q31_t gauss_kernel_29[30] = 
    { q31_t(0x4l), q31_t(0x74l), q31_t(0x658l), q31_t(0x3918l)
    , q31_t(0x1731cl), q31_t(0x73f8cl), q31_t(0x1cfe30l)
    , q31_t(0x5f4330l), q31_t(0x105f8c4l), q31_t(0x2634474l)
    , q31_t(0x4c688e8l), q31_t(0x83fa6a8l), q31_t(0xc5f79fcl)
    , q31_t(0x102e15acl), q31_t(0x127dcfa0l), q31_t(0x127dcfa0l)
    , q31_t(0x102e15acl), q31_t(0xc5f79fcl), q31_t(0x83fa6a8l)
    , q31_t(0x4c688e8l), q31_t(0x2634474l), q31_t(0x105f8c4l)
    , q31_t(0x5f4330l), q31_t(0x1cfe30l), q31_t(0x73f8cl)
    , q31_t(0x1731cl), q31_t(0x3918l), q31_t(0x658l), q31_t(0x74l)
    , q31_t(0x4l)
    };

constexpr q31_t gauss_kernel_30[31] = 
    { q31_t(0x2l), q31_t(0x3cl), q31_t(0x366l), q31_t(0x1fb8l)
    , q31_t(0xd61al), q31_t(0x45954l), q31_t(0x121edel)
    , q31_t(0x3e20b0l), q31_t(0xb29dfal), q31_t(0x1b49e9cl)
    , q31_t(0x394e6ael), q31_t(0x68317c8l), q31_t(0xa4f9052l)
    , q31_t(0xe46c7d4l), q31_t(0x1155f2a6l), q31_t(0x127dcfa0l)
    , q31_t(0x1155f2a6l), q31_t(0xe46c7d4l), q31_t(0xa4f9052l)
    , q31_t(0x68317c8l), q31_t(0x394e6ael), q31_t(0x1b49e9cl)
    , q31_t(0xb29dfal), q31_t(0x3e20b0l), q31_t(0x121edel)
    , q31_t(0x45954l), q31_t(0xd61al), q31_t(0x1fb8l), q31_t(0x366l)
    , q31_t(0x3cl), q31_t(0x2l)
    };

constexpr q31_t gauss_kernel_31[32] = 
    { q31_t(0x1l), q31_t(0x1fl), q31_t(0x1d1l), q31_t(0x118fl)
    , q31_t(0x7ae9l), q31_t(0x297b7l), q31_t(0xb3c19l)
    , q31_t(0x281fc7l), q31_t(0x785f55l), q31_t(0x1339e4bl)
    , q31_t(0x2a4c2a5l), q31_t(0x50bff3bl), q31_t(0x869540dl)
    , q31_t(0xc4b2c13l), q31_t(0xfce5d3dl), q31_t(0x11e9e123l)
    , q31_t(0x11e9e123l), q31_t(0xfce5d3dl), q31_t(0xc4b2c13l)
    , q31_t(0x869540dl), q31_t(0x50bff3bl), q31_t(0x2a4c2a5l)
    , q31_t(0x1339e4bl), q31_t(0x785f55l), q31_t(0x281fc7l)
    , q31_t(0xb3c19l), q31_t(0x297b7l), q31_t(0x7ae9l)
    , q31_t(0x118fl), q31_t(0x1d1l), q31_t(0x1fl), q31_t(0x1l)
    };

const q31_t *gauss_kernel(unsigned n)
{
    switch (n)
    {
    case 1: return gauss_kernel_1;
    case 2: return gauss_kernel_2;
    case 3: return gauss_kernel_3;
    case 4: return gauss_kernel_4;
    case 5: return gauss_kernel_5;
    case 6: return gauss_kernel_6;
    case 7: return gauss_kernel_7;
    case 8: return gauss_kernel_8;
    case 9: return gauss_kernel_9;
    case 10: return gauss_kernel_10;
    case 11: return gauss_kernel_11;
    case 12: return gauss_kernel_12;
    case 13: return gauss_kernel_13;
    case 14: return gauss_kernel_14;
    case 15: return gauss_kernel_15;
    case 16: return gauss_kernel_16;
    case 17: return gauss_kernel_17;
    case 18: return gauss_kernel_18;
    case 19: return gauss_kernel_19;
    case 20: return gauss_kernel_20;
    case 21: return gauss_kernel_21;
    case 22: return gauss_kernel_22;
    case 23: return gauss_kernel_23;
    case 24: return gauss_kernel_24;
    case 25: return gauss_kernel_25;
    case 26: return gauss_kernel_26;
    case 27: return gauss_kernel_27;
    case 28: return gauss_kernel_28;
    case 29: return gauss_kernel_29;
    case 30: return gauss_kernel_30;
    case 31: return gauss_kernel_31;
    default: return 0;
    }
}

