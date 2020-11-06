#include <fixed.h>

// Gaussian kernels normalized to 1 in Q31 fixed point format.

using namespace fixed;

constexpr q31_t gauss_kernel_1[2] = 
    { q31_t(0x40000000l), q31_t(0x40000000l)
    };

constexpr q31_t gauss_kernel_2[3] = 
    { q31_t(0x26666666l), q31_t(0x33333333l), q31_t(0x26666666l)
    };

constexpr q31_t gauss_kernel_3[4] = 
    { q31_t(0x19999999l), q31_t(0x26666666l), q31_t(0x26666666l)
    , q31_t(0x19999999l)
    };

constexpr q31_t gauss_kernel_4[5] = 
    { q31_t(0x12492492l), q31_t(0x1d41d41dl), q31_t(0x20ea0ea1l)
    , q31_t(0x1d41d41dl), q31_t(0x12492492l)
    };

constexpr q31_t gauss_kernel_5[6] = 
    { q31_t(0xdb6db6el), q31_t(0x16db6db7l), q31_t(0x1b6db6dbl)
    , q31_t(0x1b6db6dbl), q31_t(0x16db6db7l), q31_t(0xdb6db6el)
    };

constexpr q31_t gauss_kernel_6[7] = 
    { q31_t(0xaaaaaabl), q31_t(0x12492492l), q31_t(0x16db6db7l)
    , q31_t(0x18618618l), q31_t(0x16db6db7l), q31_t(0x12492492l)
    , q31_t(0xaaaaaabl)
    };

constexpr q31_t gauss_kernel_7[8] = 
    { q31_t(0x8888888l), q31_t(0xeeeeeefl), q31_t(0x13333333l)
    , q31_t(0x15555555l), q31_t(0x15555555l), q31_t(0x13333333l)
    , q31_t(0xeeeeeefl), q31_t(0x8888888l)
    };

constexpr q31_t gauss_kernel_8[9] = 
    { q31_t(0x6fb5870l), q31_t(0xc6980c6l), q31_t(0x104a7905l)
    , q31_t(0x129e412al), q31_t(0x1364d936l), q31_t(0x129e412al)
    , q31_t(0x104a7905l), q31_t(0xc6980c6l), q31_t(0x6fb5870l)
    };

constexpr q31_t gauss_kernel_9[10] = 
    { q31_t(0x5d1745dl), q31_t(0xa7904a7l), q31_t(0xdf6b0dfl)
    , q31_t(0x104a7905l), q31_t(0x11745d17l), q31_t(0x11745d17l)
    , q31_t(0x104a7905l), q31_t(0xdf6b0dfl), q31_t(0xa7904a7l)
    , q31_t(0x5d1745dl)
    };

constexpr q31_t gauss_kernel_10[11] = 
    { q31_t(0x4ec4ec5l), q31_t(0x8f377f2l), q31_t(0xc157b86l)
    , q31_t(0xe525983l), q31_t(0xfaa11e7l), q31_t(0x101ca4b3l)
    , q31_t(0xfaa11e7l), q31_t(0xe525983l), q31_t(0xc157b86l)
    , q31_t(0x8f377f2l), q31_t(0x4ec4ec5l)
    };

constexpr q31_t gauss_kernel_11[12] = 
    { q31_t(0x4384384l), q31_t(0x7bc7bc8l), q31_t(0xa8ca8cal)
    , q31_t(0xca8ca8dl), q31_t(0xe10e10el), q31_t(0xec4ec4fl)
    , q31_t(0xec4ec4fl), q31_t(0xe10e10el), q31_t(0xca8ca8dl)
    , q31_t(0xa8ca8cal), q31_t(0x7bc7bc8l), q31_t(0x4384384l)
    };

constexpr q31_t gauss_kernel_12[13] = 
    { q31_t(0x3a83a84l), q31_t(0x6c06c07l), q31_t(0x9489489l)
    , q31_t(0xb40b40bl), q31_t(0xca8ca8dl), q31_t(0xd80d80dl)
    , q31_t(0xdc8dc8el), q31_t(0xd80d80dl), q31_t(0xca8ca8dl)
    , q31_t(0xb40b40bl), q31_t(0x9489489l), q31_t(0x6c06c07l)
    , q31_t(0x3a83a84l)
    };

constexpr q31_t gauss_kernel_13[14] = 
    { q31_t(0x3333333l), q31_t(0x5f15f16l), q31_t(0x83a83a8l)
    , q31_t(0xa0ea0eal), q31_t(0xb6db6dbl), q31_t(0xc57c57cl)
    , q31_t(0xccccccdl), q31_t(0xccccccdl), q31_t(0xc57c57cl)
    , q31_t(0xb6db6dbl), q31_t(0xa0ea0eal), q31_t(0x83a83a8l)
    , q31_t(0x5f15f16l), q31_t(0x3333333l)
    };

constexpr q31_t gauss_kernel_14[15] = 
    { q31_t(0x2d2d2d3l), q31_t(0x5454545l), q31_t(0x7575757l)
    , q31_t(0x9090909l), q31_t(0xa5a5a5al), q31_t(0xb4b4b4bl)
    , q31_t(0xbdbdbdcl), q31_t(0xc0c0c0cl), q31_t(0xbdbdbdcl)
    , q31_t(0xb4b4b4bl), q31_t(0xa5a5a5al), q31_t(0x9090909l)
    , q31_t(0x7575757l), q31_t(0x5454545l), q31_t(0x2d2d2d3l)
    };

constexpr q31_t gauss_kernel_15[16] = 
    { q31_t(0x2828282l), q31_t(0x4b4b4b5l), q31_t(0x6969697l)
    , q31_t(0x8282828l), q31_t(0x9696969l), q31_t(0xa5a5a5al)
    , q31_t(0xafafafbl), q31_t(0xb4b4b4bl), q31_t(0xb4b4b4bl)
    , q31_t(0xafafafbl), q31_t(0xa5a5a5al), q31_t(0x9696969l)
    , q31_t(0x8282828l), q31_t(0x6969697l), q31_t(0x4b4b4b5l)
    , q31_t(0x2828282l)
    };

constexpr q31_t gauss_kernel_16[17] = 
    { q31_t(0x23ee090l), q31_t(0x43a1f2dl), q31_t(0x5f1bbd7l)
    , q31_t(0x765b68el), q31_t(0x8960f53l), q31_t(0x982c624l)
    , q31_t(0xa2bdb03l), q31_t(0xa914df0l), q31_t(0xab31ee9l)
    , q31_t(0xa914df0l), q31_t(0xa2bdb03l), q31_t(0x982c624l)
    , q31_t(0x8960f53l), q31_t(0x765b68el), q31_t(0x5f1bbd7l)
    , q31_t(0x43a1f2dl), q31_t(0x23ee090l)
    };

constexpr q31_t gauss_kernel_17[18] = 
    { q31_t(0x20563b5l), q31_t(0x3d14a8el), q31_t(0x563b48cl)
    , q31_t(0x6bca1afl), q31_t(0x7dc11f7l), q31_t(0x8c20564l)
    , q31_t(0x96e7bf5l), q31_t(0x9e175abl), q31_t(0xa1af287l)
    , q31_t(0xa1af287l), q31_t(0x9e175abl), q31_t(0x96e7bf5l)
    , q31_t(0x8c20564l), q31_t(0x7dc11f7l), q31_t(0x6bca1afl)
    , q31_t(0x563b48cl), q31_t(0x3d14a8el), q31_t(0x20563b5l)
    };

constexpr q31_t gauss_kernel_18[19] = 
    { q31_t(0x1d41d42l), q31_t(0x376f411l), q31_t(0x4e8846dl)
    , q31_t(0x628ce57l), q31_t(0x737d1cel), q31_t(0x8158ed2l)
    , q31_t(0x8c20564l), q31_t(0x93d3582l), q31_t(0x9871f2fl)
    , q31_t(0x99fc268l), q31_t(0x9871f2fl), q31_t(0x93d3582l)
    , q31_t(0x8c20564l), q31_t(0x8158ed2l), q31_t(0x737d1cel)
    , q31_t(0x628ce57l), q31_t(0x4e8846dl), q31_t(0x376f411l)
    , q31_t(0x1d41d42l)
    };

constexpr q31_t gauss_kernel_19[20] = 
    { q31_t(0x1a98ef6l), q31_t(0x3288fa0l), q31_t(0x47d01ffl)
    , q31_t(0x5a6e611l), q31_t(0x6a63bd8l), q31_t(0x77b0353l)
    , q31_t(0x8253c82l), q31_t(0x8a4e766l), q31_t(0x8fa03fdl)
    , q31_t(0x9249249l), q31_t(0x9249249l), q31_t(0x8fa03fdl)
    , q31_t(0x8a4e766l), q31_t(0x8253c82l), q31_t(0x77b0353l)
    , q31_t(0x6a63bd8l), q31_t(0x5a6e611l), q31_t(0x47d01ffl)
    , q31_t(0x3288fa0l), q31_t(0x1a98ef6l)
    };

constexpr q31_t gauss_kernel_20[21] = 
    { q31_t(0x1848da9l), q31_t(0x2e41a05l), q31_t(0x41ea514l)
    , q31_t(0x5342ed6l), q31_t(0x624b74al), q31_t(0x6f03e72l)
    , q31_t(0x796c44dl), q31_t(0x81848dal), q31_t(0x874cc1bl)
    , q31_t(0x8ac4e0fl), q31_t(0x8beceb5l), q31_t(0x8ac4e0fl)
    , q31_t(0x874cc1bl), q31_t(0x81848dal), q31_t(0x796c44dl)
    , q31_t(0x6f03e72l), q31_t(0x624b74al), q31_t(0x5342ed6l)
    , q31_t(0x41ea514l), q31_t(0x2e41a05l), q31_t(0x1848da9l)
    };

constexpr q31_t gauss_kernel_21[22] = 
    { q31_t(0x1642c86l), q31_t(0x2a7f7e8l), q31_t(0x3cb6226l)
    , q31_t(0x4ce6b42l), q31_t(0x5b1133al), q31_t(0x6735a0el)
    , q31_t(0x7153fbfl), q31_t(0x796c44dl), q31_t(0x7f7e7b7l)
    , q31_t(0x838a9fel), q31_t(0x8590b21l), q31_t(0x8590b21l)
    , q31_t(0x838a9fel), q31_t(0x7f7e7b7l), q31_t(0x796c44dl)
    , q31_t(0x7153fbfl), q31_t(0x6735a0el), q31_t(0x5b1133al)
    , q31_t(0x4ce6b42l), q31_t(0x3cb6226l), q31_t(0x2a7f7e8l)
    , q31_t(0x1642c86l)
    };

constexpr q31_t gauss_kernel_22[23] = 
    { q31_t(0x147ae14l), q31_t(0x272ddb8l), q31_t(0x3818eeal)
    , q31_t(0x473c1abl), q31_t(0x54975fcl), q31_t(0x602abdbl)
    , q31_t(0x69f6349l), q31_t(0x71f9c45l), q31_t(0x78356d1l)
    , q31_t(0x7ca92ecl), q31_t(0x7f55096l), q31_t(0x8038fcel)
    , q31_t(0x7f55096l), q31_t(0x7ca92ecl), q31_t(0x78356d1l)
    , q31_t(0x71f9c45l), q31_t(0x69f6349l), q31_t(0x602abdbl)
    , q31_t(0x54975fcl), q31_t(0x473c1abl), q31_t(0x3818eeal)
    , q31_t(0x272ddb8l), q31_t(0x147ae14l)
    };

constexpr q31_t gauss_kernel_23[24] = 
    { q31_t(0x12e794el), q31_t(0x243bdd5l), q31_t(0x33fcd96l)
    , q31_t(0x422a891l), q31_t(0x4ec4ec5l), q31_t(0x59cc032l)
    , q31_t(0x633fcd9l), q31_t(0x6b204bal), q31_t(0x716d7d4l)
    , q31_t(0x7627627l), q31_t(0x794dfb4l), q31_t(0x7ae147bl)
    , q31_t(0x7ae147bl), q31_t(0x794dfb4l), q31_t(0x7627627l)
    , q31_t(0x716d7d4l), q31_t(0x6b204bal), q31_t(0x633fcd9l)
    , q31_t(0x59cc032l), q31_t(0x4ec4ec5l), q31_t(0x422a891l)
    , q31_t(0x33fcd96l), q31_t(0x243bdd5l), q31_t(0x12e794el)
    };

constexpr q31_t gauss_kernel_24[25] = 
    { q31_t(0x1181181l), q31_t(0x219bb35l), q31_t(0x304fd1dl)
    , q31_t(0x3d9d737l), q31_t(0x4984985l), q31_t(0x5405405l)
    , q31_t(0x5d1f6b9l), q31_t(0x64d31a0l), q31_t(0x6b204bal)
    , q31_t(0x7007007l), q31_t(0x7387387l), q31_t(0x75a0f3al)
    , q31_t(0x7654321l), q31_t(0x75a0f3al), q31_t(0x7387387l)
    , q31_t(0x7007007l), q31_t(0x6b204bal), q31_t(0x64d31a0l)
    , q31_t(0x5d1f6b9l), q31_t(0x5405405l), q31_t(0x4984985l)
    , q31_t(0x3d9d737l), q31_t(0x304fd1dl), q31_t(0x219bb35l)
    , q31_t(0x1181181l)
    };

constexpr q31_t gauss_kernel_25[26] = 
    { q31_t(0x1041041l), q31_t(0x1f41f42l), q31_t(0x2d02d03l)
    , q31_t(0x3983984l), q31_t(0x44c44c4l), q31_t(0x4ec4ec5l)
    , q31_t(0x5785785l), q31_t(0x5f05f06l), q31_t(0x6546546l)
    , q31_t(0x6a46a47l), q31_t(0x6e06e07l), q31_t(0x7087087l)
    , q31_t(0x71c71c7l), q31_t(0x71c71c7l), q31_t(0x7087087l)
    , q31_t(0x6e06e07l), q31_t(0x6a46a47l), q31_t(0x6546546l)
    , q31_t(0x5f05f06l), q31_t(0x5785785l), q31_t(0x4ec4ec5l)
    , q31_t(0x44c44c4l), q31_t(0x3983984l), q31_t(0x2d02d03l)
    , q31_t(0x1f41f42l), q31_t(0x1041041l)
    };

constexpr q31_t gauss_kernel_26[27] = 
    { q31_t(0xf220cal), q31_t(0x1d2521cl), q31_t(0x2a093f8l)
    , q31_t(0x35ce65cl), q31_t(0x4074948l), q31_t(0x49fbcbel)
    , q31_t(0x52640bcl), q31_t(0x59ad543l), q31_t(0x5fd7a53l)
    , q31_t(0x64e2fecl), q31_t(0x68cf60dl), q31_t(0x6b9ccb7l)
    , q31_t(0x6d4b3eal), q31_t(0x6ddaba6l), q31_t(0x6d4b3eal)
    , q31_t(0x6b9ccb7l), q31_t(0x68cf60dl), q31_t(0x64e2fecl)
    , q31_t(0x5fd7a53l), q31_t(0x59ad543l), q31_t(0x52640bcl)
    , q31_t(0x49fbcbel), q31_t(0x4074948l), q31_t(0x35ce65cl)
    , q31_t(0x2a093f8l), q31_t(0x1d2521cl), q31_t(0xf220cal)
    };

constexpr q31_t gauss_kernel_27[28] = 
    { q31_t(0xe1fc78l), q31_t(0x1b3d49el), q31_t(0x2758873l)
    , q31_t(0x32717f6l), q31_t(0x3c88327l), q31_t(0x459ca07l)
    , q31_t(0x4daec94l), q31_t(0x54bead0l), q31_t(0x5acc4bbl)
    , q31_t(0x5fd7a53l), q31_t(0x63e0b9al), q31_t(0x66e788fl)
    , q31_t(0x68ec133l), q31_t(0x69ee584l), q31_t(0x69ee584l)
    , q31_t(0x68ec133l), q31_t(0x66e788fl), q31_t(0x63e0b9al)
    , q31_t(0x5fd7a53l), q31_t(0x5acc4bbl), q31_t(0x54bead0l)
    , q31_t(0x4daec94l), q31_t(0x459ca07l), q31_t(0x3c88327l)
    , q31_t(0x32717f6l), q31_t(0x2758873l), q31_t(0x1b3d49el)
    , q31_t(0xe1fc78l)
    };

constexpr q31_t gauss_kernel_28[29] = 
    { q31_t(0xd3680dl), q31_t(0x1983bb0l), q31_t(0x24e7ae7l)
    , q31_t(0x2f625b4l), q31_t(0x38f3c16l), q31_t(0x419be0dl)
    , q31_t(0x495ab99l), q31_t(0x50304bal), q31_t(0x561c971l)
    , q31_t(0x5b1f9bcl), q31_t(0x5f3959dl), q31_t(0x6269d13l)
    , q31_t(0x64b101el), q31_t(0x660eebel), q31_t(0x66838f4l)
    , q31_t(0x660eebel), q31_t(0x64b101el), q31_t(0x6269d13l)
    , q31_t(0x5f3959dl), q31_t(0x5b1f9bcl), q31_t(0x561c971l)
    , q31_t(0x50304bal), q31_t(0x495ab99l), q31_t(0x419be0dl)
    , q31_t(0x38f3c16l), q31_t(0x2f625b4l), q31_t(0x24e7ae7l)
    , q31_t(0x1983bb0l), q31_t(0xd3680dl)
    };

constexpr q31_t gauss_kernel_29[30] = 
    { q31_t(0xc6318cl), q31_t(0x17f2c98l), q31_t(0x22af123l)
    , q31_t(0x2c97f2dl), q31_t(0x35ad6b6l), q31_t(0x3def7bel)
    , q31_t(0x455e245l), q31_t(0x4bf964cl), q31_t(0x51c13d2l)
    , q31_t(0x56b5ad7l), q31_t(0x5ad6b5bl), q31_t(0x5e2455el)
    , q31_t(0x609e8e1l), q31_t(0x62455e2l), q31_t(0x6318c63l)
    , q31_t(0x6318c63l), q31_t(0x62455e2l), q31_t(0x609e8e1l)
    , q31_t(0x5e2455el), q31_t(0x5ad6b5bl), q31_t(0x56b5ad7l)
    , q31_t(0x51c13d2l), q31_t(0x4bf964cl), q31_t(0x455e245l)
    , q31_t(0x3def7bel), q31_t(0x35ad6b6l), q31_t(0x2c97f2dl)
    , q31_t(0x22af123l), q31_t(0x17f2c98l), q31_t(0xc6318cl)
    };

constexpr q31_t gauss_kernel_30[31] = 
    { q31_t(0xba2e8cl), q31_t(0x1685a17l), q31_t(0x20a82a1l)
    , q31_t(0x2a0a82al), q31_t(0x32acab3l), q31_t(0x3a8ea3bl)
    , q31_t(0x41b06c2l), q31_t(0x4812048l), q31_t(0x4db36cel)
    , q31_t(0x5294a53l), q31_t(0x56b5ad7l), q31_t(0x5a1685al)
    , q31_t(0x5cb72ddl), q31_t(0x5e97a5fl), q31_t(0x5fb7ee0l)
    , q31_t(0x6018060l), q31_t(0x5fb7ee0l), q31_t(0x5e97a5fl)
    , q31_t(0x5cb72ddl), q31_t(0x5a1685al), q31_t(0x56b5ad7l)
    , q31_t(0x5294a53l), q31_t(0x4db36cel), q31_t(0x4812048l)
    , q31_t(0x41b06c2l), q31_t(0x3a8ea3bl), q31_t(0x32acab3l)
    , q31_t(0x2a0a82al), q31_t(0x20a82a1l), q31_t(0x1685a17l)
    , q31_t(0xba2e8cl)
    };

constexpr q31_t gauss_kernel_31[32] = 
    { q31_t(0xaf3adel), q31_t(0x153820el), q31_t(0x1ecd590l)
    , q31_t(0x27b3564l), q31_t(0x2fea18al), q31_t(0x3771a03l)
    , q31_t(0x3e49ecdl), q31_t(0x4472feal), q31_t(0x49ecd59l)
    , q31_t(0x4eb771al), q31_t(0x52d2d2dl), q31_t(0x563ef92l)
    , q31_t(0x58fbe4al), q31_t(0x5b09953l), q31_t(0x5c680afl)
    , q31_t(0x5d1745dl), q31_t(0x5d1745dl), q31_t(0x5c680afl)
    , q31_t(0x5b09953l), q31_t(0x58fbe4al), q31_t(0x563ef92l)
    , q31_t(0x52d2d2dl), q31_t(0x4eb771al), q31_t(0x49ecd59l)
    , q31_t(0x4472feal), q31_t(0x3e49ecdl), q31_t(0x3771a03l)
    , q31_t(0x2fea18al), q31_t(0x27b3564l), q31_t(0x1ecd590l)
    , q31_t(0x153820el), q31_t(0xaf3adel)
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

