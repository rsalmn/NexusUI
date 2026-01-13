local IIoOoolIoIOO_oOOOOo = nil or 0.9432950672809968
do end
repeat until true
-- Hidden key generation
local IIOoOlllooloolooIol = (function()
    local IoII_oOO_OIOlooOIo = {}
    IoII_oOO_OIOlooOIo[1] = string.char(0x5a)
    IoII_oOO_OIOlooOIo[2] = string.char(0x76)
    IoII_oOO_OIOlooOIo[3] = string.char(0x71)
    IoII_oOO_OIOlooOIo[4] = string.char(0x6b)
    IoII_oOO_OIOlooOIo[5] = string.char(0x39)
    IoII_oOO_OIOlooOIo[6] = string.char(0x4a)
    IoII_oOO_OIOlooOIo[7] = string.char(0x66)
    IoII_oOO_OIOlooOIo[8] = string.char(0x35)
    IoII_oOO_OIOlooOIo[9] = string.char(0x34)
    IoII_oOO_OIOlooOIo[10] = string.char(0x36)
    IoII_oOO_OIOlooOIo[11] = string.char(0x42)
    IoII_oOO_OIOlooOIo[12] = string.char(0x6a)
    IoII_oOO_OIOlooOIo[13] = string.char(0x63)
    IoII_oOO_OIOlooOIo[14] = string.char(0x32)
    IoII_oOO_OIOlooOIo[15] = string.char(0x33)
    IoII_oOO_OIOlooOIo[16] = string.char(0x31)
    return table.concat(IoII_oOO_OIOlooOIo)
end)()

-- Decryption function
local function oOIIOo_IlooolIIO(O_lI_oIlI_)
    local _oIlllllloOOI = {}
    for olO_OIlOlI_III = 1, #O_lI_oIlI_ do
        local IIIllIIooOolO_ = string.byte(O_lI_oIlI_, olO_OIlOlI_III)
        local OOllloIooIOIo = string.byte(IIOoOlllooloolooIol, ((olO_OIlOlI_III - 1) % #IIOoOlllooloolooIol) + 1)
        _oIlllllloOOI[olO_OIlOlI_III] = string.char(bit32.bxor(IIIllIIooOolO_, OOllloIooIOIo))
    end
    return table.concat(_oIlllllloOOI)
end

-- Encrypted strings table
local IO_oOOllOOoooIo_ = {
    [1] = oOIIOo_IlooolIIO("\x01\x38\x14\x13\x4c\x39\x3b\x15\x72\x57\x2b\x06\x06\x56\x13\x45\x35\x56\x16\x0e\x4d\x6a\x15\x50\x46\x40\x2b\x09\x06\x08"),
    [2] = oOIIOo_IlooolIIO("\x0e\x01\x14\x0e\x57\x19\x03\x47\x42\x5f\x21\x0f"),
    [3] = oOIIOo_IlooolIIO("\x0f\x05\x14\x19\x70\x24\x16\x40\x40\x65\x27\x18\x15\x5b\x50\x54"),
    [4] = oOIIOo_IlooolIIO("\x08\x03\x1f\x38\x5c\x38\x10\x5c\x57\x53"),
    [5] = oOIIOo_IlooolIIO("\x12\x02\x05\x1b\x6a\x2f\x14\x43\x5d\x55\x27"),
    [6] = oOIIOo_IlooolIIO("\x0a\x1a\x10\x12\x5c\x38\x15"),
    [7] = oOIIOo_IlooolIIO("\x19\x19\x03\x0e\x7e\x3f\x0f"),
    [8] = oOIIOo_IlooolIIO("\x16\x1f\x16\x03\x4d\x23\x08\x52"),
    [9] = oOIIOo_IlooolIIO("\x09\x02\x10\x1f\x4a"),
    [10] = oOIIOo_IlooolIIO("\x09\x19\x04\x05\x5d\x19\x03\x47\x42\x5f\x21\x0f"),
    [11] = oOIIOo_IlooolIIO("\x01\x38\x14\x13\x4c\x39\x3b\x15\x72\x57\x2b\x06\x06\x56\x13\x45\x35\x56\x12\x19\x5c\x2b\x12\x50\x14"),
    [12] = oOIIOo_IlooolIIO("\x13\x18\x02\x1f\x58\x24\x05\x50"),
    [13] = oOIIOo_IlooolIIO("\x0f\x3f\x32\x04\x4b\x24\x03\x47"),
    [14] = oOIIOo_IlooolIIO("\x0f\x3f\x22\x1f\x4b\x25\x0d\x50"),
    [15] = oOIIOo_IlooolIIO("\x13\x1b\x10\x0c\x5c\x06\x07\x57\x51\x5a"),
    [16] = oOIIOo_IlooolIIO("\x1e\x04\x1e\x1b\x6a\x22\x07\x51\x5b\x41"),
    [17] = oOIIOo_IlooolIIO("\x28\x14\x09\x0a\x4a\x39\x03\x41\x5d\x52\x78\x45\x4c\x04\x03\x00\x6e\x44\x47\x5a\x00\x73\x55"),
    [18] = oOIIOo_IlooolIIO("\x01\x38\x14\x13\x4c\x39\x33\x7c\x69\x16\x16\x1d\x06\x57\x5d\x11\x1f\x04\x03\x04\x4b\x70\x46\x5c\x5a\x45\x36\x4a\x0a\x41\x13\x5f\x35\x02\x51\x22\x57\x39\x12\x54\x5a\x55\x27"),
    [19] = oOIIOo_IlooolIIO("\x01\x38\x14\x13\x4c\x39\x33\x7c\x69\x16\x16\x1d\x06\x57\x5d\x11\x19\x04\x14\x0a\x4d\x2f\x46\x73\x55\x5f\x2e\x0f\x07\x08"),
    [20] = oOIIOo_IlooolIIO("\x18\x1a\x04\x19\x7c\x2c\x00\x50\x57\x42"),
    [21] = oOIIOo_IlooolIIO("\x14\x13\x09\x1e\x4a\x08\x0a\x40\x46"),
    [22] = oOIIOo_IlooolIIO("\x01\x38\x14\x13\x4c\x39\x3b\x15\x76\x5a\x37\x18\x43\x57\x55\x57\x3f\x15\x05\x4b\x57\x25\x12\x15\x47\x43\x32\x1a\x0c\x40\x47\x54\x3e\x56\x18\x05\x19\x3e\x0e\x5c\x47\x16\x27\x04\x15\x5b\x41\x5e\x34\x1b\x14\x05\x4d"),
    [23] = oOIIOo_IlooolIIO("\x14\x13\x09\x1e\x4a\x09\x09\x5b\x52\x5f\x25"),
    [24] = oOIIOo_IlooolIIO(""),
    [25] = oOIIOo_IlooolIIO("\x19\x19\x1d\x04\x4b\x79"),
    [26] = oOIIOo_IlooolIIO("\x1f\x18\x04\x06\x70\x3e\x03\x58"),
    [27] = oOIIOo_IlooolIIO("\x75"),
    [28] = oOIIOo_IlooolIIO("\x74\x1c\x02\x04\x57"),
    [29] = oOIIOo_IlooolIIO("\x2e\x17\x13\x07\x5c"),
    [30] = oOIIOo_IlooolIIO("\x1f\x18\x04\x06\x17\x01\x03\x4c\x77\x59\x26\x0f"),
    [31] = oOIIOo_IlooolIIO("\x72\x2d\x2f\x44\x65\x17\x4d\x1c\x11\x18\x28\x19\x0c\x5c\x17"),
    [32] = oOIIOo_IlooolIIO("\x18\x1f\x1f\x0f\x58\x28\x0a\x50\x71\x40\x27\x04\x17"),
    [33] = oOIIOo_IlooolIIO("\x1e\x04\x1e\x1b\x5d\x25\x11\x5b"),
    [34] = oOIIOo_IlooolIIO("\x14\x19\x51\x24\x49\x3e\x0f\x5a\x5a\x45"),
    [35] = oOIIOo_IlooolIIO("\x09\x13\x1d\x0e\x5a\x3e\x46\x5a\x44\x42\x2b\x05\x0d\x1c\x1d\x1f"),
    [36] = oOIIOo_IlooolIIO("\x01\x38\x14\x13\x4c\x39\x3b\x15\x77\x44\x27\x0b\x17\x57\x7e\x5e\x3e\x13\x03\x05\x7d\x38\x09\x45\x50\x59\x35\x04\x59\x12\x63\x50\x28\x13\x1f\x1f\x19\x23\x15\x15\x46\x53\x33\x1f\x0a\x40\x56\x55"),
    [37] = oOIIOo_IlooolIIO("\x01\x38\x14\x13\x4c\x39\x3b\x15\x77\x44\x27\x0b\x17\x57\x7e\x5e\x3e\x13\x03\x05\x7d\x38\x09\x45\x50\x59\x35\x04\x59\x12\x7c\x41\x2e\x1f\x1e\x05\x4a\x6a\x15\x5d\x5b\x43\x2e\x0e\x43\x50\x56\x11\x3b\x56\x1f\x04\x57\x67\x03\x58\x44\x42\x3b\x4a\x17\x53\x51\x5d\x3f"),
    [38] = oOIIOo_IlooolIIO("\x1c\x04\x10\x06\x5c"),
    [39] = oOIIOo_IlooolIIO("\x1e\x04\x1e\x1b\x5d\x25\x11\x5b\x6b"),
    [40] = oOIIOo_IlooolIIO("\x0e\x13\x09\x1f\x7b\x3f\x12\x41\x5b\x58"),
    [41] = oOIIOo_IlooolIIO("\x18\x03\x05\x1f\x56\x24"),
    [42] = oOIIOo_IlooolIIO("\x0f\x3f\x36\x19\x58\x2e\x0f\x50\x5a\x42"),
    [43] = oOIIOo_IlooolIIO("\x19\x19\x1f\x1f\x5c\x24\x12"),
    [44] = oOIIOo_IlooolIIO("\x0e\x13\x09\x1f\x75\x2b\x04\x50\x58"),
    [45] = oOIIOo_IlooolIIO("\x09\x13\x1d\x0e\x5a\x3e\x03\x51\x60\x53\x3a\x1e"),
    [46] = oOIIOo_IlooolIIO("\x1b\x04\x03\x04\x4e"),
    [47] = oOIIOo_IlooolIIO("\xe6"),
    [48] = oOIIOo_IlooolIIO("\x09\x15\x03\x0e\x5c\x24\x21\x40\x5d"),
    [49] = oOIIOo_IlooolIIO("\x01\x38\x14\x13\x4c\x39\x3b\x15\x77\x44\x27\x0b\x17\x57\x7e\x5e\x3e\x13\x03\x05\x7d\x38\x09\x45\x50\x59\x35\x04\x59\x12\x7d\x5e\x7a\x25\x12\x19\x5c\x2f\x08\x72\x41\x5f\x62\x0c\x0c\x47\x5d\x55\x76\x56\x01\x0a\x57\x2f\x0a\x15\x59\x57\x3b\x4a\x00\x5e\x5a\x41"),
    [50] = oOIIOo_IlooolIIO("\x1e\x04\x1e\x1b\x5d\x25\x11\x5b\x64\x57\x2c\x0f\x0f\x6d"),
    [51] = oOIIOo_IlooolIIO("\x19\x1a\x1e\x18\x5c\x08\x13\x41\x40\x59\x2c"),
    [52] = oOIIOo_IlooolIIO("\x19\x1a\x1e\x18\x5c"),
    [53] = oOIIOo_IlooolIIO("\x49"),
    [54] = oOIIOo_IlooolIIO("\x1e\x19\x1f\x0e"),
    [55] = oOIIOo_IlooolIIO("\x8d"),
    [56] = oOIIOo_IlooolIIO("\x19\x17\x1f\x08\x5c\x26"),
    [57] = oOIIOo_IlooolIIO("\x0e\x13\x09\x1f\x7b\x25\x1e"),
    [58] = oOIIOo_IlooolIIO("\x09\x13\x10\x19\x5a\x22"),
    [59] = oOIIOo_IlooolIIO("\x09\x13\x10\x19\x5a\x22\x48\x1b\x1a"),
    [60] = oOIIOo_IlooolIIO("\x09\x15\x03\x04\x55\x26\x0f\x5b\x53\x70\x30\x0b\x0e\x57"),
    [61] = oOIIOo_IlooolIIO("\x15\x06\x05\x02\x56\x24\x15"),
    [62] = oOIIOo_IlooolIIO("\x0f\x3f\x3d\x02\x4a\x3e\x2a\x54\x4d\x59\x37\x1e"),
    [63] = oOIIOo_IlooolIIO("\x15\x06\x05\x02\x56\x24\x39"),
    [64] = oOIIOo_IlooolIIO("\x0e\x13\x09\x1f"),
    [65] = oOIIOo_IlooolIIO("\x19\x1e\x14\x08\x52\x28\x09\x4d"),
    [66] = oOIIOo_IlooolIIO("\x7a\x1f\x05\x0e\x54\x39\x46\x46\x51\x5a\x27\x09\x17\x57\x57"),
    [67] = oOIIOo_IlooolIIO("\xe8"),
    [68] = oOIIOo_IlooolIIO("\x19\x1a\x18\x1b\x4a\x0e\x03\x46\x57\x53\x2c\x0e\x02\x5c\x47\x42"),
    [69] = oOIIOo_IlooolIIO("\x09\x1f\x0b\x0e"),
    [70] = oOIIOo_IlooolIIO("\x1d\x03\x18\x24\x5b\x20\x03\x56\x40"),
    [71] = oOIIOo_IlooolIIO("\x14\x13\x09\x1e\x4a\x6a\x2e\x40\x56"),
    [72] = oOIIOo_IlooolIIO("\x1f\x18\x19\x0a\x57\x29\x03\x51\x14\x63\x0b\x4a\x2f\x5b\x51\x43\x3b\x04\x08"),
    [73] = oOIIOo_IlooolIIO("\x14\x13\x09\x1e\x4a\x1f\x2f\x6a"),
    [74] = oOIIOo_IlooolIIO("\x0a\x1a\x10\x12\x5c\x38\x21\x40\x5d"),
    [75] = oOIIOo_IlooolIIO("\x01\x38\x14\x13\x4c\x39\x3b\x15\x72\x57\x2b\x06\x06\x56\x13\x45\x35\x56\x12\x19\x5c\x2b\x12\x50\x14\x65\x21\x18\x06\x57\x5d\x76\x2f\x1f"),
    [76] = oOIIOo_IlooolIIO("\x14"),
    [77] = oOIIOo_IlooolIIO("\x1e\x17\x05\x0a\x19\x1a\x0f\x5b\x53"),
    [78] = oOIIOo_IlooolIIO("\x7f\x3e\x4b\x4e\x74\x70\x43\x66"),
    [79] = oOIIOo_IlooolIIO("\x67\xf6\x51\x4e\x5d\x6a\x20\x65\x67\x16\x3e\x4a\x5e\xd3\x13\x14\x3e\x1b\x02\x4b\x45\x6a\x5b\x50\x14\x13\x26\x4a\x1f\x12\x16\x42"),
    [80] = oOIIOo_IlooolIIO("\x0f\x3f\x22\x08\x58\x26\x03"),
    [81] = oOIIOo_IlooolIIO("\x01\x38\x14\x13\x4c\x39\x3b\x15\x72\x57\x2b\x06\x06\x56\x13\x45\x35\x56\x12\x19\x5c\x2b\x12\x50\x14\x5b\x23\x03\x0d\x12\x44\x58\x34\x12\x1e\x1c"),
    [82] = oOIIOo_IlooolIIO("\x67\xf6"),
    [83] = oOIIOo_IlooolIIO("\x5a"),
    [84] = oOIIOo_IlooolIIO("\x28\x14\x09\x0a\x4a\x39\x03\x41\x5d\x52\x78\x45\x4c\x0b\x0b\x09\x6c\x40\x44\x52\x0f\x7d\x57"),
    [85] = oOIIOo_IlooolIIO("\x13\x1b\x10\x0c\x5c\x08\x13\x41\x40\x59\x2c"),
    [86] = oOIIOo_IlooolIIO("\x14\x13\x09\x1e\x4a\x1e\x09\x52\x53\x5a\x27"),
    [87] = oOIIOo_IlooolIIO("\x1b\x14\x02\x04\x55\x3f\x12\x50\x67\x5f\x38\x0f"),
    [88] = oOIIOo_IlooolIIO("\x1b\x14\x02\x04\x55\x3f\x12\x50\x77\x59\x2c\x1e\x06\x5c\x47\x62\x33\x0c\x14"),
    [89] = oOIIOo_IlooolIIO("\x0f\x3f\x21\x0a\x5d\x2e\x0f\x5b\x53"),
    [90] = oOIIOo_IlooolIIO("\x14\x19\x05\x02\x5f\x23\x05\x54\x40\x5f\x2d\x04"),
    [91] = oOIIOo_IlooolIIO("\x13\x18\x17\x04"),
    [92] = oOIIOo_IlooolIIO("\x63\x79"),
    [93] = oOIIOo_IlooolIIO("\x5f"),
    [94] = oOIIOo_IlooolIIO("\xfa\x79"),
    [95] = oOIIOo_IlooolIIO("\x16"),
    [96] = oOIIOo_IlooolIIO("\x4f"),
    [97] = oOIIOo_IlooolIIO("\x29\x02\x03\x02\x57\x2d"),
    [98] = oOIIOo_IlooolIIO("\x0e\x17\x13"),
    [99] = oOIIOo_IlooolIIO("\x67\xb2"),
    [100] = oOIIOo_IlooolIIO("\x09\x13\x12\x1f\x50\x25\x08"),
    [101] = oOIIOo_IlooolIIO("\x16\x17\x13\x0e\x55"),
    [102] = oOIIOo_IlooolIIO("\x0e\x13\x09\x1f\x6a\x2f\x14\x43\x5d\x55\x27"),
    [103] = oOIIOo_IlooolIIO("\x01\x38\x14\x13\x4c\x39\x3b\x15\x60\x57\x20\x50\x27\x40\x5c\x41\x3e\x19\x06\x05\x19\x67\x46\x61\x55\x54\x12\x0b\x04\x57\x13\x58\x29\x56\x1f\x04\x4d\x6a\x07\x43\x55\x5f\x2e\x0b\x01\x5e\x56"),
    [104] = oOIIOo_IlooolIIO("\x0e\x19\x16\x0c\x55\x2f"),
    [105] = oOIIOo_IlooolIIO("\x09\x1a\x18\x0f\x5c\x38"),
    [106] = oOIIOo_IlooolIIO("\x1f\x18\x05\x0e\x4b\x6a\x12\x50\x4c\x42\x6c\x44\x4d"),
    [107] = oOIIOo_IlooolIIO("\x01\x28\x54\x0f\x1c\x64\x43\x18\x69"),
    [108] = oOIIOo_IlooolIIO("\x74"),
    [109] = oOIIOo_IlooolIIO("\x77"),
    [110] = oOIIOo_IlooolIIO("\x7f\x12"),
    [111] = oOIIOo_IlooolIIO("\x11\x13\x08\x09\x50\x24\x02"),
    [112] = oOIIOo_IlooolIIO("\x74\x58\x5f"),
    [113] = oOIIOo_IlooolIIO("\x14\x19\x1f\x0e"),
    [114] = oOIIOo_IlooolIIO("\x16\x25\x19\x02\x5f\x3e"),
    [115] = oOIIOo_IlooolIIO("\x08\x25\x19\x02\x5f\x3e"),
    [116] = oOIIOo_IlooolIIO("\x16\x35\x05\x19\x55"),
    [117] = oOIIOo_IlooolIIO("\x08\x35\x05\x19\x55"),
    [118] = oOIIOo_IlooolIIO("\x16\x37\x1d\x1f"),
    [119] = oOIIOo_IlooolIIO("\x08\x37\x1d\x1f"),
    [120] = oOIIOo_IlooolIIO("\x19\x17\x01\x18"),
    [121] = oOIIOo_IlooolIIO("\x6b"),
    [122] = oOIIOo_IlooolIIO("\x68"),
    [123] = oOIIOo_IlooolIIO("\x69"),
    [124] = oOIIOo_IlooolIIO("\x6e"),
    [125] = oOIIOo_IlooolIIO("\x6f"),
    [126] = oOIIOo_IlooolIIO("\x6c"),
    [127] = oOIIOo_IlooolIIO("\x6d"),
    [128] = oOIIOo_IlooolIIO("\x62"),
    [129] = oOIIOo_IlooolIIO("\x63"),
    [130] = oOIIOo_IlooolIIO("\x6a"),
    [131] = oOIIOo_IlooolIIO("\x14\x03\x1c\x5a"),
    [132] = oOIIOo_IlooolIIO("\x14\x03\x1c\x59"),
    [133] = oOIIOo_IlooolIIO("\x14\x03\x1c\x58"),
    [134] = oOIIOo_IlooolIIO("\x14\x03\x1c\x5f"),
    [135] = oOIIOo_IlooolIIO("\x14\x03\x1c\x5e"),
    [136] = oOIIOo_IlooolIIO("\x14\x03\x1c\x5d"),
    [137] = oOIIOo_IlooolIIO("\x14\x03\x1c\x5c"),
    [138] = oOIIOo_IlooolIIO("\x14\x03\x1c\x53"),
    [139] = oOIIOo_IlooolIIO("\x14\x03\x1c\x52"),
    [140] = oOIIOo_IlooolIIO("\x14\x03\x1c\x5b"),
    [141] = oOIIOo_IlooolIIO("\x0f\x18\x1a\x05\x56\x3d\x08"),
    [142] = oOIIOo_IlooolIIO("\x12\x19\x1d\x0f"),
    [143] = oOIIOo_IlooolIIO("\x1b\x1a\x06\x0a\x40\x39"),
    [144] = oOIIOo_IlooolIIO("\x19\x19\x1d\x07\x58\x3a\x15\x5c\x56\x5a\x27"),
    [145] = oOIIOo_IlooolIIO("\x0a\x17\x03\x0a\x5e\x38\x07\x45\x5c"),
    [146] = oOIIOo_IlooolIIO("\x13\x18\x01\x1e\x4d"),
    [147] = oOIIOo_IlooolIIO("\x0c\x17\x1d\x1e\x5c\x64\x48\x1b"),
    [148] = oOIIOo_IlooolIIO("\x19\x19\x1d\x04\x4b\x6a\x36\x5c\x57\x5d\x27\x18"),
    [149] = oOIIOo_IlooolIIO("\x08\x34\x29\x38\x5a\x38\x0f\x45\x40\x75\x2d\x04\x0d\x57\x50\x45\x33\x19\x1f"),
    [150] = oOIIOo_IlooolIIO("\x48"),
    [151] = oOIIOo_IlooolIIO("\xfb"),
}

-- Obfuscated with Lua-njingObfuscator
-- https://github.com/rsalmn/Lua-njingObfuscator

--[[ 
    NEXUS UI (v4.0 - Enhanced Edition)
    ✨ New Features: Modern Dropdown, Error Prevention, Performance Boost
    🎨 Design: Glassmorphism, Smooth Animations, Better UX
]]

local IoOlIOIOl_oIOIIooII = {
    Flags = {}, 
    Registry = {}, 
    Connections = {},
    IsDestroyed = false,
    Theme = {
        Accent = Color3.fromRGB(88, 166, 255),
        AccentHover = Color3.fromRGB(108, 186, 255),
        Background = Color3.fromRGB(16, 16, 20),
        Surface = Color3.fromRGB(24, 24, 28),
        SurfaceHigh = Color3.fromRGB(32, 32, 38),
        SurfaceHighest = Color3.fromRGB(42, 42, 48),
        Ioolo_OoIoIIoOIl = Color3.fromRGB(245, 245, 250),
        TextSub = Color3.fromRGB(180, 180, 190),
        TextMuted = Color3.fromRGB(120, 120, 135),
        Outline = Color3.fromRGB(60, 60, 70),
        Success = Color3.fromRGB(72, 187, 120),
        Warning = Color3.fromRGB(251, 191, 36),
        Error = Color3.fromRGB(248, 113, 113),
        Gradient1 = Color3.fromRGB(88, 166, 255),
        Gradient2 = Color3.fromRGB(147, 51, 234),
        Shadow = Color3.fromRGB(0, 0, 0)
    }
}

--// Services with error handling
local lOolIlll_lIOIOoIOI = {}
local function OlIollOOIlOoloOooI(_lIOlOOlOlIIlolIlo_)
    if not lOolIlll_lIOIOoIOI[_lIOlOOlOlIIlolIlo_] then
        local lIIIO_IoOIo_, looolOO_IlIl = pcall(function()
            return game:GetService(_lIOlOOlOlIIlolIlo_)
        end)
        
        if not lIIIO_IoOIo_ then
            warn(IO_oOOllOOoooIo_[1], _lIOlOOlOlIIlolIlo_)
        end
        
        lOolIlll_lIOIOoIOI[_lIOlOOlOlIIlolIlo_] = lIIIO_IoOIo_ and looolOO_IlIl or nil
    end
    
    return lOolIlll_lIOIOoIOI[_lIOlOOlOlIIlolIlo_]
end


local IIooOoOloI = OlIollOOIlOoloOooI(IO_oOOllOOoooIo_[2])
local OOOllOIOllO_OoI = OlIollOOIlOoloOooI(IO_oOOllOOoooIo_[3])
local OlIoOOlOIOooIOIll = OlIollOOIlOoloOooI(IO_oOOllOOoooIo_[4])
local _O_OIooIoI_I = OlIollOOIlOoloOooI(IO_oOOllOOoooIo_[5])
local ll_lOOloOIlllllol = OlIollOOIlOoloOooI(IO_oOOllOOoooIo_[6])
local oII_O_II_I = OlIollOOIlOoloOooI(IO_oOOllOOoooIo_[7])
local lOoIIIIoO_OIOol = OlIollOOIlOoloOooI(IO_oOOllOOoooIo_[8])
local lo_lOIlllI_I = OlIollOOIlOoloOooI(IO_oOOllOOoooIo_[9])
local oIoIooOooIoI = OlIollOOIlOoloOooI(IO_oOOllOOoooIo_[10])

--// Enhanced Helpers with error handling
local function OO_OIOOIoooIolIoo(IlOIIlO_OoOIlOoO, o_IOooIlOIIloO_oII, olIooOIIo_OlOlolI)
    local lIIIO_IoOIo_, OoIOoO_IIool_ = pcall(function()
        return Instance.new(IlOIIlO_OoOIlOoO)
    end)
    
    if not lIIIO_IoOIo_ then
        warn(IO_oOOllOOoooIo_[11] .. tostring(IlOIIlO_OoOIlOoO))
        return nil
    end
    
    if o_IOooIlOIIloO_oII then
        for IllloII_ll, loolOoIIlIoloIIo_ll in pairs(o_IOooIlOIIloO_oII) do
            pcall(function()
                OoIOoO_IIool_[IllloII_ll] = loolOoIIlIoloIIo_ll
            end)
        end
    end
    
    if olIooOIIo_OlOlolI then
        for ooIlololllolIOlo, __IlO_o_oIIOI__loo in pairs(olIooOIIo_OlOlolI) do
            if __IlO_o_oIIOI__loo and typeof(__IlO_o_oIIOI__loo) == IO_oOOllOOoooIo_[12] then
                __IlO_o_oIIOI__loo.Parent = OoIOoO_IIool_
            end
        end
    end
    
    return OoIOoO_IIool_
end

local function _OI_olOOlOI(IlOIIlO_OoOIlOoO, o_IOooIlOIIloO_oII, olIooOIIo_OlOlolI)
    return OO_OIOOIoooIolIoo(IlOIIlO_OoOIlOoO, o_IOooIlOIIloO_oII, olIooOIIo_OlOlolI)
end

local function llOl_IoIII_oIOIIo(I__ooOO_IO_oooOOIlI, oIloIOlOIlolo_olIoo)
    if not I__ooOO_IO_oooOOIlI or not I__ooOO_IO_oooOOIlI.Parent then return end
    return _OI_olOOlOI(IO_oOOllOOoooIo_[13], {
        CornerRadius = UDim.new(0, oIloIOlOIlolo_olIoo or 8),
        O_OoOO_I_oI = I__ooOO_IO_oooOOIlI
    })
end

local function lIO__OIIOllOlOOl(I__ooOO_IO_oooOOIlI, ol_ooIlOlOo, OIOOolooo_oIOIIoIl, I_o_lIOIO_IIolooo)
    if not I__ooOO_IO_oooOOIlI or not I__ooOO_IO_oooOOIlI.Parent then return end
    return _OI_olOOlOI(IO_oOOllOOoooIo_[14], {
        lOO_lIoI_O_o = ol_ooIlOlOo or IoOlIOIOl_oIOIIooII.Theme.Outline,
        Thickness = OIOOolooo_oIOIIoIl or 1,
        Transparency = I_o_lIOIO_IIolooo or 0.6,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        O_OoOO_I_oI = I__ooOO_IO_oooOOIlI
    })
end

local function IolOololoIOoOOlI(I__ooOO_IO_oooOOIlI, lOolOoOIlOOolo, I_o_lIOIO_IIolooo)
    if not I__ooOO_IO_oooOOIlI or not I__ooOO_IO_oooOOIlI.Parent then return end
    
    local loOllllOOOo = _OI_olOOlOI(IO_oOOllOOoooIo_[15], {
        oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[16],
        oIo_o_IIll = 1,
        lOoOolOOolool = UDim2.fromOffset(-lOolOoOIlOOolo, -lOolOoOIlOOolo),
        IIlolo_Ilo__ = UDim2.new(1, lOolOoOIlOOolo * 2, 1, lOolOoOIlOOolo * 2),
        ZIndex = I__ooOO_IO_oooOOIlI.ZIndex - 1,
        Image = IO_oOOllOOoooIo_[17],
        lIIloO_O_ol_ = IoOlIOIOl_oIOIIooII.Theme.Shadow,
        ImageTransparency = I_o_lIOIO_IIolooo or 0.8,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        O_OoOO_I_oI = I__ooOO_IO_oooOOIlI
    })
    
    return loOllllOOOo
end

-- Tambah tracking
IoOlIOIOl_oIOIIooII.ActiveTweens = IoOlIOIOl_oIOIIooII.ActiveTweens or {}

local function lOoolOoIoOOOl(OoIOoO_IIool_, o_IOooIlOIIloO_oII, time, oOOooIlIOllIOOol, oIllOl_OOO, IIOIO_looOOoololo)
    if IoOlIOIOl_oIOIIooII.ActiveTweens[OoIOoO_IIool_] then
        IoOlIOIOl_oIOIIooII.ActiveTweens[OoIOoO_IIool_]:Cancel()
    end
    
    if typeof(OoIOoO_IIool_) ~= "Instance" then
        warn(IO_oOOllOOoooIo_[18])
        return
    end

    if not inst:IsDescendantOf(game) then
        -- object sudah di-destroy / belum masuk tree
        return
    end

    local lO_lo_OoOlo = TweenInfo.new(
        time or 0.25,
        oOOooIlIOllIOOol or Enum.EasingStyle.Quad,
        oIllOl_OOO or Enum.EasingDirection.Out
    )

    local _lIOoIlOoOo
    local I_oOO_lolO, ollOOoolIIoOoo = pcall(function()
        _lIOoIlOoOo = TweenService:Create(OoIOoO_IIool_, lO_lo_OoOlo, o_IOooIlOIIloO_oII)
        tween:Play()
    end)

    if not I_oOO_lolO then
        warn(IO_oOOllOOoooIo_[19], ollOOoolIIoOoo)
        return
    end

    IoOlIOIOl_oIOIIooII.ActiveTweens[OoIOoO_IIool_] = _lIOoIlOoOo
    _lIOoIlOoOo.Completed:Once(function()
        IoOlIOIOl_oIOIIooII.ActiveTweens[OoIOoO_IIool_] = nil
        if IIOIO_looOOoololo then IIOIO_looOOoololo() end
    end)
    

    return _lIOoIlOoOo
end

local function _Ilo_oOlIooOOo(OIoIoO__Iol, __oollloOllooIOl)
    if not OIoIoO__Iol or not OIoIoO__Iol.Parent then return end
    
    local IOOlOloIOlOlOI = __oollloOllooIOl or OIoIoO__Iol
    local OlOooloOOloI = false
    local oIIOOIOlo_loOlo_OoI = nil
    local IIOOoolllIOIo = nil
    
    local function ooIOloo_OIIooOoIO(olIlO_OlIlIO)
        if olIlO_OlIlIO.UserInputType == Enum.UserInputType.MouseButton1 or 
           olIlO_OlIlIO.UserInputType == Enum.UserInputType.Touch then
            
            OlOooloOOloI = true
            oIIOOIOlo_loOlo_OoI = olIlO_OlIlIO.Position
            IIOOoolllIOIo = OIoIoO__Iol.Position
            
            --PlaySound("6895079853", 0.05) -- Subtle click sound
        end
    end
    
    local function _IOloIIlooIIl(olIlO_OlIlIO)
        if OlOooloOOloI and (olIlO_OlIlIO.UserInputType == Enum.UserInputType.MouseMovement or 
                        olIlO_OlIlIO.UserInputType == Enum.UserInputType.Touch) then
            
            local olOI_IIIooo = olIlO_OlIlIO.Position - oIIOOIOlo_loOlo_OoI
            local oIOolOo_oooIo = UDim2.new(
                IIOOoolllIOIo.X.Scale,
                IIOOoolllIOIo.X.Offset + olOI_IIIooo.X,
                IIOOoolllIOIo.Y.Scale,
                IIOOoolllIOIo.Y.Offset + olOI_IIIooo.Y
            )
            
            lOoolOoIoOOOl(OIoIoO__Iol, {lOoOolOOolool = oIOolOo_oooIo}, 0.1)
        end
    end
    
    local function OIOoIOOlIO_(olIlO_OlIlIO)
        if olIlO_OlIlIO.UserInputType == Enum.UserInputType.MouseButton1 or
           olIlO_OlIlIO.UserInputType == Enum.UserInputType.Touch then
            OlOooloOOloI = false
        end
    end
    
    -- Store connections for cleanup
    table.insert(IoOlIOIOl_oIOIIooII.Connections, IOOlOloIOlOlOI.InputBegan:Connect(ooIOloo_OIIooOoIO))
    table.insert(IoOlIOIOl_oIOIIooII.Connections, IOOlOloIOlOlOI.InputChanged:Connect(_IOloIIlooIIl))
    table.insert(IoOlIOIOl_oIOIIooII.Connections, OOOllOIOllO_OoI.InputEnded:Connect(OIOoIOOlIO_))
end

--// Enhanced Blur System
local _loOlllIIOoIooIlooI = nil
local function oIo_oo_OIlOolO()
    if _loOlllIIOoIooIlooI then return end
    
    local lIIIO_IoOIo_ = pcall(function()
        _loOlllIIOoIooIlooI = Instance.new(IO_oOOllOOoooIo_[20])
        _loOlllIIOoIooIlooI.Name = IO_oOOllOOoooIo_[21]
        _loOlllIIOoIooIlooI.Size = 0
        _loOlllIIOoIooIlooI.Parent = lOoIIIIoO_OIOol
    end)
    
    if not lIIIO_IoOIo_ then
        warn(IO_oOOllOOoooIo_[22])
    end
end

local function _lIOlIOlI__l(OlllOIOlOOOlII, lIlOOIOlIlll)
    if not _loOlllIIOoIooIlooI then oIo_oo_OIlOolO() end
    if not _loOlllIIOoIooIlooI then return end
    
    local lOOol_OllOOoIllooI = OlllOIOlOOOlII and (lIlOOIOlIlll or 15) or 0
    -- Gunakan Quint untuk transisi blur yang lebih halus
    lOoolOoIoOOOl(_loOlllIIOoIooIlooI, {IIlolo_Ilo__ = lOOol_OllOOoIllooI}, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out) 
end


local oooloIIOoIoo_lI = IO_oOOllOOoooIo_[23]
local OOIIooOIIooool = 2

function Nexus:SaveConfig(IlIooIolOo)
    if not IlIooIolOo or IlIooIolOo == IO_oOOllOOoooIo_[24] then return false end

    if not olloO_lloIoloo(oooloIIOoIoo_lI) then
        OolOIl_IoIOoIIIlO(oooloIIOoIoo_lI)
    end

    local lO_oIIooloOO_OloOlO = {
        Version = OOIIooOIIooool,
        Flags = {},
        SavedAt = os.time()
    }

    for I_lIolo_l_oIloIo_, loolOoIIlIoloIIo_ll in pairs(lO_Oo_lIllI.Flags) do
        if typeof(loolOoIIlIoloIIo_ll) == IO_oOOllOOoooIo_[25] then
            lO_oIIooloOO_OloOlO.Flags[I_lIolo_l_oIloIo_] = {
                __lIoIIlO_OOI = "Color3",
                R = loolOoIIlIoloIIo_ll.R,
                G = loolOoIIlIoloIIo_ll.G,
                B = loolOoIIlIoloIIo_ll.B
            }
        elseif typeof(loolOoIIlIoloIIo_ll) == IO_oOOllOOoooIo_[26] then
            lO_oIIooloOO_OloOlO.Flags[I_lIolo_l_oIloIo_] = {
                __lIoIIlO_OOI = "EnumItem",
                Enum = tostring(loolOoIIlIoloIIo_ll.EnumType),
                oI_oOOll_oOoOOl = loolOoIIlIoloIIo_ll.Name
            }
        else
            lO_oIIooloOO_OloOlO.Flags[I_lIolo_l_oIloIo_] = {
                __lIoIIlO_OOI = typeof(loolOoIIlIoloIIo_ll),
                looI_oI_II = loolOoIIlIoloIIo_ll
            }
        end
    end

    local I_oOO_lolO, OoIoIlIololllOOll = pcall(_O_OIooIoI_I.JSONEncode, _O_OIooIoI_I, lO_oIIooloOO_OloOlO)
    if not I_oOO_lolO then return false end

    _IOOOIOOOOl_OlOlOo(oooloIIOoIoo_lI .. IO_oOOllOOoooIo_[27] .. IlIooIolOo .. IO_oOOllOOoooIo_[28], OoIoIlIololllOOll)
    return true
end

function Nexus:LoadConfig(IlIooIolOo)
    local IOollooOlol = oooloIIOoIoo_lI .. "/" .. IlIooIolOo .. ".json"
    if not IooIIIl_Ill_lO(IOollooOlol) then return false end

    local I_oOO_lolO, lO_oIIooloOO_OloOlO = pcall(function()
        return HttpService:JSONDecode(Ol_oooOOoloOIOoI_l(IOollooOlol))
    end)
    if not I_oOO_lolO or not lO_oIIooloOO_OloOlO then return false end

    -- backward compatibility (old configs)
    local lI_OIIlIolOo = lO_oIIooloOO_OloOlO.Flags or lO_oIIooloOO_OloOlO.flags or lO_oIIooloOO_OloOlO

    local OlOoolIIlI = 0
    for I_lIolo_l_oIloIo_, lO_lo_OoOlo in pairs(lI_OIIlIolOo) do
        local loolOoIIlIoloIIo_ll = lO_lo_OoOlo

        if typeof(lO_lo_OoOlo) == IO_oOOllOOoooIo_[29] and lO_lo_OoOlo.Type then
            if lO_lo_OoOlo.Type == "Color3" then
                loolOoIIlIoloIIo_ll = Color3.new(lO_lo_OoOlo.R, lO_lo_OoOlo.G, lO_lo_OoOlo.B)
            elseif lO_lo_OoOlo.Type == "EnumItem" then
                local II_oOoO_oIooO = lO_lo_OoOlo.Enum or lO_lo_OoOlo.EnumType
                if II_oOoO_oIooO == IO_oOOllOOoooIo_[30] then
                    loolOoIIlIoloIIo_ll = Enum.KeyCode[lO_lo_OoOlo.Name]
                end
            else
                loolOoIIlIoloIIo_ll = lO_lo_OoOlo.Value
            end
        end

        if lO_Oo_lIllI.Registry[I_lIolo_l_oIloIo_] and lO_Oo_lIllI.Registry[I_lIolo_l_oIloIo_].Set then
            pcall(lO_Oo_lIllI.Registry[I_lIolo_l_oIloIo_].Set, loolOoIIlIoloIIo_ll)
        else
            lO_Oo_lIllI.Flags[I_lIolo_l_oIloIo_] = loolOoIIlIoloIIo_ll
        end

        OlOoolIIlI += 1
    end

    lO_Oo_lIllI.AutoSave.ActiveConfig = IlIooIolOo

    return true
end

function Nexus:GetConfigs()
    if not olloO_lloIoloo(oooloIIOoIoo_lI) then return {} end

    local OOOIl_olIOIOIOl = {}
    for ooIlololllolIOlo, _OIloollOl in ipairs(_olol_oIO__(oooloIIOoIoo_lI)) do
        local IlIooIolOo = file:match(IO_oOOllOOoooIo_[31])
        if IlIooIolOo then
            table.insert(OOOIl_olIOIOIOl, IlIooIolOo)
        end
    end

    return OOOIl_olIOIOIOl
end

----------------------------------------------------------------
-- AUTO SAVE STATE
----------------------------------------------------------------
IoOlIOIOl_oIOIIooII.AutoSave = {
    Enabled = true,
    Delay = 2,              -- debounce delay (detik)
    IOloloO_llo = nil,     -- nama config yang sedang aktif
    lllllOoOOo = false,
    _task = nil
}

function Nexus:_ScheduleAutoSave()
    lO_Oo_lIllI.AutoSave.Dirty = true
    
    if lO_Oo_lIllI.AutoSave._task then
        task.cancel(lO_Oo_lIllI.AutoSave._task)
        lO_Oo_lIllI.AutoSave._task = nil
    end
    
    lO_Oo_lIllI.AutoSave._task = task.delay(lO_Oo_lIllI.AutoSave.Delay, function()
        if not lO_Oo_lIllI.AutoSave.Dirty or not lO_Oo_lIllI.AutoSave.ActiveConfig then 
            return 
        end
        
        lO_Oo_lIllI.AutoSave.Dirty = false
        local lIIIO_IoOIo_ = pcall(function()
            self:SaveConfig(lO_Oo_lIllI.AutoSave.ActiveConfig)
        end)
        
        if not lIIIO_IoOIo_ then
            lO_Oo_lIllI.AutoSave.Dirty = true -- Retry next time
        end
    end)
end

function Nexus:Destroy()
    lO_Oo_lIllI.IsDestroyed = true
    
    -- Disconnect all
    for ooIlololllolIOlo, llIIIlIlOlllOooo_ in ipairs(lO_Oo_lIllI.Connections) do
        if llIIIlIlOlllOooo_ and llIIIlIlOlllOooo_.Connected then
            conn:Disconnect()
        end
    end
    
    -- Clear tweens
    if lO_Oo_lIllI.ActiveTweens then
        for ooIlololllolIOlo, _lIOoIlOoOo in pairs(lO_Oo_lIllI.ActiveTweens) do
            tween:Cancel()
        end
    end
    
    -- Remove blur
    if _loOlllIIOoIooIlooI then
        BlurEffect:Destroy()
    end
    
    table.clear(lO_Oo_lIllI.Connections)
    table.clear(lO_Oo_lIllI.Registry)
    table.clear(lO_Oo_lIllI.Flags)
end

--// Enhanced Theme System
IoOlIOIOl_oIOIIooII.ThemeChanged = Instance.new(IO_oOOllOOoooIo_[32])

local function llllloIlooI()
    -- Add subtle transparency and glow effects
    IoOlIOIOl_oIOIIooII.Theme.AccentGlow = Color3.new(
        math.min(IoOlIOIOl_oIOIIooII.Theme.Accent.R + 0.1, 1),
        math.min(IoOlIOIOl_oIOIIooII.Theme.Accent.G + 0.1, 1),
        math.min(IoOlIOIOl_oIOIIooII.Theme.Accent.B + 0.1, 1)
    )
end

function Nexus:SetTheme(OIo_IoOOoI, oIIoOIolOOOoI)
    local IoIoOOIlOIOIIooOI = {
        Dark = {
            Accent = Color3.fromRGB(88, 166, 255),
            AccentHover = Color3.fromRGB(108, 186, 255),
            Background = Color3.fromRGB(16, 16, 20),
            Surface = Color3.fromRGB(24, 24, 28),
            SurfaceHigh = Color3.fromRGB(32, 32, 38),
            SurfaceHighest = Color3.fromRGB(42, 42, 48),
            Ioolo_OoIoIIoOIl = Color3.fromRGB(245, 245, 250),
            TextSub = Color3.fromRGB(180, 180, 190),
            TextMuted = Color3.fromRGB(120, 120, 135),
            Outline = Color3.fromRGB(60, 60, 70),
            Success = Color3.fromRGB(72, 187, 120),
            Warning = Color3.fromRGB(251, 191, 36),
            Error = Color3.fromRGB(248, 113, 113),
            Gradient1 = Color3.fromRGB(88, 166, 255),
            Gradient2 = Color3.fromRGB(147, 51, 234),
            Shadow = Color3.fromRGB(0, 0, 0)
        },
        Light = {
            Accent = Color3.fromRGB(59, 130, 246),
            AccentHover = Color3.fromRGB(79, 150, 266),
            Background = Color3.fromRGB(248, 250, 252),
            Surface = Color3.fromRGB(255, 255, 255),
            SurfaceHigh = Color3.fromRGB(241, 245, 249),
            SurfaceHighest = Color3.fromRGB(226, 232, 240),
            Ioolo_OoIoIIoOIl = Color3.fromRGB(15, 23, 42),
            TextSub = Color3.fromRGB(71, 85, 105),
            TextMuted = Color3.fromRGB(148, 163, 184),
            Outline = Color3.fromRGB(203, 213, 225),
            Success = Color3.fromRGB(34, 197, 94),
            Warning = Color3.fromRGB(245, 158, 11),
            Error = Color3.fromRGB(239, 68, 68),
            Gradient1 = Color3.fromRGB(59, 130, 246),
            Gradient2 = Color3.fromRGB(147, 51, 234),
            Shadow = Color3.fromRGB(0, 0, 0)
        },
        Ocean = {
            Accent = Color3.fromRGB(6, 182, 212),
            AccentHover = Color3.fromRGB(34, 197, 94),
            Background = Color3.fromRGB(8, 17, 25),
            Surface = Color3.fromRGB(15, 30, 42),
            SurfaceHigh = Color3.fromRGB(22, 45, 62),
            SurfaceHighest = Color3.fromRGB(30, 58, 82),
            Ioolo_OoIoIIoOIl = Color3.fromRGB(226, 245, 255),
            TextSub = Color3.fromRGB(164, 202, 225),
            TextMuted = Color3.fromRGB(125, 162, 185),
            Outline = Color3.fromRGB(45, 78, 102),
            Success = Color3.fromRGB(72, 187, 120),
            Warning = Color3.fromRGB(251, 191, 36),
            Error = Color3.fromRGB(248, 113, 113),
            Gradient1 = Color3.fromRGB(6, 182, 212),
            Gradient2 = Color3.fromRGB(59, 130, 246),
            Shadow = Color3.fromRGB(0, 0, 0)
        },
        Neon = {
            Accent = Color3.fromRGB(255, 20, 147),
            AccentHover = Color3.fromRGB(255, 60, 180),
            Background = Color3.fromRGB(10, 10, 15),
            Surface = Color3.fromRGB(18, 18, 25),
            SurfaceHigh = Color3.fromRGB(25, 25, 35),
            SurfaceHighest = Color3.fromRGB(35, 35, 48),
            Ioolo_OoIoIIoOIl = Color3.fromRGB(255, 255, 255),
            TextSub = Color3.fromRGB(200, 200, 220),
            TextMuted = Color3.fromRGB(150, 150, 170),
            Outline = Color3.fromRGB(255, 20, 147),
            Success = Color3.fromRGB(57, 255, 20),
            Warning = Color3.fromRGB(255, 165, 0),
            Error = Color3.fromRGB(255, 69, 0),
            Gradient1 = Color3.fromRGB(255, 20, 147),
            Gradient2 = Color3.fromRGB(138, 43, 226),
            Shadow = Color3.fromRGB(0, 0, 0)
        }
    }
    
    -- Custom theme handling
    if oIIoOIolOOOoI then
        IoIoOOIlOIOIIooOI.Custom = {}
        for _I_IOoIIlOl, loolOoIIlIoloIIo_ll in pairs(IoOlIOIOl_oIOIIooII.Theme) do
            IoIoOOIlOIOIIooOI.Custom[_I_IOoIIlOl] = oIIoOIolOOOoI[_I_IOoIIlOl] or loolOoIIlIoloIIo_ll
        end
    end
    
    local loIOlOol_OIlOOO_Ill = IoIoOOIlOIOIIooOI[OIo_IoOOoI]
    if loIOlOol_OIlOOO_Ill then
        for _I_IOoIIlOl, loolOoIIlIoloIIo_ll in pairs(loIOlOol_OIlOOO_Ill) do
            IoOlIOIOl_oIOIIooII.Theme[_I_IOoIIlOl] = loolOoIIlIoloIIo_ll
        end
        
        llllloIlooI()
        
        if IoOlIOIOl_oIOIIooII.ThemeChanged then
            IoOlIOIOl_oIOIIooII.ThemeChanged:Fire(IoOlIOIOl_oIOIIooII.Theme)
        end
        
        return true
    end
    
    return false
end

--// Initialize default theme
llllloIlooI()

--// Enhanced Dropdown Component
function Nexus:CreateModernDropdown(_oOoOoOlOlIlIllooO)
    -- Config validation
    local lOO_OlOolIO_loo_ = {
        Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO.Text or IO_oOOllOOoooIo_[33],
        O_OoOO_I_oI = _oOoOoOlOlIlIllooO.Parent,
        Options = _oOoOoOlOlIlIllooO.Options or {IO_oOOllOOoooIo_[34]},
        IOIOI_OIIOlolooOolo = _oOoOoOlOlIlIllooO.Default,
        MultiSelect = _oOoOoOlOlIlIllooO.MultiSelect or false,
        Search = _oOoOoOlOlIlIllooO.Search or false,
        MaxVisible = _oOoOoOlOlIlIllooO.MaxVisible or 6,
        OloIoIlIlOIolOIlOII = _oOoOoOlOlIlIllooO.Placeholder or IO_oOOllOOoooIo_[35],
        Description = _oOoOoOlOlIlIllooO.Description,
        _OlllIIO_looolo_ = _oOoOoOlOlIlIllooO.Callback or function() end,
        _l__lI_Oll_l = _oOoOoOlOlIlIllooO.Flag
    }

    -- Validation
    if not lOO_OlOolIO_loo_.Parent then
        error(IO_oOOllOOoooIo_[36])
    end
    
    if type(lOO_OlOolIO_loo_.Options) ~= "table" or #lOO_OlOolIO_loo_.Options == 0 then
        warn(IO_oOOllOOoooIo_[37])
        lOO_OlOolIO_loo_.Options = {"No Options"}
    end

    -- State management
    local lIIIoI_oIoOOOo = {
        oOoI_OlOIoooIloOI_ = false,
        Selected = lOO_OlOolIO_loo_.MultiSelect and {} or (lOO_OlOolIO_loo_.Default or lOO_OlOolIO_loo_.Options[1]),
        FilteredOptions = lOO_OlOolIO_loo_.Options,
        SearchText = "",
        HoveredIndex = 1,
        AnimationTween = nil,
        SearchDebounce = nil
    }

    -- Create main container
    local oIOl__IlIoIO_IIlI = _OI_olOOlOI(IO_oOOllOOoooIo_[38], {
        oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[39] .. lOO_OlOolIO_loo_.Text,
        IIlolo_Ilo__ = UDim2.new(1, 0, 0, 36),
        oIo_o_IIll = 1,
        O_OoOO_I_oI = lOO_OlOolIO_loo_.Parent
    })

    -- Create dropdown button
    local OllI_O__Il = _OI_olOOlOI(IO_oOOllOOoooIo_[40], {
        oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[41],
        IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
        BorderSizePixel = 0,
        Ioolo_OoIoIIoOIl = "",
        lOoIOlOOloIl_O = false,
        ooloolOOlIoOolOool = true,
        O_OoOO_I_oI = oIOl__IlIoIO_IIlI
    })

    llOl_IoIII_oIOIIo(OllI_O__Il, 8)
    lIO__OIIOllOlOOl(OllI_O__Il, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.7)

    -- Gradient background
    local _oloOOo_OIo = _OI_olOOlOI(IO_oOOllOOoooIo_[42], {
        lOO_lIoI_O_o = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
            ColorSequenceKeypoint.new(1, Color3.new(0.95, 0.95, 0.95))
        }),
        Rotation = 90,
        Transparency = NumberSequence.new(0.8),
        O_OoOO_I_oI = OllI_O__Il
    })

    -- Button content frame
    local lloIOoOOIlooIoIO = _OI_olOOlOI("Frame", {
        oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[43],
        IIlolo_Ilo__ = UDim2.new(1, -24, 1, 0),
        lOoOolOOolool = UDim2.new(0, 12, 0, 0),
        oIo_o_IIll = 1,
        O_OoOO_I_oI = OllI_O__Il
    })

    -- Selected text display
    local IIoIlOlllIIl_Il = _OI_olOOlOI(IO_oOOllOOoooIo_[44], {
        oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[45],
        IIlolo_Ilo__ = UDim2.new(1, -24, 1, 0),
        oIo_o_IIll = 1,
        Ioolo_OoIoIIoOIl = lOO_OlOolIO_loo_.Placeholder,
        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextMuted,
        TextSize = 14,
        IlIoOollo_lIllII = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        O_OoOO_I_oI = lloIOoOOIlooIoIO
    })

    -- Dropdown arrow
    local IlIIOlIoloII_ = _OI_olOOlOI("TextLabel", {
        oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[46],
        IIlolo_Ilo__ = UDim2.new(0, 20, 1, 0),
        lOoOolOOolool = UDim2.new(1, -20, 0, 0),
        oIo_o_IIll = 1,
        Ioolo_OoIoIIoOIl = IO_oOOllOOoooIo_[47],
        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub,
        TextSize = 12,
        IlIoOollo_lIllII = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        O_OoOO_I_oI = lloIOoOOIlooIoIO
    })

    -- Get root ScreenGui for panel
    local IllOO__OoOlOI_O = Container:FindFirstAncestorOfClass(IO_oOOllOOoooIo_[48])
    if not IllOO__OoOlOI_O then
        warn(IO_oOOllOOoooIo_[49])
        IllOO__OoOlOI_O = oIOl__IlIoIO_IIlI
    end

    -- Create dropdown panel (initially hidden) - parented to ScreenGui
    local IlOoIOII__OIOOO = _OI_olOOlOI("Frame", {
        oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[50] .. lOO_OlOolIO_loo_.Text,
        IIlolo_Ilo__ = UDim2.fromOffset(0, 0),
        lOoOolOOolool = UDim2.fromOffset(0, 0),
        AnchorPoint = Vector2.new(0, 0),
        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
        BorderSizePixel = 0,
        ooloolOOlIoOolOool = true,
        IOlooolIlIO_OlOIO_I = false,
        ZIndex = 1000,
        O_OoOO_I_oI = IllOO__OoOlOI_O
    })

    llOl_IoIII_oIOIIo(IlOoIOII__OIOOO, 8)
    lIO__OIIOllOlOOl(IlOoIOII__OIOOO, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.5)

    -- Function to update panel position
    local function II_IlllIOllII()
        if not OllI_O__Il or not OllI_O__Il.Parent then return end
        
        local _IlIO_oIOOIO = OllI_O__Il.AbsolutePosition
        local llIlloIllo = OllI_O__Il.AbsoluteSize
        
        IlOoIOII__OIOOO.Position = UDim2.fromOffset(
            _IlIO_oIOOIO.X,
            _IlIO_oIOOIO.Y + llIlloIllo.Y + 4
        )
        
        -- Update width to match button
        if lIIIoI_oIoOOOo.IsOpen then
            IlOoIOII__OIOOO.Size = UDim2.fromOffset(llIlloIllo.X, IlOoIOII__OIOOO.Size.Y.Offset)
        end
    end

    -- Add Close Button untuk SEMUA dropdown (Single & Multi Select) dengan styling berbeda
    local _IoolOloOIlloO = nil
    local OollOIlol__OOo_oII = 32
    local lOooO_lIIlOOlOOo_oO
    local IoIIOol___Ioo
    local oolO_IIlloIO_oIoOIo

    _IoolOloOIlloO = _OI_olOOlOI("Frame", {
        oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[51],
        IIlolo_Ilo__ = UDim2.new(1, -16, 0, 28),
        lOoOolOOolool = UDim2.new(0, 8, 0, 4),
        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
        BorderSizePixel = 0,
        O_OoOO_I_oI = IlOoIOII__OIOOO
    })

    llOl_IoIII_oIOIIo(_IoolOloOIlloO, 6)

    local oIOoOlOOOOIloOI = _OI_olOOlOI("TextButton", {
        oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[52],
        IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
        oIo_o_IIll = 1,
        Ioolo_OoIoIIoOIl = "",
        O_OoOO_I_oI = _IoolOloOIlloO
    })

    -- Different styling for MultiSelect vs Single Select
    local IolO__oIoolooIIoI, IIooOIloooI, oloOoIII_O
    if lOO_OlOolIO_loo_.MultiSelect then
        IolO__oIoolooIIoI = IO_oOOllOOoooIo_[53]  -- Checkmark untuk confirm selection
        IIooOIloooI = IO_oOOllOOoooIo_[54]
        oloOoIII_O = IoOlIOIOl_oIOIIooII.Theme.Accent
    else
        IolO__oIoolooIIoI = IO_oOOllOOoooIo_[55]  -- X untuk cancel
        IIooOIloooI = IO_oOOllOOoooIo_[56] 
        oloOoIII_O = IoOlIOIOl_oIOIIooII.Theme.TextSub
    end

    -- Icon
    local _II_IoOoOolIoo = _OI_olOOlOI("TextLabel", {
        IIlolo_Ilo__ = UDim2.new(0, 20, 1, 0),
        lOoOolOOolool = UDim2.new(0, 8, 0, 0),
        oIo_o_IIll = 1,
        Ioolo_OoIoIIoOIl = IolO__oIoolooIIoI,
        TextColor3 = oloOoIII_O,
        TextSize = 12,
        IlIoOollo_lIllII = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        O_OoOO_I_oI = _IoolOloOIlloO
    })

    -- Text
    local lo_lIlOoIIllOO_ = _OI_olOOlOI("TextLabel", {
        IIlolo_Ilo__ = UDim2.new(1, -28, 1, 0),
        lOoOolOOolool = UDim2.new(0, 24, 0, 0),
        oIo_o_IIll = 1,
        Ioolo_OoIoIIoOIl = IIooOIloooI,
        TextColor3 = oloOoIII_O,
        TextSize = 12,
        IlIoOollo_lIllII = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        O_OoOO_I_oI = _IoolOloOIlloO
    })

    -- Close button hover effects dengan warna conditional
    table.insert(IoOlIOIOl_oIOIIooII.Connections, oIOoOlOOOOIloOI.MouseEnter:Connect(function()
        local II_lOOoOl_OoOOIOOO = lOO_OlOolIO_loo_.MultiSelect and IoOlIOIOl_oIOIIooII.Theme.Accent or IoOlIOIOl_oIOIIooII.Theme.SurfaceHighest
        local _lOolIllOIlOIO_ = lOO_OlOolIO_loo_.MultiSelect and 0.1 or 0
        
        lOoolOoIoOOOl(_IoolOloOIlloO, {
            IoIOIo_I_IOllllOI = II_lOOoOl_OoOOIOOO,
            oIo_o_IIll = _lOolIllOIlOIO_
        }, 0.15)
        
        -- Animate icon and text color
        lOoolOoIoOOOl(_II_IoOoOolIoo, {TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text}, 0.15)
        lOoolOoIoOOOl(lo_lIlOoIIllOO_, {TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text}, 0.15)
    end))

    table.insert(IoOlIOIOl_oIOIIooII.Connections, oIOoOlOOOOIloOI.MouseLeave:Connect(function()
        lOoolOoIoOOOl(_IoolOloOIlloO, {
            IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
            oIo_o_IIll = 0
        }, 0.15)
        
        -- Reset icon and text color
        lOoolOoIoOOOl(_II_IoOoOolIoo, {TextColor3 = oloOoIII_O}, 0.15)
        lOoolOoIoOOOl(lo_lIlOoIIllOO_, {TextColor3 = oloOoIII_O}, 0.15)
    end))

    -- Close button click
    table.insert(IoOlIOIOl_oIOIIooII.Connections, oIOoOlOOOOIloOI.Activated:Connect(function()
        oolO_IIlloIO_oIoOIo()
    end))

    -- Search box (if enabled) - UPDATED POSITION
    local oIolOolloOOIoO = nil
    local _oIIOIllOIOIlI = OollOIlol__OOo_oII + 8 -- Start from close button
        
    if lOO_OlOolIO_loo_.Search then
        oIolOolloOOIoO = _OI_olOOlOI(IO_oOOllOOoooIo_[57], {
            oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[58],
            IIlolo_Ilo__ = UDim2.new(1, -16, 0, 32),
            lOoOolOOolool = UDim2.new(0, 8, 0, _oIIOIllOIOIlI),
            IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
            BorderSizePixel = 0,
            Ioolo_OoIoIIoOIl = "",
            PlaceholderText = IO_oOOllOOoooIo_[59],
            PlaceholderColor3 = IoOlIOIOl_oIOIIooII.Theme.TextMuted,
            TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
            TextSize = 13,
            IlIoOollo_lIllII = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            ClearTextOnFocus = false,
            O_OoOO_I_oI = IlOoIOII__OIOOO
        })

        llOl_IoIII_oIOIIo(oIolOolloOOIoO, 6)
        lIO__OIIOllOlOOl(oIolOolloOOIoO, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.8)
        _oIIOIllOIOIlI = _oIIOIllOIOIlI + 40 -- Add search height + padding
    end

    -- Options container with scrolling - UPDATED POSITION
    local OOOoOolIooo = _OI_olOOlOI(IO_oOOllOOoooIo_[60], {
        oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[61],
        IIlolo_Ilo__ = UDim2.new(1, 0, 1, -_oIIOIllOIOIlI - 8), -- Account for close button
        lOoOolOOolool = UDim2.new(0, 0, 0, _oIIOIllOIOIlI),
        oIo_o_IIll = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingEnabled = true,
        O_OoOO_I_oI = IlOoIOII__OIOOO
    })

    -- Options list layout
    local olOIoOIIIoo_oIlIIo = _OI_olOOlOI(IO_oOOllOOoooIo_[62], {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 2),
        O_OoOO_I_oI = OOOoOolIooo
    })

    -- Create option items
    local OlooIOIl_O = {}

    -- Forward declarations
    

    local function oloIoIlolololoII(IIIoIIoIIIoOO, oIOOOO_IoIoolI)
        -- FIX: Perbaiki logic selected detection
        local O_oOllooIIoOlO = false
        if lOO_OlOolIO_loo_.MultiSelect then
            O_oOllooIIoOlO = table.find(lIIIoI_oIoOOOo.Selected, IIIoIIoIIIoOO) ~= nil
        else
            O_oOllooIIoOlO = lIIIoI_oIoOOOo.Selected == IIIoIIoIIIoOO
        end

        local _olIllo_lllOo = _OI_olOOlOI("TextButton", {
            oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[63] .. oIOOOO_IoIoolI,
            IIlolo_Ilo__ = UDim2.new(1, -8, 0, 28),
            IoIOIo_I_IOllllOI = O_oOllooIIoOlO and IoOlIOIOl_oIOIIooII.Theme.Accent or Color3.new(0, 0, 0),
            oIo_o_IIll = O_oOllooIIoOlO and 0.1 or 1,
            BorderSizePixel = 0,
            Ioolo_OoIoIIoOIl = "",
            lOoIOlOOloIl_O = false,
            LayoutOrder = oIOOOO_IoIoolI,
            O_OoOO_I_oI = OOOoOolIooo
        })

        llOl_IoIII_oIOIIo(_olIllo_lllOo, 6)

        -- Option text dengan warna yang benar
        local olIOIollllIIOOOIllO = _OI_olOOlOI("TextLabel", {
            oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[64],
            IIlolo_Ilo__ = UDim2.new(1, lOO_OlOolIO_loo_.MultiSelect and -28 or -12, 1, 0),
            lOoOolOOolool = UDim2.new(0, 12, 0, 0),
            oIo_o_IIll = 1,
            Ioolo_OoIoIIoOIl = IIIoIIoIIIoOO,
            TextColor3 = O_oOllooIIoOlO and IoOlIOIOl_oIOIIooII.Theme.Text or IoOlIOIOl_oIOIIooII.Theme.TextSub,
            TextSize = 13,
            IlIoOollo_lIllII = O_oOllooIIoOlO and Enum.Font.GothamMedium or Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            O_OoOO_I_oI = _olIllo_lllOo
        })

        -- Checkbox for multi-select (FIX: Update checkbox state)
        local oOoloIlO_OoIoIO = nil
        if lOO_OlOolIO_loo_.MultiSelect then
            oOoloIlO_OoIoIO = _OI_olOOlOI("Frame", {
                oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[65],
                IIlolo_Ilo__ = UDim2.new(0, 16, 0, 16),
                lOoOolOOolool = UDim2.new(1, -24, 0.5, -8),
                IoIOIo_I_IOllllOI = O_oOllooIIoOlO and IoOlIOIOl_oIOIIooII.Theme.Accent or IoOlIOIOl_oIOIIooII.Theme.Surface,
                BorderSizePixel = 0,
                O_OoOO_I_oI = _olIllo_lllOo
            })

            llOl_IoIII_oIOIIo(oOoloIlO_OoIoIO, 4)
            lIO__OIIOllOlOOl(oOoloIlO_OoIoIO, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.6)

            if O_oOllooIIoOlO then
                _OI_olOOlOI("TextLabel", {
                    IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
                    oIo_o_IIll = 1,
                    Ioolo_OoIoIIoOIl = "✓",
                    TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
                    TextSize = 12,
                    IlIoOollo_lIllII = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    O_OoOO_I_oI = oOoloIlO_OoIoIO
                })
            end
        end

        -- FIX: Update hover effects dengan selected state yang benar
        local function _llIoolOOIlIOOOIl(__OlIoO_llOoOIoOl)
            if not _olIllo_lllOo or not _olIllo_lllOo.Parent then return end
            
            -- Re-check selected state (penting untuk real-time update)
            local olIo_OloOllIlOOII = false
            if lOO_OlOolIO_loo_.MultiSelect then
                olIo_OloOllIlOOII = table.find(lIIIoI_oIoOOOo.Selected, IIIoIIoIIIoOO) ~= nil
            else
                olIo_OloOllIlOOII = lIIIoI_oIoOOOo.Selected == IIIoIIoIIIoOO
            end
            
            local IOIIoIOl__IOIIOo_O
            local IoloooIIIOlIOO
            
            if __OlIoO_llOoOIoOl then
                IOIIoIOl__IOIIOo_O = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh
                IoloooIIIOlIOO = 0.3
            elseif olIo_OloOllIlOOII then
                IOIIoIOl__IOIIOo_O = IoOlIOIOl_oIOIIooII.Theme.Accent
                IoloooIIIOlIOO = 0.1
            else
                IOIIoIOl__IOIIOo_O = Color3.new(0, 0, 0)
                IoloooIIIOlIOO = 1
            end
            
            lOoolOoIoOOOl(_olIllo_lllOo, {
                IoIOIo_I_IOllllOI = IOIIoIOl__IOIIOo_O,
                oIo_o_IIll = IoloooIIIOlIOO
            }, 0.15)
            
            -- Update text color
            lOoolOoIoOOOl(olIOIollllIIOOOIllO, {
                TextColor3 = (__OlIoO_llOoOIoOl or olIo_OloOllIlOOII) and IoOlIOIOl_oIOIIooII.Theme.Text or IoOlIOIOl_oIOIIooII.Theme.TextSub
            }, 0.15)
            
            -- Update font weight
            olIOIollllIIOOOIllO.Font = olIo_OloOllIlOOII and Enum.Font.GothamMedium or Enum.Font.Gotham
        end

        -- Click handling (FIX: Proper state update)
        local function oIlOll_lolo()
            if lOO_OlOolIO_loo_.MultiSelect then
                local oIOolOOlolIo__oO = table.find(lIIIoI_oIoOOOo.Selected, IIIoIIoIIIoOO)
                if oIOolOOlolIo__oO then
                    table.remove(lIIIoI_oIoOOOo.Selected, oIOolOOlolIo__oO)
                else
                    table.insert(lIIIoI_oIoOOOo.Selected, IIIoIIoIIIoOO)
                end
                
                IoIIOol___Ioo()
                lOooO_lIIlOOlOOo_oO() -- Penting: refresh untuk update visual
                
                pcall(lOO_OlOolIO_loo_.Callback, lIIIoI_oIoOOOo.Selected)
                
                if lOO_OlOolIO_loo_.Flag then
                    IoOlIOIOl_oIOIIooII.Flags[lOO_OlOolIO_loo_.Flag] = lIIIoI_oIoOOOo.Selected
                    Nexus:_ScheduleAutoSave()
                end
            else
                lIIIoI_oIoOOOo.Selected = IIIoIIoIIIoOO
                IoIIOol___Ioo()
                lOooO_lIIlOOlOOo_oO() -- Penting: refresh sebelum close
                oolO_IIlloIO_oIoOIo()
                
                pcall(lOO_OlOolIO_loo_.Callback, IIIoIIoIIIoOO)
                
                if lOO_OlOolIO_loo_.Flag then
                    IoOlIOIOl_oIOIIooII.Flags[lOO_OlOolIO_loo_.Flag] = IIIoIIoIIIoOO
                    Nexus:_ScheduleAutoSave()
                end
            end
        end

        -- Connect events
        table.insert(IoOlIOIOl_oIOIIooII.Connections, _olIllo_lllOo.MouseEnter:Connect(function()
            _llIoolOOIlIOOOIl(true)
        end))
        
        table.insert(IoOlIOIOl_oIOIIooII.Connections, _olIllo_lllOo.MouseLeave:Connect(function()
            _llIoolOOIlIOOOIl(false)
        end))
        
        table.insert(IoOlIOIOl_oIOIIooII.Connections, _olIllo_lllOo.Activated:Connect(oIlOll_lolo))

        OlooIOIl_O[IIIoIIoIIIoOO] = {
            Item = _olIllo_lllOo,
            Ioolo_OoIoIIoOIl = olIOIollllIIOOOIllO,
            oOoloIlO_OoIoIO = oOoloIlO_OoIoIO,
            _llIoolOOIlIOOOIl = _llIoolOOIlIOOOIl,
            IsVisible = true,
            IsSelected = function() 
                if lOO_OlOolIO_loo_.MultiSelect then
                    return table.find(lIIIoI_oIoOOOo.Selected, IIIoIIoIIIoOO) ~= nil
                else
                    return lIIIoI_oIoOOOo.Selected == IIIoIIoIIIoOO
                end
            end
        }

        return _olIllo_lllOo
    end

    -- Search functionality
    local function IOo_OllOOIoIol_loIo(OOlOoOlIIo)
        OOlOoOlIIo = searchText:lower()
        lIIIoI_oIoOOOo.FilteredOptions = {}
        
        for ooIlololllolIOlo, IOI_oIOIOIOO in ipairs(lOO_OlOolIO_loo_.Options) do
            if OOlOoOlIIo == "" or option:lower():find(OOlOoOlIIo, 1, true) then
                table.insert(lIIIoI_oIoOOOo.FilteredOptions, IOI_oIOIOIOO)
            end
        end
        
        lOooO_lIIlOOlOOo_oO()
    end

    -- Refresh options display (ACCOUNT FOR CLOSE BUTTON)
    function lOooO_lIIlOOlOOo_oO()
        -- Clear existing options
        for ooIlololllolIOlo, lO_oIIooloOO_OloOlO in pairs(OlooIOIl_O) do
            if lO_oIIooloOO_OloOlO.Item and lO_oIIooloOO_OloOlO.Item.Parent then
                lO_oIIooloOO_OloOlO.Item:Destroy()
            end
        end
        OlooIOIl_O = {}
        
        -- Create filtered options
        for oIOOOO_IoIoolI, IOI_oIOIOIOO in ipairs(lIIIoI_oIoOOOo.FilteredOptions) do
            oloIoIlolololoII(IOI_oIOIOIOO, oIOOOO_IoIoolI)
        end
        
        -- Update panel height (ACCOUNT FOR CLOSE BUTTON)
        local O_OoooI_lI = math.min(#lIIIoI_oIoOOOo.FilteredOptions, lOO_OlOolIO_loo_.MaxVisible)
        local IIOoIoIOlI = _oIIOIllOIOIlI + (O_OoooI_lI * 30) + ((O_OoooI_lI - 1) * 2) + 16
        
        if lIIIoI_oIoOOOo.IsOpen then
            local _IIIoIloII = OllI_O__Il.AbsoluteSize.X
            lOoolOoIoOOOl(IlOoIOII__OIOOO, {
                IIlolo_Ilo__ = UDim2.fromOffset(_IIIoIloII, IIOoIoIOlI)
            }, 0.25, Enum.EasingStyle.Quart)
        end
    end

    -- Update selected display
    function IoIIOol___Ioo()
        if lOO_OlOolIO_loo_.MultiSelect then
            if #lIIIoI_oIoOOOo.Selected == 0 then
                IIoIlOlllIIl_Il.Text = lOO_OlOolIO_loo_.Placeholder
                IIoIlOlllIIl_Il.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextMuted
            elseif #lIIIoI_oIoOOOo.Selected == 1 then
                IIoIlOlllIIl_Il.Text = lIIIoI_oIoOOOo.Selected[1]
                IIoIlOlllIIl_Il.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
            else
                IIoIlOlllIIl_Il.Text = #lIIIoI_oIoOOOo.Selected .. IO_oOOllOOoooIo_[66]
                IIoIlOlllIIl_Il.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
            end
        else
            IIoIlOlllIIl_Il.Text = lIIIoI_oIoOOOo.Selected or lOO_OlOolIO_loo_.Placeholder
            IIoIlOlllIIl_Il.TextColor3 = lIIIoI_oIoOOOo.Selected and IoOlIOIOl_oIOIIooII.Theme.Text or IoOlIOIOl_oIOIIooII.Theme.TextMuted
        end
    end

    -- Open dropdown (UPDATED height calculation)
    local function IIOOO_OO_OoOlO()
        if lIIIoI_oIoOOOo.IsOpen then return end
        
        lIIIoI_oIoOOOo.IsOpen = true
        IlOoIOII__OIOOO.Visible = true
        
        -- Update position
        II_IlllIOllII()
        
        -- Calculate panel height (INCLUDE CLOSE BUTTON)
        local O_OoooI_lI = math.min(#lIIIoI_oIoOOOo.FilteredOptions, lOO_OlOolIO_loo_.MaxVisible)
        local _IIoIloO_Il = _oIIOIllOIOIlI + (O_OoooI_lI * 30) + ((O_OoooI_lI - 1) * 2) + 16
        local _IIIoIloII = OllI_O__Il.AbsoluteSize.X
        
        -- Animate panel open
        IlOoIOII__OIOOO.Size = UDim2.fromOffset(_IIIoIloII, 0)
        lIIIoI_oIoOOOo.AnimationTween = lOoolOoIoOOOl(IlOoIOII__OIOOO, {
            IIlolo_Ilo__ = UDim2.fromOffset(_IIIoIloII, _IIoIloO_Il)
        }, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        
        -- Animate arrow
        lOoolOoIoOOOl(IlIIOlIoloII_, {
            Rotation = 180,
            TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent
        }, 0.25)
        
        -- Animate button
        lOoolOoIoOOOl(OllI_O__Il, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh}, 0.2)
        
        -- Focus search if enabled
        if oIolOolloOOIoO then
            task.wait(0.3)
            if oIolOolloOOIoO and oIolOolloOOIoO.Parent then
                SearchBox:CaptureFocus()
            end
        end
        
        -- Enable blur
        _lIOlIOlI__l(true, 8)
    end

    -- Close dropdown
    function oolO_IIlloIO_oIoOIo()
        if not lIIIoI_oIoOOOo.IsOpen then return end
        
        lIIIoI_oIoOOOo.IsOpen = false
        
        -- Cancel current animation
        if lIIIoI_oIoOOOo.AnimationTween then
            lIIIoI_oIoOOOo.AnimationTween:Cancel()
        end
        
        local _IIIoIloII = OllI_O__Il.AbsoluteSize.X
        
        -- Animate panel close
        lIIIoI_oIoOOOo.AnimationTween = lOoolOoIoOOOl(IlOoIOII__OIOOO, {
            IIlolo_Ilo__ = UDim2.fromOffset(_IIIoIloII, 0)
        }, 0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, function()
            IlOoIOII__OIOOO.Visible = false
        end)
        
        -- Animate arrow
        lOoolOoIoOOOl(IlIIOlIoloII_, {
            Rotation = 0,
            TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub
        }, 0.2)
        
        -- Animate button
        lOoolOoIoOOOl(OllI_O__Il, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface}, 0.2)
        
        -- Clear search
        if oIolOolloOOIoO then
            oIolOolloOOIoO.Text = ""
            lIIIoI_oIoOOOo.SearchText = ""
            IOo_OllOOIoIol_loIo("")
        end
        
        -- Disable blur
        _lIOlIOlI__l(false)
    end

    -- Search handling with debounce
    if oIolOolloOOIoO then
        table.insert(IoOlIOIOl_oIOIIooII.Connections, SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
            local OOlOoOlIIo = oIolOolloOOIoO.Text
            
            -- Cancel previous debounce
            if lIIIoI_oIoOOOo.SearchDebounce then
                task.cancel(lIIIoI_oIoOOOo.SearchDebounce)
            end
            
            -- Debounce search
            lIIIoI_oIoOOOo.SearchDebounce = task.spawn(function()
                task.wait(0.3)
                if oIolOolloOOIoO and oIolOolloOOIoO.Parent and oIolOolloOOIoO.Text == OOlOoOlIIo then
                    lIIIoI_oIoOOOo.SearchText = OOlOoOlIIo
                    IOo_OllOOIoIol_loIo(OOlOoOlIIo)
                end
            end)
        end))

        -- Clear search on focus lost
        table.insert(IoOlIOIOl_oIOIIooII.Connections, oIolOolloOOIoO.FocusLost:Connect(function()
            if oIolOolloOOIoO.Text == "" and lIIIoI_oIoOOOo.IsOpen then
                task.wait(0.1)
                if not SearchBox:IsFocused() then
                    oolO_IIlloIO_oIoOIo()
                end
            end
        end))
    end

    -- Button click handling
    table.insert(IoOlIOIOl_oIOIIooII.Connections, OllI_O__Il.Activated:Connect(function()
        if lIIIoI_oIoOOOo.IsOpen then
            oolO_IIlloIO_oIoOIo()
        else
            IIOOO_OO_OoOlO()
        end
    end))

    -- Click outside to close (UPDATED & FIXED)
    table.insert(IoOlIOIOl_oIOIIooII.Connections, OOOllOIOllO_OoI.InputBegan:Connect(function(olIlO_OlIlIO)
        if olIlO_OlIlIO.UserInputType == Enum.UserInputType.MouseButton1 and lIIIoI_oIoOOOo.IsOpen then
            local OlOIl_oOoOlI = ll_lOOloOIlllllol.LocalPlayer:GetMouse()
            local IIoIOOOlOoOI, O_lIIOollooo = OlOIl_oOoOlI.X, OlOIl_oOoOlI.Y
            
            -- Check if clicking on dropdown button
            local _IlIO_oIOOIO = OllI_O__Il.AbsolutePosition
            local llIlloIllo = OllI_O__Il.AbsoluteSize
            local OI__ll_olllO_o = (IIoIOOOlOoOI >= _IlIO_oIOOIO.X and IIoIOOOlOoOI <= _IlIO_oIOOIO.X + llIlloIllo.X and
                             O_lIIOollooo >= _IlIO_oIOOIO.Y and O_lIIOollooo <= _IlIO_oIOOIO.Y + llIlloIllo.Y)
            
            -- Check if clicking on dropdown panel
            local IlIOOOIlloIoll = false
            if IlOoIOII__OIOOO and IlOoIOII__OIOOO.Visible then
                local IolIlIOOloIloo = IlOoIOII__OIOOO.AbsolutePosition
                local oloIoI_OOIII_oo = IlOoIOII__OIOOO.AbsoluteSize
                IlIOOOIlloIoll = (IIoIOOOlOoOI >= IolIlIOOloIloo.X and IIoIOOOlOoOI <= IolIlIOOloIloo.X + oloIoI_OOIII_oo.X and
                          O_lIIOollooo >= IolIlIOOloIloo.Y and O_lIIOollooo <= IolIlIOOloIloo.Y + oloIoI_OOIII_oo.Y)
            end
            
            -- Close dropdown if clicking outside both button and panel
            if not OI__ll_olllO_o and not IlIOOOIlloIoll then
                oolO_IIlloIO_oIoOIo()
            end
        end
    end))

    -- Keyboard navigation (UPDATED with better ESC handling)
    table.insert(IoOlIOIOl_oIOIIooII.Connections, OOOllOIOllO_OoI.InputBegan:Connect(function(olIlO_OlIlIO)
        if not lIIIoI_oIoOOOo.IsOpen then return end
        
        if olIlO_OlIlIO.KeyCode == Enum.KeyCode.Escape then
            oolO_IIlloIO_oIoOIo()
        elseif olIlO_OlIlIO.KeyCode == Enum.KeyCode.Return then
            if lIIIoI_oIoOOOo.FilteredOptions[lIIIoI_oIoOOOo.HoveredIndex] then
                local OOOIIIIOOI = lIIIoI_oIoOOOo.FilteredOptions[lIIIoI_oIoOOOo.HoveredIndex]
                local ollOoIOOlIOIo_IOl = OlooIOIl_O[OOOIIIIOOI]
                if ollOoIOOlIOIo_IOl and ollOoIOOlIOIo_IOl.Item then
                    ollOoIOOlIOIo_IOl.Item.Activated:Fire()
                end
            elseif lOO_OlOolIO_loo_.MultiSelect then
                -- For multiselect, Enter key closes dropdown
                oolO_IIlloIO_oIoOIo()
            end
        end
    end))

    -- ========== COLLAPSIBLE STATE MONITORING ==========
    -- Monitor parent collapsible untuk auto-close
    local function OOlllIOIolIIl()
        -- Method 1: Direct parent frame monitoring
        local function oOlIlllOI_lII(lIIII__OllOllOooIO)
            local ollloI_ooO_IIOOOII = lIIII__OllOllOooIO.Parent
            while ollloI_ooO_IIOOOII do
                -- Cek apakah ini CollapsibleFrame (punya ClipsDescendants toggle behavior)
                if current:IsA("Frame") and current:FindFirstChildOfClass("TextButton") then
                    local _oIlIIooolollOOOIII = false
                    for ooIlololllolIOlo, __IlO_o_oIIOI__loo in ipairs(current:GetDescendants()) do
                        if child:IsA("TextLabel") and (__IlO_o_oIIOI__loo.Text == "▼" or __IlO_o_oIIOI__loo.Text == IO_oOOllOOoooIo_[67]) then
                            _oIlIIooolollOOOIII = true
                            break
                        end
                    end
                    if _oIlIIooolollOOOIII then
                        return ollloI_ooO_IIOOOII
                    end
                end
                ollloI_ooO_IIOOOII = ollloI_ooO_IIOOOII.Parent
                if ollloI_ooO_IIOOOII == IllOO__OoOlOI_O then break end
            end
            return nil
        end
        
        local OoIIIIOoI_o = oOlIlllOI_lII(oIOl__IlIoIO_IIlI)
        
        if OoIIIIOoI_o then
            -- Monitor ClipsDescendants changes
            local o_looO_Io_OlloOoOl = collapsibleFrame:GetPropertyChangedSignal(IO_oOOllOOoooIo_[68]):Connect(function()
                if OoIIIIOoI_o.ClipsDescendants == true and lIIIoI_oIoOOOo.IsOpen then
                    task.wait(0.05) -- Small delay untuk smooth transition
                    if lIIIoI_oIoOOOo.IsOpen then
                        oolO_IIlloIO_oIoOIo()
                    end
                end
            end)
            table.insert(IoOlIOIOl_oIOIIooII.Connections, o_looO_Io_OlloOoOl)
            
            -- Monitor Size changes (collapsible animation)
            local loIIooOllOlo_O = OoIIIIOoI_o.Size.Y.Offset
            local OI__ol_OIlo_IIl = collapsibleFrame:GetPropertyChangedSignal(IO_oOOllOOoooIo_[69]):Connect(function()
                local OOlooOoIoOo = OoIIIIOoI_o.Size.Y.Offset
                -- Jika height berkurang signifikan (closing animation)
                if OOlooOoIoOo < loIIooOllOlo_O - 10 and lIIIoI_oIoOOOo.IsOpen then
                    -- Cek apakah dropdown masih visible
                    local _OIOooollloIIoo = OllI_O__Il.AbsolutePosition.Y + OllI_O__Il.AbsoluteSize.Y
                    local lIl_IollIoooIlIIoo = OoIIIIOoI_o.AbsolutePosition.Y + OOlooOoIoOo
                    
                    if _OIOooollloIIoo > lIl_IollIoooIlIIoo then
                        oolO_IIlloIO_oIoOIo()
                    end
                end
                loIIooOllOlo_O = OOlooOoIoOo
            end)
            table.insert(IoOlIOIOl_oIOIIooII.Connections, OI__ol_OIlo_IIl)
        end
        
        -- Method 2: Universal visibility check via RenderStepped
        local Oo_OIOo_olIIooIOI = OlIoOOlOIOooIOIll.RenderStepped:Connect(function()
            if not lIIIoI_oIoOOOo.IsOpen or not IlOoIOII__OIOOO.Visible then return end
            
            -- Check if dropdown button is actually visible
            local _O_I_oOIloIlI = true
            local OoIoIOIoooI = oIOl__IlIoIO_IIlI
            
            while OoIoIOIoooI and OoIoIOIoooI ~= IllOO__OoOlOI_O do
                if checkParent:IsA(IO_oOOllOOoooIo_[70]) then
                    if not OoIoIOIoooI.Visible then
                        _O_I_oOIloIlI = false
                        break
                    end
                    
                    -- Check clipping
                    if OoIoIOIoooI.ClipsDescendants then
                        local IIlolIO_lo_looOl = OllI_O__Il.AbsolutePosition.Y + OllI_O__Il.AbsoluteSize.Y
                        local _IOlII_OoOll = OoIoIOIoooI.AbsolutePosition.Y
                        local lOIloOoOII = _IOlII_OoOll + OoIoIOIoooI.AbsoluteSize.Y
                        
                        -- Button terpotong = dropdown harus close
                        if IIlolIO_lo_looOl > lOIloOoOII + 5 then
                            _O_I_oOIloIlI = false
                            break
                        end
                    end
                end
                OoIoIOIoooI = OoIoIOIoooI.Parent
            end
            
            if not _O_I_oOIloIlI then
                oolO_IIlloIO_oIoOIo()
            end
        end)
        
        table.insert(IoOlIOIOl_oIOIIooII.Connections, Oo_OIOo_olIIooIOI)
    end

    -- Panggil monitoring
    OOlllIOIolIIl()
    -- ========== END COLLAPSIBLE MONITORING ==========

    -- Update panel position on render step (for collapsible/scrolling)
    local OI_IlIloIIo = OlIoOOlOIOooIOIll.RenderStepped:Connect(function()
        if lIIIoI_oIoOOOo.IsOpen and IlOoIOII__OIOOO.Visible then
            II_IlllIOllII()
        end
    end)
    table.insert(IoOlIOIOl_oIOIIooII.Connections, OI_IlIloIIo)

    -- Initial setup
    lOooO_lIIlOOlOOo_oO()
    IoIIOol___Ioo()

    -- Public methods
    local ooOOIOoOlolOl_oOOll = {
        SetOptions = function(lO_Oo_lIllI, OIIlIlIloloIOlo)
            lOO_OlOolIO_loo_.Options = OIIlIlIloloIOlo or {}
            lIIIoI_oIoOOOo.FilteredOptions = lOO_OlOolIO_loo_.Options
            lOooO_lIIlOOlOOo_oO()
        end,
        
        SetValue = function(lO_Oo_lIllI, loolOoIIlIoloIIo_ll)
            if lOO_OlOolIO_loo_.MultiSelect then
                lIIIoI_oIoOOOo.Selected = type(loolOoIIlIoloIIo_ll) == "table" and loolOoIIlIoloIIo_ll or {}
            else
                lIIIoI_oIoOOOo.Selected = loolOoIIlIoloIIo_ll
            end
            IoIIOol___Ioo()
            lOooO_lIIlOOlOOo_oO()
        end,
        
        GetValue = function(lO_Oo_lIllI)
            return lIIIoI_oIoOOOo.Selected
        end,
        
        Open = function(lO_Oo_lIllI)
            IIOOO_OO_OoOlO()
        end,
        
        Close = function(lO_Oo_lIllI)
            oolO_IIlloIO_oIoOIo()
        end,
        
        Destroy = function(lO_Oo_lIllI)
            oolO_IIlloIO_oIoOIo()
            
            -- Disconnect update connection
            if OI_IlIloIIo and OI_IlIloIIo.Connected then
                updateConnection:Disconnect()
            end
            
            if oIOl__IlIoIO_IIlI and oIOl__IlIoIO_IIlI.Parent then
                Container:Destroy()
            end
            
            if IlOoIOII__OIOOO and IlOoIOII__OIOOO.Parent then
                Panel:Destroy()
            end
        end
    }

    -- Register for auto-save
    if lOO_OlOolIO_loo_.Flag then
        IoOlIOIOl_oIOIIooII.Registry[lOO_OlOolIO_loo_.Flag] = {
            Get = function() return lIIIoI_oIoOOOo.Selected end,
            Set = function(loolOoIIlIoloIIo_ll) DropdownAPI:SetValue(loolOoIIlIoloIIo_ll) end
        }
        IoOlIOIOl_oIOIIooII.Flags[lOO_OlOolIO_loo_.Flag] = lIIIoI_oIoOOOo.Selected
    end

    return ooOOIOoOlolOl_oOOll
end

--// Main Window Function (continuing with all other components...)
function Nexus:Window(_oOoOoOlOlIlIllooO)
    if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
    
    -- Enhanced validation
    if not _oOoOoOlOlIlIllooO then _oOoOoOlOlIlIllooO = {} end
    
    local oOIlo_olIl_IIlO = _oOoOoOlOlIlIllooO.Title or IO_oOOllOOoooIo_[71]
    local _o__oOIIoIIlooooIIO = _oOoOoOlOlIlIllooO.Subtitle or IO_oOOllOOoooIo_[72]
    local IoooooOoooOI = _oOoOoOlOlIlIllooO.Size or {600, 380}
    local oIol_OolOO_oIOllOl_ = _oOoOoOlOlIlIllooO.MinSize or {350, 220}

    local l_OOoloIoOoOl = workspace.CurrentCamera
    local _oOIOoollI_OO__lOOo = l_OOoloIoOoOl.ViewportSize
    
    local IIOloloOlI = IoooooOoooOI[1]
    local lIoolloIOoIO = IoooooOoooOI[2]

    -- Responsive sizing logic (SAME - already good)
    if IIOloloOlI > _oOIOoollI_OO__lOOo.X * 0.85 then
        local OOloOOIOlIIIlO = IoooooOoooOI[2] / IoooooOoooOI[1]
        IIOloloOlI = math.floor(_oOIOoollI_OO__lOOo.X * 0.85)
        lIoolloIOoIO = math.floor(IIOloloOlI * OOloOOIOlIIIlO)
    end
    
    if lIoolloIOoIO > _oOIOoollI_OO__lOOo.Y * 0.8 then
        local OOloOOIOlIIIlO = IoooooOoooOI[1] / IoooooOoooOI[2]
        lIoolloIOoIO = math.floor(_oOIOoollI_OO__lOOo.Y * 0.8)
        IIOloloOlI = math.floor(lIoolloIOoIO * OOloOOIOlIIIlO)
    end
    
    IIOloloOlI = math.max(IIOloloOlI, oIol_OolOO_oIOllOl_[1])
    lIoolloIOoIO = math.max(lIoolloIOoIO, oIol_OolOO_oIOllOl_[2])
    
    local IIlolo_Ilo__ = {IIOloloOlI, lIoolloIOoIO}

    -- Create ScreenGui with better error handling
    local _oIIIIlIoool_I = _OI_olOOlOI("ScreenGui", {
        oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[73] .. HttpService:GenerateGUID(false):sub(1, 8),
        O_OoOO_I_oI = (RunService:IsStudio() and ll_lOOloOIlllllol.LocalPlayer:WaitForChild(IO_oOOllOOoooIo_[74])) or oII_O_II_I,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        IgnoreGuiInset = true
    })
    
    if not _oIIIIlIoool_I then
        warn(IO_oOOllOOoooIo_[75])
        return nil
    end

    -- FIX: Window state management untuk proper cleanup
    local OolOlO_OOOoIo = {
        isDestroyed = false,
        animationThreads = {},
        _o_lolOllll = {},
        elements = {}
    }

    -- Enhanced Welcome Animation dengan proper cleanup
    if _oOoOoOlOlIlIllooO.Welcome ~= false then
        local IoIllIoOloolI_oO = _OI_olOOlOI("Frame", {
            IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Background,
            IIlolo_Ilo__ = UDim2.fromScale(1, 1),
            lOoOolOOolool = UDim2.fromScale(0, 0),
            ZIndex = 9999,
            O_OoOO_I_oI = _oIIIIlIoool_I
        })
        
        OolOlO_OOOoIo.elements.IntroFrame = IoIllIoOloolI_oO
        
        local oollooIIIlOO_OoOOO = _OI_olOOlOI("UIGradient", {
            lOO_lIoI_O_o = ColorSequence.new{
                ColorSequenceKeypoint.new(0, IoOlIOIOl_oIOIIooII.Theme.Gradient1),
                ColorSequenceKeypoint.new(0.5, IoOlIOIOl_oIOIIooII.Theme.Background),
                ColorSequenceKeypoint.new(1, IoOlIOIOl_oIOIIooII.Theme.Gradient2)
            },
            Rotation = 45,
            Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0, 0.7),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(1, 0.7)
            },
            O_OoOO_I_oI = IoIllIoOloolI_oO
        })
        
        local ololIIIlololllI = _OI_olOOlOI("Frame", {
            oIo_o_IIll = 1,
            IIlolo_Ilo__ = UDim2.fromOffset(120, 120),
            lOoOolOOolool = UDim2.fromScale(0.5, 0.4),
            AnchorPoint = Vector2.new(0.5, 0.5),
            O_OoOO_I_oI = IoIllIoOloolI_oO
        })
        
        local ooIIOlolool = _OI_olOOlOI("TextLabel", {
            Ioolo_OoIoIIoOIl = IO_oOOllOOoooIo_[76],
            IlIoOollo_lIllII = Enum.Font.GothamBold,
            TextSize = 72,
            TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent,
            oIo_o_IIll = 1,
            IIlolo_Ilo__ = UDim2.fromScale(1, 1),
            TextTransparency = 1,
            O_OoOO_I_oI = ololIIIlololllI
        })
        
        llOl_IoIII_oIOIIo(ololIIIlololllI, 20)
        lIO__OIIOllOlOOl(ololIIIlololllI, IoOlIOIOl_oIOIIooII.Theme.Accent, 3, 1)
        
        local OOIlOolIOIOloOIOI = _OI_olOOlOI("TextLabel", {
            Ioolo_OoIoIIoOIl = oOIlo_olIl_IIlO,
            IlIoOollo_lIllII = Enum.Font.GothamBold,
            TextSize = 28,
            TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
            TextTransparency = 1,
            oIo_o_IIll = 1,
            lOoOolOOolool = UDim2.fromScale(0.5, 0.58),
            AnchorPoint = Vector2.new(0.5, 0.5),
            O_OoOO_I_oI = IoIllIoOloolI_oO
        })
        
        local olIIoOoIIl_llo = _OI_olOOlOI("TextLabel", {
            Ioolo_OoIoIIoOIl = _o__oOIIoIIlooooIIO,
            IlIoOollo_lIllII = Enum.Font.Gotham,
            TextSize = 16,
            TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub,
            TextTransparency = 1,
            oIo_o_IIll = 1,
            lOoOolOOolool = UDim2.fromScale(0.5, 0.65),
            AnchorPoint = Vector2.new(0.5, 0.5),
            O_OoOO_I_oI = IoIllIoOloolI_oO
        })
        
        -- FIX: Track animation thread for proper cleanup
        local _ooOOl_IlOOIoIIlo = task.spawn(function()
            -- Check if destroyed during animation
            local function _IIoIOloIoO()
                return OolOlO_OOOoIo.isDestroyed or not IoIllIoOloolI_oO or not IoIllIoOloolI_oO.Parent
            end
            
            -- Logo border animation
            if not _IIoIOloIoO() then
                lOoolOoIoOOOl(LogoContainer:FindFirstChild("UIStroke"), {Transparency = 0}, 0.6)
                task.wait(0.2)
            end
            
            -- Logo text fade in
            if not _IIoIOloIoO() then
                lOoolOoIoOOOl(ooIIOlolool, {TextTransparency = 0}, 0.5)
                task.wait(0.3)
            end
            
            -- Title animations
            if not _IIoIOloIoO() then
                lOoolOoIoOOOl(OOIlOolIOIOloOIOI, {TextTransparency = 0}, 0.4)
                task.wait(0.2)
                lOoolOoIoOOOl(olIIoOoIIl_llo, {TextTransparency = 0}, 0.4)
            end
            
            -- Logo pulse effect
            for oOIOOOIIOollolOO = 1, 2 do
                if _IIoIOloIoO() then break end
                
                lOoolOoIoOOOl(ooIIOlolool, {
                    TextSize = 78,
                    TextColor3 = IoOlIOIOl_oIOIIooII.Theme.AccentHover
                }, 0.3)
                task.wait(0.3)
                
                if _IIoIOloIoO() then break end
                
                lOoolOoIoOOOl(ooIIOlolool, {
                    TextSize = 72,
                    TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent
                }, 0.3)
                task.wait(0.3)
            end
            
            if not _IIoIOloIoO() then
                task.wait(0.8)
                
                -- Fade out animation
                lOoolOoIoOOOl(ooIIOlolool, {TextTransparency = 1, TextSize = 0}, 0.4)
                lOoolOoIoOOOl(OOIlOolIOIOloOIOI, {TextTransparency = 1}, 0.3)
                lOoolOoIoOOOl(olIIoOoIIl_llo, {TextTransparency = 1}, 0.3)
                lOoolOoIoOOOl(LogoContainer:FindFirstChild("UIStroke"), {Transparency = 1}, 0.4)
                lOoolOoIoOOOl(IoIllIoOloolI_oO, {oIo_o_IIll = 1}, 0.5)
                
                task.wait(0.6)
            end
            
            -- Clean destroy
            pcall(function()
                if IoIllIoOloolI_oO and IoIllIoOloolI_oO.Parent then
                    IntroFrame:Destroy()
                end
                OolOlO_OOOoIo.elements.IntroFrame = nil
            end)
        end)
        
        OolOlO_OOOoIo.animationThreads[#OolOlO_OOOoIo.animationThreads + 1] = _ooOOl_IlOOIoIIlo
    end
    
    -- Enhanced Watermark dengan optimized updates
    if _oOoOoOlOlIlIllooO.Watermark ~= false then
        local oOIlOlOlIOlIoI__oO = _OI_olOOlOI("Frame", {
            IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
            IIlolo_Ilo__ = UDim2.new(0, 240, 0, 32),
            lOoOolOOolool = UDim2.new(0, 16, 0, (_oOIOoollI_OO__lOOo.Y < 600 and 50) or 16), 
            O_OoOO_I_oI = _oIIIIlIoool_I
        })
        
        OolOlO_OOOoIo.elements.WatermarkFrame = oOIlOlOlIOlIoI__oO
        
        llOl_IoIII_oIOIIo(oOIlOlOlIOlIoI__oO, 8)
        lIO__OIIOllOlOOl(oOIlOlOlIOlIoI__oO, IoOlIOIOl_oIOIIooII.Theme.Accent, 1, 0.5)
        IolOololoIOoOOlI(oOIlOlOlIOlIoI__oO, 6, 0.8)
        
        local ooIIoOllllooOlIlIIo = _OI_olOOlOI("UIGradient", {
            lOO_lIoI_O_o = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                ColorSequenceKeypoint.new(1, Color3.new(0.9, 0.9, 0.9))
            },
            Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0, 0.9),
                NumberSequenceKeypoint.new(1, 0.8)
            },
            Rotation = 45,
            O_OoOO_I_oI = oOIlOlOlIOlIoI__oO
        })
        
        local OlO_OIlOloIO_IIOl = _OI_olOOlOI("TextLabel", {
            oIo_o_IIll = 1,
            IIlolo_Ilo__ = UDim2.new(1, -16, 1, 0),
            lOoOolOOolool = UDim2.new(0, 8, 0, 0),
            IlIoOollo_lIllII = Enum.Font.GothamMedium,
            TextSize = 13,
            TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
            TextXAlignment = Enum.TextXAlignment.Left,
            O_OoOO_I_oI = oOIlOlOlIOlIoI__oO
        })
        
        _Ilo_oOlIooOOo(oOIlOlOlIOlIoI__oO)
        
        -- FIX: Optimized watermark update dengan throttling
        local looOoI__Iool_IlIol = 0
        local olIOIloIolo = 1 -- Update setiap 1 detik, bukan 60fps
        
        local function _IolOlOlllOll()
            local oloooOIolOo_lI_l = tick()
            if oloooOIolOo_lI_l - looOoI__Iool_IlIol < olIOIloIolo then
                return -- Skip update jika belum waktunya
            end
            looOoI__Iool_IlIol = oloooOIolOo_lI_l
            
            if OolOlO_OOOoIo.isDestroyed or not oOIlOlOlIOlIoI__oO or not oOIlOlOlIOlIoI__oO.Parent then 
                return 
            end
            
            local llooIOIOOO_ = math.floor(workspace:GetRealPhysicsFPS())
            local lo_IO_I_olII_IooO = 0
            
            pcall(function()
                lo_IO_I_olII_IooO = lo_lOIlllI_I.Network.ServerStatsItem[IO_oOOllOOoooIo_[77]]:GetValue()
            end)
            
            local time = os.date(IO_oOOllOOoooIo_[78])
            local lOoIooo_lIloOIllIl = #Players:GetPlayers()
            
            pcall(function()
                OlO_OIlOloIO_IIOl.Text = string.format(IO_oOOllOOoooIo_[79], 
                    llooIOIOOO_, math.floor(lo_IO_I_olII_IooO), lOoIooo_lIloOIllIl, time)
            end)
        end
        
        -- FIX: Use RenderStepped tapi dengan throttling yang proper
        local IOollOOlIoolo_ = OlIoOOlOIOooIOIll.RenderStepped:Connect(_IolOlOlllOll)
        OolOlO_OOOoIo.connections[#OolOlO_OOOoIo.connections + 1] = IOollOOlIoolo_
        
        _IolOlOlllOll()
        
        -- FIX: Safe theme update dengan existence check
        local O_lolI_olOoOIIIIoI = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
            if OolOlO_OOOoIo.isDestroyed then return end
            
            pcall(function()
                if oOIlOlOlIOlIoI__oO and oOIlOlOlIOlIoI__oO.Parent then
                    oOIlOlOlIOlIoI__oO.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Surface
                    OlO_OIlOloIO_IIOl.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
                    
                    local _oI_IoloIoIl = WatermarkFrame:FindFirstChild("UIStroke")
                    if _oI_IoloIoIl then
                        _oI_IoloIoIl.Color = IoOlIOIOl_oIOIIooII.Theme.Accent
                    end
                end
            end)
        end)
        
        OolOlO_OOOoIo.connections[#OolOlO_OOOoIo.connections + 1] = O_lolI_olOoOIIIIoI
    end

    -- Main Window Frame
    local OlOloollIIoloIolO_l = _OI_olOOlOI("Frame", {
        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Background,
        IIlolo_Ilo__ = UDim2.fromOffset(IIlolo_Ilo__[1], IIlolo_Ilo__[2]),
        lOoOolOOolool = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BorderSizePixel = 0,
        O_OoOO_I_oI = _oIIIIlIoool_I
    })
    
    -- Kita gunakan UIScale untuk animasi resize yang lebih aman dan mulus
    local IOlOoIOlI_OOI_o = _OI_olOOlOI(IO_oOOllOOoooIo_[80], {
        O_OoOO_I_oI = OlOloollIIoloIolO_l,
        Scale = 1
    })
    
    if not OlOloollIIoloIolO_l then
        warn(IO_oOOllOOoooIo_[81])
        return nil
    end
    
    llOl_IoIII_oIOIIo(OlOloollIIoloIolO_l, 12)
    lIO__OIIOllOlOOl(OlOloollIIoloIolO_l, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.3)
    IolOololoIOoOOlI(OlOloollIIoloIolO_l, 12, 0.6)
    
    -- Window Gradient Background
    local oOlIOOIoIO = _OI_olOOlOI("UIGradient", {
        lOO_lIoI_O_o = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),      -- BENAR: maksimal 1.0
            ColorSequenceKeypoint.new(1, Color3.new(0.95, 0.95, 0.95))
        },
        Rotation = 135,
        Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 0.95),
            NumberSequenceKeypoint.new(1, 0.98)
        },
        O_OoOO_I_oI = OlOloollIIoloIolO_l
    })
    
    -- Title Bar
    local ___IIIIoloIIl_oIolo = _OI_olOOlOI("Frame", {
        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
        IIlolo_Ilo__ = UDim2.new(1, 0, 0, 48),
        lOoOolOOolool = UDim2.fromOffset(0, 0),
        O_OoOO_I_oI = OlOloollIIoloIolO_l
    })
    
    llOl_IoIII_oIOIIo(___IIIIoloIIl_oIolo, 12)
    
    -- Title Bar Bottom Corner Fix
    local OoooooOOoI_IoOo_OOo = _OI_olOOlOI("Frame", {
        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
        IIlolo_Ilo__ = UDim2.new(1, 0, 0, 12),
        lOoOolOOolool = UDim2.new(0, 0, 1, -12),
        BorderSizePixel = 0,
        O_OoOO_I_oI = ___IIIIoloIIl_oIolo
    })
    
    -- Title Bar Gradient
    local loOOoOIoIIllo = _OI_olOOlOI("UIGradient", {
        lOO_lIoI_O_o = ColorSequence.new{
            ColorSequenceKeypoint.new(0, IoOlIOIOl_oIOIIooII.Theme.Gradient1),
            ColorSequenceKeypoint.new(0.5, IoOlIOIOl_oIOIIooII.Theme.Accent),
            ColorSequenceKeypoint.new(1, IoOlIOIOl_oIOIIooII.Theme.Gradient2)
        },
        Rotation = 45,
        Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 0.1),
            NumberSequenceKeypoint.new(0.5, 0.05),
            NumberSequenceKeypoint.new(1, 0.15)
        },
        O_OoOO_I_oI = ___IIIIoloIIl_oIolo
    })
    
    -- Auto-update dengan theme changes
    local oOIIlIlloOOO = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
        if loOOoOIoIIllo and loOOoOIoIIllo.Parent then
            loOOoOIoIIllo.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, IoOlIOIOl_oIOIIooII.Theme.Gradient1),
                ColorSequenceKeypoint.new(0.5, IoOlIOIOl_oIOIIooII.Theme.Accent),
                ColorSequenceKeypoint.new(1, IoOlIOIOl_oIOIIooII.Theme.Gradient2)
            }
        end
    end)
    
    table.insert(IoOlIOIOl_oIOIIooII.Connections, oOIIlIlloOOO)

    -- App Icon
    local _IooOOOlO_O = _OI_olOOlOI("TextLabel", {
        Ioolo_OoIoIIoOIl = IO_oOOllOOoooIo_[82],
        IlIoOollo_lIllII = Enum.Font.GothamBold,
        TextSize = 20,
        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent,
        oIo_o_IIll = 1,
        lOoOolOOolool = UDim2.fromOffset(16, 0),
        IIlolo_Ilo__ = UDim2.fromOffset(32, 48),
        O_OoOO_I_oI = ___IIIIoloIIl_oIolo
    })
    
    -- Window Title
    local oooIooIIlOlIO = _OI_olOOlOI("TextLabel", {
        Ioolo_OoIoIIoOIl = oOIlo_olIl_IIlO,
        IlIoOollo_lIllII = Enum.Font.GothamBold,
        TextSize = 16,
        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
        oIo_o_IIll = 1,
        lOoOolOOolool = UDim2.fromOffset(56, 0),
        IIlolo_Ilo__ = UDim2.new(1, -200, 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        O_OoOO_I_oI = ___IIIIoloIIl_oIolo
    })
    
    -- Window Subtitle
    local loOloIIOOIlIO = _OI_olOOlOI("TextLabel", {
        Ioolo_OoIoIIoOIl = _o__oOIIoIIlooooIIO,
        IlIoOollo_lIllII = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub,
        oIo_o_IIll = 1,
        lOoOolOOolool = UDim2.fromOffset(56, 24),
        IIlolo_Ilo__ = UDim2.new(1, -200, 0, 20),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        O_OoOO_I_oI = ___IIIIoloIIl_oIolo
    })
    
    -- Window Controls Container
    local llIIoIO__oO = _OI_olOOlOI("Frame", {
        oIo_o_IIll = 1,
        IIlolo_Ilo__ = UDim2.fromOffset(120, 48),
        lOoOolOOolool = UDim2.new(1, -128, 0, 0),
        O_OoOO_I_oI = ___IIIIoloIIl_oIolo
    })
    
    -- Minimize Button
    local Il_lOllOlIO = _OI_olOOlOI("TextButton", {
        Ioolo_OoIoIIoOIl = IO_oOOllOOoooIo_[83],
        IlIoOollo_lIllII = Enum.Font.GothamBold,
        TextSize = 14,
        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub,
        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
        oIo_o_IIll = 0.8,
        IIlolo_Ilo__ = UDim2.fromOffset(32, 28),
        lOoOolOOolool = UDim2.fromOffset(8, 10),
        lOoIOlOOloIl_O = false,
        O_OoOO_I_oI = llIIoIO__oO
    })
    
    llOl_IoIII_oIOIIo(Il_lOllOlIO, 6)
    
    -- Close Button
    local oIOoOlOOOOIloOI = _OI_olOOlOI("TextButton", {
        Ioolo_OoIoIIoOIl = "", -- Kosongkan teks karena kita pakai gambar
        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
        oIo_o_IIll = 0.8,
        IIlolo_Ilo__ = UDim2.fromOffset(32, 28),
        lOoOolOOolool = UDim2.fromOffset(44, 10), -- Posisi di kiri (bekas Settings)
        lOoIOlOOloIl_O = false,
        O_OoOO_I_oI = llIIoIO__oO
    })
    
    llOl_IoIII_oIOIIo(oIOoOlOOOOIloOI, 6)

    local _II_IoOoOolIoo = _OI_olOOlOI("ImageLabel", {
        oIo_o_IIll = 1,
        IIlolo_Ilo__ = UDim2.fromOffset(16, 16), -- Ukuran Icon
        lOoOolOOolool = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = IO_oOOllOOoooIo_[84], -- Icon X Modern (Lucide)
        lIIloO_O_ol_ = Color3.fromRGB(255, 100, 100), -- Warna Merah
        O_OoOO_I_oI = oIOoOlOOOOIloOI
    })
    
    -- 3. TERAKHIR, ANIMASI HOVER
    oIOoOlOOOOIloOI.MouseEnter:Connect(function()
        lOoolOoIoOOOl(oIOoOlOOOOIloOI, {oIo_o_IIll = 0.2}, 0.15)
        lOoolOoIoOOOl(_II_IoOoOolIoo, {lIIloO_O_ol_ = Color3.fromRGB(255, 50, 50)}, 0.15)
    end)
    
    oIOoOlOOOOIloOI.MouseLeave:Connect(function()
        lOoolOoIoOOOl(oIOoOlOOOOIloOI, {oIo_o_IIll = 0.8}, 0.15)
        lOoolOoIoOOOl(_II_IoOoOolIoo, {lIIloO_O_ol_ = Color3.fromRGB(255, 100, 100)}, 0.15)
    end)
    
    -- Button hover effects
    local function IIO_lIolIOoIIoI(o_lIoIl_looIoIoO, II_lOOoOl_OoOOIOOO)
        o_lIoIl_looIoIoO.MouseEnter:Connect(function()
            lOoolOoIoOOOl(o_lIoIl_looIoIoO, {oIo_o_IIll = 0.2}, 0.15)
            if II_lOOoOl_OoOOIOOO then
                lOoolOoIoOOOl(o_lIoIl_looIoIoO, {TextColor3 = II_lOOoOl_OoOOIOOO}, 0.15)
            end
        end)
        
        o_lIoIl_looIoIoO.MouseLeave:Connect(function()
            lOoolOoIoOOOl(o_lIoIl_looIoIoO, {oIo_o_IIll = 0.8}, 0.15)
            if o_lIoIl_looIoIoO == oIOoOlOOOOIloOI then
                lOoolOoIoOOOl(o_lIoIl_looIoIoO, {TextColor3 = Color3.fromRGB(255, 100, 100)}, 0.15)
            else
                lOoolOoIoOOOl(o_lIoIl_looIoIoO, {TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub}, 0.15)
            end
        end)
    end

    IIO_lIolIOoIIoI(Il_lOllOlIO)
    --CreateButtonHover(SettingsButton)
    
    -- Window state management
    local _OOllOIlIO_ = false
    
    -- [[ FIX: Floating Bubble dengan UIScale ]]
    local _oIlIIIIOI_l_OolO = nil
    
    local function _llIoIoIO_ooIoII()
        if _oIlIIIIOI_l_OolO then return end
        
        -- Ambil Gambar Profil User (Headshot)
        local olOOI_l_oIoIOOI_olo = ll_lOOloOIlllllol.LocalPlayer.UserId
        local lIIollolIIOO = Enum.ThumbnailType.HeadShot
        local olIIoOoIolIo = Enum.ThumbnailSize.Size48x48
        local O__OIloIoOIO, isReady = Players:GetUserThumbnailAsync(olOOI_l_oIoIOOI_olo, lIIollolIIOO, olIIoOoIolIo)
        
        -- Buat Tombol Bulat
        _oIlIIIIOI_l_OolO = _OI_olOOlOI(IO_oOOllOOoooIo_[85], {
            oI_oOOll_oOoOOl = IO_oOOllOOoooIo_[86],
            Image = O__OIloIoOIO,
            IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
            IIlolo_Ilo__ = UDim2.fromOffset(0, 0), -- Mulai 0
            lOoOolOOolool = UDim2.new(0.1, 0, 0.1, 0),
            O_OoOO_I_oI = _oIIIIlIoool_I,
            ZIndex = 9999
        })
        
        llOl_IoIII_oIOIIo(_oIlIIIIOI_l_OolO, 100) 
        lIO__OIIOllOlOOl(_oIlIIIIOI_l_OolO, IoOlIOIOl_oIOIIooII.Theme.Accent, 2, 0)
        IolOololoIOoOOlI(_oIlIIIIOI_l_OolO, 10, 0.6)
        _Ilo_oOlIooOOo(_oIlIIIIOI_l_OolO, _oIlIIIIOI_l_OolO)
        
        -- Animasi Bubble Muncul
        lOoolOoIoOOOl(_oIlIIIIOI_l_OolO, {IIlolo_Ilo__ = UDim2.fromOffset(50, 50)}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        
        -- Logic Saat Bubble Ditekan (Buka Menu)
        _oIlIIIIOI_l_OolO.MouseButton1Click:Connect(function()
            -- PlaySound("6895079853", 0.1)
            
            -- 1. Nyalakan Blur
            _lIOlIOlI__l(true, 8)
            
            -- 2. Hilangkan Bubble
            if _oIlIIIIOI_l_OolO then
                lOoolOoIoOOOl(_oIlIIIIOI_l_OolO, {IIlolo_Ilo__ = UDim2.fromOffset(0, 0)}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
                task.wait(0.25)
                ToggleButton:Destroy()
                _oIlIIIIOI_l_OolO = nil
            end
            
            _OOllOIlIO_ = false
            Il_lOllOlIO.Text = "─"
            
            -- 3. Munculkan Menu Utama
            OlOloollIIoloIolO_l.Visible = true
            
            -- [PERBAIKAN] Pastikan ClipsDescendants SELALU False agar shadow tidak putus
            OlOloollIIoloIolO_l.ClipsDescendants = false 
            
            -- 4. Animasi Membesar menggunakan UIScale (Lebih mulus & aman)
            -- Kita set Scale ke 0 dulu biar start dari kecil
            IOlOoIOlI_OOI_o.Scale = 0
            lOoolOoIoOOOl(IOlOoIOlI_OOI_o, {Scale = 1}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            
            -- 5. Restore Shadow (Animasi transparansi)
            local loOllllOOOo = MainWindow:FindFirstChild("DropShadow")
            if loOllllOOOo then 
                lOoolOoIoOOOl(loOllllOOOo, {ImageTransparency = 0.6}, 0.4) 
            end
        end)
    end
    
    local _IOoIoIIOolIIIIO = OlOloollIIoloIolO_l.Size
    
    -- Minimize functionality (Floating Bubble Mode)
    Il_lOllOlIO.MouseButton1Click:Connect(function()
        _OOllOIlIO_ = true
        -- PlaySound("6895079853", 0.1)
        
        -- 1. Matikan Blur
        _lIOlIOlI__l(false)
        
        -- 2. Sembunyikan Shadow
        local loOllllOOOo = MainWindow:FindFirstChild("DropShadow")
        if loOllllOOOo then lOoolOoIoOOOl(loOllllOOOo, {ImageTransparency = 1}, 0.2) end

        -- 3. Animasi Mengecil menggunakan UIScale
        -- Kita TIDAK resize frame, tapi mengubah skala-nya. Konten tidak akan bocor.
        lOoolOoIoOOOl(IOlOoIOlI_OOI_o, {Scale = 0}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        
        -- 4. Tunggu animasi selesai
        task.delay(0.35, function()
            if _OOllOIlIO_ then
                OlOloollIIoloIolO_l.Visible = false
                _llIoIoIO_ooIoII()
            end
        end)
    end)
    
    -- Close functionality with confirmation (FIXED)
    oIOoOlOOOOIloOI.MouseButton1Click:Connect(function()
        -- [FIX] Nyalakan Clipping SEBELUM animasi tutup dimulai
        -- Ini memotong semua tombol/teks agar tidak tertinggal saat window mengecil
        OlOloollIIoloIolO_l.ClipsDescendants = true 
        
        -- Sembunyikan shadow instan agar tidak aneh
        local loOllllOOOo = MainWindow:FindFirstChild("DropShadow")
        if loOllllOOOo then loOllllOOOo.ImageTransparency = 1 end
        
        -- Smooth close animation
        lOoolOoIoOOOl(OlOloollIIoloIolO_l, {
            IIlolo_Ilo__ = UDim2.fromOffset(0, 0), -- Mengecil sampai habis
            oIo_o_IIll = 1
        }, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        
        task.wait(0.4)
        
        -- Cleanup connections
        for ooIlololllolIOlo, IolIIOOoll in ipairs(IoOlIOIOl_oIOIIooII.Connections) do
            if IolIIOOoll then
                connection:Disconnect()
            end
        end
        
        -- Cleanup blur
        _lIOlIOlI__l(false)
        
        -- Destroy GUI
        if _oIIIIlIoool_I and _oIIIIlIoool_I.Parent then
            ScreenGui:Destroy()
        end
        
        IoOlIOIOl_oIOIIooII.IsDestroyed = true
    end)
    
    
    -- Content Container
    local _lloOolOOl_IlolOO = _OI_olOOlOI("Frame", {
        oIo_o_IIll = 1,
        IIlolo_Ilo__ = UDim2.new(1, 0, 1, -48),
        lOoOolOOolool = UDim2.fromOffset(0, 48),
        O_OoOO_I_oI = OlOloollIIoloIolO_l
    })
    
    -- Tab Container
    local _oOlIIoloOIII_ = _OI_olOOlOI("Frame", {
        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
        IIlolo_Ilo__ = UDim2.fromOffset(200, 0),
        lOoOolOOolool = UDim2.fromOffset(0, 0),
        O_OoOO_I_oI = _lloOolOOl_IlolOO
    })
    
    -- Fix for tab container height
    local oo_olol_lII = ContentContainer:GetPropertyChangedSignal(IO_oOOllOOoooIo_[87]):Connect(function()
        if _oOlIIoloOIII_ and _oOlIIoloOIII_.Parent then
            _oOlIIoloOIII_.Size = UDim2.fromOffset(200, _lloOolOOl_IlolOO.AbsoluteSize.Y)
        end
    end)
    
    table.insert(IoOlIOIOl_oIOIIooII.Connections, oo_olol_lII)
    
    lIO__OIIOllOlOOl(_oOlIIoloOIII_, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.6)
    
    -- Tab Container Gradient
    local OolloOIllIOIoI_ = _OI_olOOlOI("UIGradient", {
        lOO_lIoI_O_o = ColorSequence.new{
            ColorSequenceKeypoint.new(0, IoOlIOIOl_oIOIIooII.Theme.Surface),
            ColorSequenceKeypoint.new(0.5, IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh),
            ColorSequenceKeypoint.new(1, IoOlIOIOl_oIOIIooII.Theme.Surface)
        },
        Rotation = 90,
        Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 0.1),
            NumberSequenceKeypoint.new(0.5, 0.05),
            NumberSequenceKeypoint.new(1, 0.15)
        },
        O_OoOO_I_oI = _oOlIIoloOIII_
    })

    -- Tab List
    local O_lOlo_lIOOlIo = _OI_olOOlOI("ScrollingFrame", {
        oIo_o_IIll = 1,
        IIlolo_Ilo__ = UDim2.new(1, 0, 1, -16),
        lOoOolOOolool = UDim2.fromOffset(0, 8),
        CanvasSize = UDim2.fromOffset(0, 0),
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent,
        ScrollBarImageTransparency = 0.7,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        O_OoOO_I_oI = _oOlIIoloOIII_
    })
    
    local _oIIllOOolllo_l = _OI_olOOlOI("UIListLayout", {
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
        O_OoOO_I_oI = O_lOlo_lIOOlIo
    })
    
    -- Update tab canvas size
    TabLayout:GetPropertyChangedSignal(IO_oOOllOOoooIo_[88]):Connect(function()
        if O_lOlo_lIOOlIo and O_lOlo_lIOOlIo.Parent then
            O_lOlo_lIOOlIo.CanvasSize = UDim2.fromOffset(0, _oIIllOOolllo_l.AbsoluteContentSize.Y + 16)
        end
    end)
    
    -- Page Container
    local lOIOIllooOl_ooOII = _OI_olOOlOI("Frame", {
        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Background,
        IIlolo_Ilo__ = UDim2.new(1, -200, 1, 0),
        lOoOolOOolool = UDim2.fromOffset(200, 0),
        O_OoOO_I_oI = _lloOolOOl_IlolOO
    })
    
    -- Page Container Gradient
    local OoI_OoIlOI = _OI_olOOlOI("UIGradient", {
        lOO_lIoI_O_o = ColorSequence.new{
            ColorSequenceKeypoint.new(0, IoOlIOIOl_oIOIIooII.Theme.Background),
            ColorSequenceKeypoint.new(0.5, IoOlIOIOl_oIOIIooII.Theme.Surface),
            ColorSequenceKeypoint.new(1, IoOlIOIOl_oIOIIooII.Theme.Background)
        },
        Rotation = 180,
        Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 0.05),
            NumberSequenceKeypoint.new(0.5, 0.02),
            NumberSequenceKeypoint.new(1, 0.08)
        },
        O_OoOO_I_oI = lOIOIllooOl_ooOII
    })
    
    -- Auto-update dengan theme changes
    local oOooOloo_l = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
        if OoI_OoIlOI and OoI_OoIlOI.Parent then
            OoI_OoIlOI.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, IoOlIOIOl_oIOIIooII.Theme.Background),
                ColorSequenceKeypoint.new(0.5, IoOlIOIOl_oIOIIooII.Theme.Surface),
                ColorSequenceKeypoint.new(1, IoOlIOIOl_oIOIIooII.Theme.Background)
            }
        end
    end)
    
    table.insert(IoOlIOIOl_oIOIIooII.Connections, oOooOloo_l)

    
    -- Page Padding
    local oIOlooOlOooI_lIOl = _OI_olOOlOI(IO_oOOllOOoooIo_[89], {
        PaddingTop = UDim.new(0, 16),
        PaddingBottom = UDim.new(0, 16),
        PaddingLeft = UDim.new(0, 16),
        PaddingRight = UDim.new(0, 16),
        O_OoOO_I_oI = lOIOIllooOl_ooOII
    })
    
    -- Tab management
    local IIOIIIl_OoOoO_IOlOo = {}
    local lool_OlI_ol_Ol__ = nil
    
    -- Make window draggable
    _Ilo_oOlIooOOo(OlOloollIIoloIolO_l, ___IIIIoloIIl_oIolo)
    
    -- Blur effect
    _lIOlIOlI__l(true, 8)
    
    -- Enhanced notification system
    local _Oloo_loOOOI = _OI_olOOlOI("Frame", {
        oIo_o_IIll = 1,
        IIlolo_Ilo__ = UDim2.new(0, 320, 1, 0),
        lOoOolOOolool = UDim2.new(1, -336, 0, 16),
        O_OoOO_I_oI = _oIIIIlIoool_I
    })
    
    local IlIoIlOIl_ = _OI_olOOlOI("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        O_OoOO_I_oI = _Oloo_loOOOI
    })
    
    -- Enhanced Notification Function
    function Nexus:Notify(_oOoOoOlOlIlIllooO)
        if not _oOoOoOlOlIlIllooO then _oOoOoOlOlIlIllooO = {} end
        
        local oOIlo_olIl_IIlO = _oOoOoOlOlIlIllooO.Title or IO_oOOllOOoooIo_[90]
        local olOoOOIIIllloI = _oOoOoOlOlIlIllooO.Content or ""
        local OIIlolloll_ = _oOoOoOlOlIlIllooO.Duration or 3
        local __lIoIIlO_OOI = _oOoOoOlOlIlIllooO.Type or IO_oOOllOOoooIo_[91] -- Info, Success, Warning, Error
        local _OlllIIO_looolo_ = _oOoOoOlOlIlIllooO.Callback
        
        -- Color scheme based on type
        local _OlIIIOloIoOO = {
            Info = {
                bg = IoOlIOIOl_oIOIIooII.Theme.Surface,
                accent = IoOlIOIOl_oIOIIooII.Theme.Accent,
                icon = IO_oOOllOOoooIo_[92]
            },
            Success = {
                bg = IoOlIOIOl_oIOIIooII.Theme.Surface,
                accent = IoOlIOIOl_oIOIIooII.Theme.Success,
                icon = IO_oOOllOOoooIo_[93]
            },
            Warning = {
                bg = IoOlIOIOl_oIOIIooII.Theme.Surface,
                accent = IoOlIOIOl_oIOIIooII.Theme.Warning,
                icon = IO_oOOllOOoooIo_[94]
            },
            Error = {
                bg = IoOlIOIOl_oIOIIooII.Theme.Surface,
                accent = IoOlIOIOl_oIOIIooII.Theme.Error,
                icon = IO_oOOllOOoooIo_[95]
            }
        }
        
        local OoOII_oIloOI = _OlIIIOloIoOO[__lIoIIlO_OOI] or _OlIIIOloIoOO.Info
        
        -- State management - FIX: Proper thread handling
        local OoOIllolOolIOloI = {
            isDismissed = false,
            progressTween = nil,
            dismissThread = nil, -- Store thread reference
            _o_lolOllll = {}
        }
        
        -- Create notification dengan responsive positioning
        local lIIOIolllIoIoooIOo = _Oloo_loOOOI.AbsoluteSize.X
        local o__OoOoOOoIO = UDim2.fromOffset(lIIOIolllIoIoooIOo + 20, 0)
        
        local oIloIOolOOO_ = _OI_olOOlOI("Frame", {
            IoIOIo_I_IOllllOI = OoOII_oIloOI.bg,
            IIlolo_Ilo__ = UDim2.new(1, 0, 0, 0),
            lOoOolOOolool = o__OoOoOOoIO,
            oIo_o_IIll = 0.1,
            LayoutOrder = 1,
            O_OoOO_I_oI = _Oloo_loOOOI
        })
        
        llOl_IoIII_oIOIIo(oIloIOolOOO_, 10)
        lIO__OIIOllOlOOl(oIloIOolOOO_, OoOII_oIloOI.accent, 1, 0.3)
        IolOololoIOoOOlI(oIloIOolOOO_, 8, 0.8)
        
        -- Gradient overlay
        local _loOlO_lOO = _OI_olOOlOI("UIGradient", {
            lOO_lIoI_O_o = ColorSequence.new{
                ColorSequenceKeypoint.new(0, IoOlIOIOl_oIOIIooII.Theme.Surface),
                ColorSequenceKeypoint.new(0.5, IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh),
                ColorSequenceKeypoint.new(1, IoOlIOIOl_oIOIIooII.Theme.Surface)
            },
            Rotation = 45,
            Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0, 0.05),
                NumberSequenceKeypoint.new(0.5, 0.02),
                NumberSequenceKeypoint.new(1, 0.08)
            },
            O_OoOO_I_oI = oIloIOolOOO_
        })
        
        -- Progress bar
        local IloIOOOll_l = _OI_olOOlOI("Frame", {
            IoIOIo_I_IOllllOI = OoOII_oIloOI.accent,
            IIlolo_Ilo__ = UDim2.new(1, 0, 0, 3),
            lOoOolOOolool = UDim2.new(0, 0, 1, -3),
            O_OoOO_I_oI = oIloIOolOOO_
        })
        
        llOl_IoIII_oIOIIo(IloIOOOll_l, 2)
        
        -- Icon
        local _llIoIlOOlllO = _OI_olOOlOI("TextLabel", {
            Ioolo_OoIoIIoOIl = OoOII_oIloOI.icon,
            IlIoOollo_lIllII = Enum.Font.GothamBold,
            TextSize = 16,
            TextColor3 = OoOII_oIloOI.accent,
            oIo_o_IIll = 1,
            lOoOolOOolool = UDim2.fromOffset(12, 12),
            IIlolo_Ilo__ = UDim2.fromOffset(20, 20),
            O_OoOO_I_oI = oIloIOolOOO_
        })
        
        -- Title
        local OOIlOolIOIOloOIOI = _OI_olOOlOI("TextLabel", {
            Ioolo_OoIoIIoOIl = oOIlo_olIl_IIlO,
            IlIoOollo_lIllII = Enum.Font.GothamBold,
            TextSize = 14,
            TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
            oIo_o_IIll = 1,
            lOoOolOOolool = UDim2.fromOffset(40, 12),
            IIlolo_Ilo__ = UDim2.new(1, -80, 0, 20),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            O_OoOO_I_oI = oIloIOolOOO_
        })
        
        -- Content
        local IoIoI_ooOolollII = _OI_olOOlOI("TextLabel", {
            Ioolo_OoIoIIoOIl = olOoOOIIIllloI,
            IlIoOollo_lIllII = Enum.Font.Gotham,
            TextSize = 12,
            TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub,
            oIo_o_IIll = 1,
            lOoOolOOolool = UDim2.fromOffset(40, 32),
            IIlolo_Ilo__ = UDim2.new(1, -80, 0, 16),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextWrapped = true,
            O_OoOO_I_oI = oIloIOolOOO_
        })
        
        -- Close button
        local _lIOIOOOl_IlOO_II = _OI_olOOlOI("TextButton", {
            Ioolo_OoIoIIoOIl = IO_oOOllOOoooIo_[96],
            IlIoOollo_lIllII = Enum.Font.GothamBold,
            TextSize = 12,
            TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextMuted,
            oIo_o_IIll = 1,
            lOoOolOOolool = UDim2.new(1, -32, 0, 8),
            IIlolo_Ilo__ = UDim2.fromOffset(24, 24),
            O_OoOO_I_oI = oIloIOolOOO_
        })
        
        -- Calculate content height
        local IIllOIl_IIIoOIll = 56
        if olOoOOIIIllloI and Content:len() > 40 then
            IIllOIl_IIIoOIll = 72
        end
        
        -- Theme change handler - FIX: Proper cleanup check
        local llOOOOOOIoIIOloOOl = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
            if OoOIllolOolIOloI.isDismissed then return end
            if _loOlO_lOO and _loOlO_lOO.Parent then
                _loOlO_lOO.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, IoOlIOIOl_oIOIIooII.Theme.Surface),
                    ColorSequenceKeypoint.new(0.5, IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh),
                    ColorSequenceKeypoint.new(1, IoOlIOIOl_oIOIIooII.Theme.Surface)
                }
            end
        end)
        OoOIllolOolIOloI.connections[#OoOIllolOolIOloI.connections + 1] = llOOOOOOIoIIOloOOl
        
        -- FIX: Proper cleanup function
        local function OIlIIlOIIloOlolllO()
            if OoOIllolOolIOloI.isDismissed then return end
            OoOIllolOolIOloI.isDismissed = true
            
            -- Cancel tweens
            if OoOIllolOolIOloI.progressTween then
                OoOIllolOolIOloI.progressTween:Cancel()
                OoOIllolOolIOloI.progressTween = nil
            end
            
            -- Cancel dismiss thread - FIX: Only cancel if it exists and is a thread
            if OoOIllolOolIOloI.dismissThread then
                pcall(function()
                    task.cancel(OoOIllolOolIOloI.dismissThread)
                end)
                OoOIllolOolIOloI.dismissThread = nil
            end
            
            -- Disconnect all connections
            for oOIOOOIIOollolOO, IolIIOOoll in ipairs(OoOIllolOolIOloI.connections) do
                if IolIIOOoll and IolIIOOoll.Connected then
                    pcall(function()
                        connection:Disconnect()
                    end)
                end
            end
            OoOIllolOolIOloI.connections = {}
        end
        
        -- FIX: Enhanced dismiss function with proper error handling
        local function lIoOlOoIOl_O()
            if OoOIllolOolIOloI.isDismissed then return end
            
            OIlIIlOIIloOlolllO()
            
            -- Animate out with error handling
            pcall(function()
                lOoolOoIoOOOl(oIloIOolOOO_, {
                    lOoOolOOolool = o__OoOoOOoIO,
                    oIo_o_IIll = 1
                }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
                
                lOoolOoIoOOOl(IloIOOOll_l, {oIo_o_IIll = 1}, 0.3)
            end)
            
            -- Destroy after animation with error handling
            task.spawn(function()
                task.wait(0.35)
                pcall(function()
                    if oIloIOolOOO_ and oIloIOolOOO_.Parent then
                        Notification:Destroy()
                    end
                end)
            end)
        end
        
        -- Animate notification appearance
        lOoolOoIoOOOl(oIloIOolOOO_, {
            IIlolo_Ilo__ = UDim2.new(1, 0, 0, IIllOIl_IIIoOIll),
            lOoOolOOolool = UDim2.fromOffset(0, 0)
        }, 0.4, Enum.EasingStyle.Back)
        
        -- Progress bar & auto dismiss - FIX: Store thread properly
        if OIIlolloll_ > 0 then
            OoOIllolOolIOloI.progressTween = lOoolOoIoOOOl(IloIOOOll_l, {
                IIlolo_Ilo__ = UDim2.new(0, 0, 0, 3)
            }, OIIlolloll_)
            
            -- FIX: Properly store dismiss thread
            OoOIllolOolIOloI.dismissThread = task.spawn(function()
                task.wait(OIIlolloll_)
                if not OoOIllolOolIOloI.isDismissed then
                    lIoOlOoIOl_O()
                end
            end)
        end
        
        -- Manual close - FIX: Add to connections array for proper cleanup
        local _IoooO_OlllO = _lIOIOOOl_IlOO_II.MouseButton1Click:Connect(function()
            if _OlllIIO_looolo_ then
                pcall(_OlllIIO_looolo_)
            end
            lIoOlOoIOl_O()
        end)
        OoOIllolOolIOloI.connections[#OoOIllolOolIOloI.connections + 1] = _IoooO_OlllO
        
        -- Click notification - FIX: Add to connections array
        local lloOOIIlOOIlIoooll = _OI_olOOlOI("TextButton", {
            Ioolo_OoIoIIoOIl = "",
            oIo_o_IIll = 1,
            IIlolo_Ilo__ = UDim2.new(1, -32, 1, 0),
            O_OoOO_I_oI = oIloIOolOOO_
        })
        
        local lI_IoIOlllO = lloOOIIlOOIlIoooll.MouseButton1Click:Connect(function()
            if _OlllIIO_looolo_ then
                pcall(_OlllIIO_looolo_)
            end
            lIoOlOoIOl_O()
        end)
        OoOIllolOolIOloI.connections[#OoOIllolOolIOloI.connections + 1] = lI_IoIOlllO
        
        -- Return API with error handling
        return {
            Dismiss = function()
                pcall(lIoOlOoIOl_O)
            end,
            SetProgress = function(I_IOOIl_IlIOIooO)
                if OoOIllolOolIOloI.isDismissed then return end
                pcall(function()
                    if IloIOOOll_l and IloIOOOll_l.Parent then
                        if OoOIllolOolIOloI.progressTween then
                            OoOIllolOolIOloI.progressTween:Cancel()
                        end
                        OoOIllolOolIOloI.progressTween = lOoolOoIoOOOl(IloIOOOll_l, {
                            IIlolo_Ilo__ = UDim2.new(math.clamp(I_IOOIl_IlIOIooO, 0, 1), 0, 0, 3)
                        }, 0.2)
                    end
                end)
            end,
            IIOoOlo_IoOIllloooo = function()
                return not OoOIllolOolIOloI.isDismissed
            end
        }
    end
    
    local function __I_IloOolOIIIloIO(_oOoOoOlOlIlIllooO)
        if type(_oOoOoOlOlIlIllooO) == IO_oOOllOOoooIo_[97] then
            _oOoOoOlOlIlIllooO = {Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO}
        end
        
        if not _oOoOoOlOlIlIllooO then _oOoOoOlOlIlIllooO = {} end
        
        local oI_oOOll_oOoOOl = _oOoOoOlOlIlIllooO.Name or _oOoOoOlOlIlIllooO.Text or IO_oOOllOOoooIo_[98]
        local _llIoIlOOlllO = _oOoOoOlOlIlIllooO.Icon or IO_oOOllOOoooIo_[99]
        local IOlooolIlIO_OlOIO_I = _oOoOoOlOlIlIllooO.Visible ~= false
        
        -- [PERBAIKAN 1] Mengganti .Button menjadi .TabBtn
        local oooolIOoOo = {
            oI_oOOll_oOoOOl = oI_oOOll_oOoOOl,
            _llIoIlOOlllO = _llIoIlOOlllO,
            IOlooolIlIO_OlOIO_I = IOlooolIlIO_OlOIO_I,
            Elements = {},
            Page = nil,
            TabBtn = nil 
        }
        
        -- Membuat Tombol Tab (Tab Button)
        local OoIlOOoIlloooIo = _OI_olOOlOI("TextButton", {
            Ioolo_OoIoIIoOIl = "",
            IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
            oIo_o_IIll = lool_OlI_ol_Ol__ and 0.8 or 0.3,
            IIlolo_Ilo__ = UDim2.new(1, -16, 0, 44),
            lOoOolOOolool = UDim2.fromOffset(8, 0),
            lOoIOlOOloIl_O = false,
            IOlooolIlIO_OlOIO_I = IOlooolIlIO_OlOIO_I,
            O_OoOO_I_oI = O_lOlo_lIOOlIo
        })
        
        llOl_IoIII_oIOIIo(OoIlOOoIlloooIo, 8)
        if not lool_OlI_ol_Ol__ then
            lIO__OIIOllOlOOl(OoIlOOoIlloooIo, IoOlIOIOl_oIOIIooII.Theme.Accent, 1, 0.4)
        end
        
        local oIOIIIIOllOOollIl = _OI_olOOlOI("Frame", {
            oIo_o_IIll = 1,
            IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
            O_OoOO_I_oI = OoIlOOoIlloooIo
        })
        
        -- [PERBAIKAN 2] Rename variabel lokal agar jelas ini adalah Objek GUI
        local lll__IIlOlOoOII_o = _OI_olOOlOI("TextLabel", {
            Ioolo_OoIoIIoOIl = _llIoIlOOlllO,
            IlIoOollo_lIllII = Enum.Font.GothamBold,
            TextSize = 16,
            TextColor3 = lool_OlI_ol_Ol__ and IoOlIOIOl_oIOIIooII.Theme.TextSub or IoOlIOIOl_oIOIIooII.Theme.Accent,
            oIo_o_IIll = 1,
            lOoOolOOolool = UDim2.fromOffset(12, 0),
            IIlolo_Ilo__ = UDim2.fromOffset(24, 44),
            O_OoOO_I_oI = oIOIIIIOllOOollIl
        })
        
        local OolloIO_ollO = _OI_olOOlOI("TextLabel", {
            Ioolo_OoIoIIoOIl = oI_oOOll_oOoOOl,
            IlIoOollo_lIllII = Enum.Font.GothamMedium,
            TextSize = 14,
            TextColor3 = lool_OlI_ol_Ol__ and IoOlIOIOl_oIOIIooII.Theme.TextSub or IoOlIOIOl_oIOIIooII.Theme.Text,
            oIo_o_IIll = 1,
            lOoOolOOolool = UDim2.fromOffset(44, 0),
            IIlolo_Ilo__ = UDim2.new(1, -56, 1, 0),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate = Enum.TextTruncate.AtEnd,
            O_OoOO_I_oI = oIOIIIIOllOOollIl
        })
        
        -- Membuat Halaman (Page) untuk Tab ini
        local _OoOoI_loloOO = _OI_olOOlOI("ScrollingFrame", {
            oIo_o_IIll = 1,
            IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
            CanvasSize = UDim2.fromOffset(0, 0),
            ScrollBarThickness = 4,
            ScrollBarImageColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent,
            ScrollBarImageTransparency = 0.6,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            IOlooolIlIO_OlOIO_I = not lool_OlI_ol_Ol__,
            O_OoOO_I_oI = lOIOIllooOl_ooOII
        })
        
        local Iollo_lIOI = _OI_olOOlOI("UIListLayout", {
            Padding = UDim.new(0, 12),
            SortOrder = Enum.SortOrder.LayoutOrder,
            O_OoOO_I_oI = _OoOoI_loloOO
        })
        
        -- Auto-resize canvas saat konten bertambah
        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            if _OoOoI_loloOO and _OoOoI_loloOO.Parent then
                _OoOoI_loloOO.CanvasSize = UDim2.fromOffset(0, Iollo_lIOI.AbsoluteContentSize.Y + 32)
            end
        end)
        
        -- Simpan referensi ke objek Tab (Gunakan .TabBtn)
        oooolIOoOo.TabBtn = OoIlOOoIlloooIo
        oooolIOoOo.Page = _OoOoI_loloOO
        
        -- Set Tab Pertama sebagai Aktif Otomatis
        if not lool_OlI_ol_Ol__ then
            lool_OlI_ol_Ol__ = oooolIOoOo
            OoIlOOoIlloooIo.BackgroundTransparency = 0.3
            lll__IIlOlOoOII_o.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent
            OolloIO_ollO.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
            _OoOoI_loloOO.Visible = true
        end
        
        -- [PERBAIKAN 3] Logika Klik Tab (Menggunakan .TabBtn yang baru)
        OoIlOOoIlloooIo.MouseButton1Click:Connect(function()
            -- Play Sound (Optional)
            -- PlaySound("6895079853", 0.05, 1.1)

            -- Nonaktifkan Tab Lama
            if lool_OlI_ol_Ol__ then
                -- Gunakan ActiveTab.TabBtn (bukan .Button)
                lOoolOoIoOOOl(lool_OlI_ol_Ol__.TabBtn, {oIo_o_IIll = 0.8}, 0.2)
                
                local IOIIOlIlI_ol = lool_OlI_ol_Ol__.TabBtn:FindFirstChild("UIStroke")
                if IOIIOlIlI_ol then oldStroke:Destroy() end
                
                -- Reset warna text & icon tab lama
                local O__OIloIoOIO = lool_OlI_ol_Ol__.TabBtn:FindFirstChild("Frame")
                if O__OIloIoOIO then
                    for ooIlololllolIOlo, __IlO_o_oIIOI__loo in ipairs(content:GetChildren()) do
                        if child:IsA("TextLabel") then
                            lOoolOoIoOOOl(__IlO_o_oIIOI__loo, {TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub}, 0.2)
                        end
                    end
                end
                
                if lool_OlI_ol_Ol__.Page then lool_OlI_ol_Ol__.Page.Visible = false end
            end
            
            -- Aktifkan Tab Baru (Tab yang diklik)
            lool_OlI_ol_Ol__ = oooolIOoOo
            
            lOoolOoIoOOOl(OoIlOOoIlloooIo, {oIo_o_IIll = 0.3}, 0.2)
            lIO__OIIOllOlOOl(OoIlOOoIlloooIo, IoOlIOIOl_oIOIIooII.Theme.Accent, 1, 0.4)
            
            lOoolOoIoOOOl(lll__IIlOlOoOII_o, {TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent}, 0.2)
            lOoolOoIoOOOl(OolloIO_ollO, {TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text}, 0.2)
            
            _OoOoI_loloOO.Visible = true
        end)
        
        -- Hover Effects
        OoIlOOoIlloooIo.MouseEnter:Connect(function()
            if lool_OlI_ol_Ol__ ~= oooolIOoOo then
                lOoolOoIoOOOl(OoIlOOoIlloooIo, {oIo_o_IIll = 0.6}, 0.15)
                lOoolOoIoOOOl(lll__IIlOlOoOII_o, {TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent}, 0.15)
                lOoolOoIoOOOl(OolloIO_ollO, {TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text}, 0.15)
            end
        end)
        
        OoIlOOoIlloooIo.MouseLeave:Connect(function()
            if lool_OlI_ol_Ol__ ~= oooolIOoOo then
                lOoolOoIoOOOl(OoIlOOoIlloooIo, {oIo_o_IIll = 0.8}, 0.15)
                lOoolOoIoOOOl(lll__IIlOlOoOII_o, {TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub}, 0.15)
                lOoolOoIoOOOl(OolloIO_ollO, {TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub}, 0.15)
            end
        end)
        
        table.insert(IIOIIIl_OoOoO_IOlOo, oooolIOoOo)
        
        -- Tab API methods
        function Tab:Section(IIIoIIoIIIoOO)
            if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
            
            local O_IOlOIolooOI = _OI_olOOlOI("Frame", {
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 0, 32),
                O_OoOO_I_oI = _OoOoI_loloOO
            })
            
            local o_l_IooIOOOoO = _OI_olOOlOI("TextLabel", {
                Ioolo_OoIoIIoOIl = IIIoIIoIIIoOO or IO_oOOllOOoooIo_[100],
                IlIoOollo_lIllII = Enum.Font.GothamBold,
                TextSize = 16,
                TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                O_OoOO_I_oI = O_IOlOIolooOI
            })
            
            local _lllOl_looIl_II = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Accent,
                IIlolo_Ilo__ = UDim2.new(0, 40, 0, 2),
                lOoOolOOolool = UDim2.new(0, 0, 1, -4),
                O_OoOO_I_oI = O_IOlOIolooOI
            })
            
            llOl_IoIII_oIOIIo(_lllOl_looIl_II, 1)
            
            return O_IOlOIolooOI
        end
        
        function Tab:Divider()
            if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
            
            local OIOooOOoIoOo = _OI_olOOlOI("Frame", {
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 0, 16),
                O_OoOO_I_oI = _OoOoI_loloOO
            })
            
            local loOoIoIoIo_IIOoOoII = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Outline,
                oIo_o_IIll = 0.6,
                IIlolo_Ilo__ = UDim2.new(1, 0, 0, 1),
                lOoOolOOolool = UDim2.new(0, 0, 0.5, 0),
                O_OoOO_I_oI = OIOooOOoIoOo
            })
            
            return OIOooOOoIoOo
        end
        
        function Tab:Label(_oOoOoOlOlIlIllooO)
            if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
            
            if type(_oOoOoOlOlIlIllooO) == "string" then
                _oOoOoOlOlIlIllooO = {Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO}
            end
            if not _oOoOoOlOlIlIllooO then _oOoOoOlOlIlIllooO = {} end
            
            local Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO.Text or IO_oOOllOOoooIo_[101]
            local lOO_lIoI_O_o = _oOoOoOlOlIlIllooO.Color or IoOlIOIOl_oIOIIooII.Theme.TextSub
            local IIlolo_Ilo__ = _oOoOoOlOlIlIllooO.Size or 14
            local IlIoOollo_lIllII = _oOoOoOlOlIlIllooO.Font or Enum.Font.Gotham
            
            local lI_loIIoolI = _OI_olOOlOI("Frame", {
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 0, 24),
                O_OoOO_I_oI = _OoOoI_loloOO
            })
            
            local loIOoIoolO__oooI = _OI_olOOlOI("TextLabel", {
                Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl,
                IlIoOollo_lIllII = IlIoOollo_lIllII,
                TextSize = IIlolo_Ilo__,
                TextColor3 = lOO_lIoI_O_o,
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                O_OoOO_I_oI = lI_loIIoolI
            })
            
            local function _O_IlIloOlIOIlOlOo()
                if IoOlIOIOl_oIOIIooII.IsDestroyed or not loIOoIoolO__oooI or not loIOoIoolO__oooI.Parent then return end
                
                pcall(function()
                    local lOloOo_IoIIIl = game:GetService(IO_oOOllOOoooIo_[102]):GetTextSize(
                        loIOoIoolO__oooI.Text, loIOoIoolO__oooI.TextSize, loIOoIoolO__oooI.Font, 
                        Vector2.new(loIOoIoolO__oooI.AbsoluteSize.X, math.huge)
                    )
                    lI_loIIoolI.Size = UDim2.new(1, 0, 0, math.max(24, lOloOo_IoIIIl.Y + 4))
                end)
            end
            
            _O_IlIloOlIOIlOlOo()
            
            -- Theme update
            local OOIOol_IllO = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
                if IoOlIOIOl_oIOIIooII.IsDestroyed or not loIOoIoolO__oooI or not loIOoIoolO__oooI.Parent then return end
                pcall(function()
                    if lOO_lIoI_O_o == IoOlIOIOl_oIOIIooII.Theme.TextSub then
                        loIOoIoolO__oooI.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub
                    end
                end)
            end)
            
            table.insert(IoOlIOIOl_oIOIIooII.Connections, OOIOol_IllO)
            
            return {
                SetText = function(IoIlIOIlOo)
                    if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
                    pcall(function()
                        if loIOoIoolO__oooI and loIOoIoolO__oooI.Parent then
                            loIOoIoolO__oooI.Text = tostring(IoIlIOIlOo or "")
                            _O_IlIloOlIOIlOlOo()
                        end
                    end)
                end,
                SetColor = function(I_Ilollo_o)
                    if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
                    pcall(function()
                        if loIOoIoolO__oooI and loIOoIoolO__oooI.Parent then
                            lOO_lIoI_O_o = I_Ilollo_o
                            loIOoIoolO__oooI.TextColor3 = I_Ilollo_o
                        end
                    end)
                end,
                GetText = function()
                    return (loIOoIoolO__oooI and loIOoIoolO__oooI.Text) or ""
                end
            }
        end
        
        function Tab:Button(_oOoOoOlOlIlIllooO)
    if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
    
    if type(_oOoOoOlOlIlIllooO) == "string" then
        _oOoOoOlOlIlIllooO = {Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO}
    end
    if not _oOoOoOlOlIlIllooO then _oOoOoOlOlIlIllooO = {} end
    
    local Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO.Text or "Button"
    local _OlllIIO_looolo_ = _oOoOoOlOlIlIllooO.Callback or function() end
    local _llIoIlOOlllO = _oOoOoOlOlIlIllooO.Icon
    
    local oloolIOlIlIOOIllll = _OI_olOOlOI("Frame", {
        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
        IIlolo_Ilo__ = UDim2.new(1, 0, 0, 44),
        O_OoOO_I_oI = _OoOoI_loloOO
    })
    
    llOl_IoIII_oIOIIo(oloolIOlIlIOOIllll, 8)
    lIO__OIIOllOlOOl(oloolIOlIlIOOIllll, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.4)
    
    -- Base gradient
    local _oloOOo_OIo = _OI_olOOlOI("UIGradient", {
        lOO_lIoI_O_o = ColorSequence.new{
            ColorSequenceKeypoint.new(0, IoOlIOIOl_oIOIIooII.Theme.Surface),
            ColorSequenceKeypoint.new(0.5, IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh),
            ColorSequenceKeypoint.new(1, IoOlIOIOl_oIOIIooII.Theme.Surface)
        },
        Rotation = 90,
        Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0, 0.05),
            NumberSequenceKeypoint.new(0.5, 0.02),
            NumberSequenceKeypoint.new(1, 0.08)
        },
        O_OoOO_I_oI = oloolIOlIlIOOIllll
    })
    
    local lIIllIIIlllolOl = _OI_olOOlOI("TextButton", {
        Ioolo_OoIoIIoOIl = "",
        oIo_o_IIll = 1,
        IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
        lOoIOlOOloIl_O = false,
        O_OoOO_I_oI = oloolIOlIlIOOIllll
    })
    
    local lloIOoOOIlooIoIO = _OI_olOOlOI("Frame", {
        oIo_o_IIll = 1,
        IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
        O_OoOO_I_oI = lIIllIIIlllolOl
    })
    
    -- Icon (if provided)
    local OlIOIlO_oIlO = 0
    local OllOOlO_IoIo = nil
    if _llIoIlOOlllO then
        OllOOlO_IoIo = _OI_olOOlOI("TextLabel", {
            Ioolo_OoIoIIoOIl = _llIoIlOOlllO,
            IlIoOollo_lIllII = Enum.Font.GothamBold,
            TextSize = 16,
            TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent,
            oIo_o_IIll = 1,
            lOoOolOOolool = UDim2.fromOffset(16, 0),
            IIlolo_Ilo__ = UDim2.fromOffset(24, 44),
            O_OoOO_I_oI = lloIOoOOIlooIoIO
        })
        OlIOIlO_oIlO = 32
    end
    
    -- Button text
    local _IIlOOloOll_II = _OI_olOOlOI("TextLabel", {
        Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl,
        IlIoOollo_lIllII = Enum.Font.GothamMedium,
        TextSize = 14,
        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
        oIo_o_IIll = 1,
        lOoOolOOolool = UDim2.fromOffset(16 + OlIOIlO_oIlO, 0),
        IIlolo_Ilo__ = UDim2.new(1, -(32 + OlIOIlO_oIlO), 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        O_OoOO_I_oI = lloIOoOOIlooIoIO
    })
    
    -- FIX: Enhanced hover effects dengan destroy checking
    local _oolOolIlIIOOIOOI = lIIllIIIlllolOl.MouseEnter:Connect(function()
        if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
        
        pcall(function()
            if oloolIOlIlIOOIllll and oloolIOlIlIOOIllll.Parent then
                lOoolOoIoOOOl(oloolIOlIlIOOIllll, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh}, 0.15)
            end
            
            local olOI_ll_oOooOIOoIlO = ButtonFrame:FindFirstChild("UIStroke")
            if olOI_ll_oOooOIOoIlO then
                lOoolOoIoOOOl(olOI_ll_oOooOIOoIlO, {
                    lOO_lIoI_O_o = IoOlIOIOl_oIOIIooII.Theme.Accent,
                    Transparency = 0.2
                }, 0.15)
            end
            
            -- Enhanced gradient hover
            if _oloOOo_OIo and _oloOOo_OIo.Parent then
                _oloOOo_OIo.Transparency = NumberSequence.new{
                    NumberSequenceKeypoint.new(0, 0.02),
                    NumberSequenceKeypoint.new(0.5, 0),
                    NumberSequenceKeypoint.new(1, 0.05)
                }
            end
        end)
    end)
    
    local _loO_IlI_lolOOolI = lIIllIIIlllolOl.MouseLeave:Connect(function()
        if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
        
        pcall(function()
            if oloolIOlIlIOOIllll and oloolIOlIlIOOIllll.Parent then
                lOoolOoIoOOOl(oloolIOlIlIOOIllll, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface}, 0.15)
            end
            
            local olOI_ll_oOooOIOoIlO = ButtonFrame:FindFirstChild("UIStroke")
            if olOI_ll_oOooOIOoIlO then
                lOoolOoIoOOOl(olOI_ll_oOooOIOoIlO, {
                    lOO_lIoI_O_o = IoOlIOIOl_oIOIIooII.Theme.Outline,
                    Transparency = 0.4
                }, 0.15)
            end
            
            -- Reset gradient
            if _oloOOo_OIo and _oloOOo_OIo.Parent then
                _oloOOo_OIo.Transparency = NumberSequence.new{
                    NumberSequenceKeypoint.new(0, 0.05),
                    NumberSequenceKeypoint.new(0.5, 0.02),
                    NumberSequenceKeypoint.new(1, 0.08)
                }
            end
        end)
    end)
    
    -- FIX: Enhanced click animation
    local _oolIoIoOlIOIO = lIIllIIIlllolOl.MouseButton1Down:Connect(function()
        if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
        pcall(function()
            if oloolIOlIlIOOIllll and oloolIOlIlIOOIllll.Parent then
                lOoolOoIoOOOl(oloolIOlIlIOOIllll, {
                    IIlolo_Ilo__ = UDim2.new(1, -4, 0, 42),
                    IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Accent
                }, 0.1)
            end
        end)
    end)
    
    local oo_IoIOIOoI = lIIllIIIlllolOl.MouseButton1Up:Connect(function()
        if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
        pcall(function()
            if oloolIOlIlIOOIllll and oloolIOlIlIOOIllll.Parent then
                lOoolOoIoOOOl(oloolIOlIlIOOIllll, {
                    IIlolo_Ilo__ = UDim2.new(1, 0, 0, 44),
                    IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface
                }, 0.1)
            end
        end)
    end)
    
    -- FIX: Enhanced callback execution
    local IIooIolOoooIlIOoO = lIIllIIIlllolOl.MouseButton1Click:Connect(function()
        if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
        
        -- Visual feedback
        pcall(function()
            if oloolIOlIlIOOIllll and oloolIOlIlIOOIllll.Parent then
                -- Quick flash effect
                lOoolOoIoOOOl(oloolIOlIlIOOIllll, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Accent}, 0.05)
                task.spawn(function()
                    task.wait(0.05)
                    if not IoOlIOIOl_oIOIIooII.IsDestroyed and oloolIOlIlIOOIllll and oloolIOlIlIOOIllll.Parent then
                        lOoolOoIoOOOl(oloolIOlIlIOOIllll, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface}, 0.1)
                    end
                end)
            end
        end)
        
        -- Execute callback safely
        task.spawn(function()
            pcall(function()
                if _OlllIIO_looolo_ then
                    _OlllIIO_looolo_()
                end
            end)
        end)
    end)
    
    -- FIX: Enhanced theme updates dengan proper error handling
    local OlOlloOOOlooo = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
        if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
        
        pcall(function()
            if oloolIOlIlIOOIllll and oloolIOlIlIOOIllll.Parent then
                oloolIOlIlIOOIllll.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Surface
            end
            
            if _IIlOOloOll_II and _IIlOOloOll_II.Parent then
                _IIlOOloOll_II.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
            end
            
            if OllOOlO_IoIo and OllOOlO_IoIo.Parent then
                OllOOlO_IoIo.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent
            end
            
            if _oloOOo_OIo and _oloOOo_OIo.Parent then
                _oloOOo_OIo.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, IoOlIOIOl_oIOIIooII.Theme.Surface),
                    ColorSequenceKeypoint.new(0.5, IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh),
                    ColorSequenceKeypoint.new(1, IoOlIOIOl_oIOIIooII.Theme.Surface)
                }
            end
            
            local olOI_ll_oOooOIOoIlO = ButtonFrame:FindFirstChild("UIStroke")
            if olOI_ll_oOooOIOoIlO then
                olOI_ll_oOooOIOoIlO.Color = IoOlIOIOl_oIOIIooII.Theme.Outline
            end
        end)
    end)
    
    table.insert(IoOlIOIOl_oIOIIooII.Connections, _oolOolIlIIOOIOOI)
    table.insert(IoOlIOIOl_oIOIIooII.Connections, _loO_IlI_lolOOolI)
    table.insert(IoOlIOIOl_oIOIIooII.Connections, _oolIoIoOlIOIO)
    table.insert(IoOlIOIOl_oIOIIooII.Connections, oo_IoIOIOoI)
    table.insert(IoOlIOIOl_oIOIIooII.Connections, IIooIolOoooIlIOoO)
    table.insert(IoOlIOIOl_oIOIIooII.Connections, OlOlloOOOlooo)
    
    -- FIX: Enhanced return API methods
    return {
        SetText = function(IoIlIOIlOo)
            if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
            pcall(function()
                if _IIlOOloOll_II and _IIlOOloOll_II.Parent then
                    _IIlOOloOll_II.Text = tostring(IoIlIOIlOo or "")
                end
            end)
        end,
        
        GetText = function()
            return (_IIlOOloOll_II and _IIlOOloOll_II.Text) or ""
        end,
        
        SetEnabled = function(OlllOIOlOOOlII)
            if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
            pcall(function()
                if lIIllIIIlllolOl and lIIllIIIlllolOl.Parent then
                    lIIllIIIlllolOl.Visible = OlllOIOlOOOlII
                    oloolIOlIlIOOIllll.BackgroundTransparency = OlllOIOlOOOlII and 0 or 0.7
                end
            end)
        end,
        
        _IIIl__OO_oO = function(olOOoIIollOOIolIol)
            if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
            _OlllIIO_looolo_ = olOOoIIollOOIolIol or function() end
        end,
        
        SetIcon = function(IIIOoooOIIIlOO)
            if IoOlIOIOl_oIOIIooII.IsDestroyed then return end
            pcall(function()
                if IIIOoooOIIIlOO and not OllOOlO_IoIo then
                    -- Create icon if it doesn't exist
                    OllOOlO_IoIo = _OI_olOOlOI("TextLabel", {
                        Ioolo_OoIoIIoOIl = IIIOoooOIIIlOO,
                        IlIoOollo_lIllII = Enum.Font.GothamBold,
                        TextSize = 16,
                        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent,
                        oIo_o_IIll = 1,
                        lOoOolOOolool = UDim2.fromOffset(16, 0),
                        IIlolo_Ilo__ = UDim2.fromOffset(24, 44),
                        O_OoOO_I_oI = lloIOoOOIlooIoIO
                    })
                    
                    -- Adjust text position
                    if _IIlOOloOll_II and _IIlOOloOll_II.Parent then
                        _IIlOOloOll_II.Position = UDim2.fromOffset(48, 0)
                        _IIlOOloOll_II.Size = UDim2.new(1, -64, 1, 0)
                    end
                elseif IIIOoooOIIIlOO and OllOOlO_IoIo then
                    -- Update existing icon
                    OllOOlO_IoIo.Text = IIIOoooOIIIlOO
                elseif not IIIOoooOIIIlOO and OllOOlO_IoIo then
                    -- Remove icon
                    ButtonIcon:Destroy()
                    OllOOlO_IoIo = nil
                    
                    -- Reset text position
                    if _IIlOOloOll_II and _IIlOOloOll_II.Parent then
                        _IIlOOloOll_II.Position = UDim2.fromOffset(16, 0)
                        _IIlOOloOll_II.Size = UDim2.new(1, -32, 1, 0)
                    end
                end
            end)
        end,
        
        Frame = oloolIOlIlIOOIllll
    }
end

        
        -- Enhanced Dropdown with the new system
        function Tab:Dropdown(lOO_OlOolIO_loo_)
            if not _OoOoI_loloOO or not _OoOoI_loloOO.Parent then 
                warn(IO_oOOllOOoooIo_[103])
                return nil 
            end
            
            -- Create new config table to avoid modifying original
            local _IooOOo_oI = {}
            for _I_IOoIIlOl, loolOoIIlIoloIIo_ll in pairs(lOO_OlOolIO_loo_) do
                _IooOOo_oI[_I_IOoIIlOl] = loolOoIIlIoloIIo_ll
            end
            
            -- Set parent if not specified
            _IooOOo_oI.Parent = _IooOOo_oI.Parent or _OoOoI_loloOO
            
            return Nexus:CreateModernDropdown(_IooOOo_oI)
        end

        
        -- Continue with other components in the next part...
        function Tab:Toggle(_oOoOoOlOlIlIllooO)
            if type(_oOoOoOlOlIlIllooO) == "string" then
                _oOoOoOlOlIlIllooO = {Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO}
            end
            if not _oOoOoOlOlIlIllooO then _oOoOoOlOlIlIllooO = {} end
            
            local Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO.Text or IO_oOOllOOoooIo_[104]
            local IOIOI_OIIOlolooOolo = _oOoOoOlOlIlIllooO.Default or false
            local _OlllIIO_looolo_ = _oOoOoOlOlIlIllooO.Callback or function() end
            local _l__lI_Oll_l = _oOoOoOlOlIlIllooO.Flag
            
            local lIOoollOool = IOIOI_OIIOlolooOolo
            
            local I__llolIoOl = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
                IIlolo_Ilo__ = UDim2.new(1, 0, 0, 44),
                O_OoOO_I_oI = _OoOoI_loloOO
            })
            
            llOl_IoIII_oIOIIo(I__llolIoOl, 8)
            lIO__OIIOllOlOOl(I__llolIoOl, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.4)
            
            local _OloIIIoIIoOooI = _OI_olOOlOI("TextLabel", {
                Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl,
                IlIoOollo_lIllII = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
                oIo_o_IIll = 1,
                lOoOolOOolool = UDim2.fromOffset(16, 0),
                IIlolo_Ilo__ = UDim2.new(1, -80, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                O_OoOO_I_oI = I__llolIoOl
            })
            
            -- Toggle switch container
            local lIolIllIOI = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHighest, -- Warna Track Mati
                IIlolo_Ilo__ = UDim2.fromOffset(44, 6), -- Lebih tipis (Garis)
                lOoOolOOolool = UDim2.new(1, -60, 0.5, -3),
                O_OoOO_I_oI = I__llolIoOl
            })
            llOl_IoIII_oIOIIo(lIolIllIOI, 3)
            
            local lOIoOIoIolo = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Accent,
                IIlolo_Ilo__ = UDim2.new(0, 0, 1, 0), -- Mulai dari 0
                O_OoOO_I_oI = lIolIllIOI
            })
            llOl_IoIII_oIOIIo(lOIoOIoIolo, 3)
            
            -- Handle (Kepala Toggle)
            local _IOIIIOlOoOo = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.TextSub, -- Warna mati
                IIlolo_Ilo__ = UDim2.fromOffset(18, 18),
                lOoOolOOolool = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0, 0.5), -- Center Y
                O_OoOO_I_oI = lIolIllIOI
            })
            llOl_IoIII_oIOIIo(_IOIIIOlOoOo, 100) -- Bulat sempurna
            
            llOl_IoIII_oIOIIo(_IOIIIOlOoOo, 10)
            IolOololoIOoOOlI(_IOIIIOlOoOo, 2, 0.8)
            
            local _oIlIIIIOI_l_OolO = _OI_olOOlOI("TextButton", {
                Ioolo_OoIoIIoOIl = "",
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
                O_OoOO_I_oI = I__llolIoOl
            })
            
            local function loIOIlooIoo(_IloOOlOOIoIOII)
                lIOoollOool = _IloOOlOOIoIOII
                
                lOoolOoIoOOOl(lIolIllIOI, {
                    IoIOIo_I_IOllllOI = lIOoollOool and IoOlIOIOl_oIOIIooII.Theme.Accent or IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh
                }, 0.2)
                
                lOoolOoIoOOOl(_IOIIIOlOoOo, {
                    lOoOolOOolool = UDim2.fromOffset(lIOoollOool and 26 or 2, 2)
                }, 0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                
                pcall(function()
                    _OlllIIO_looolo_(lIOoollOool)
                end)
                
                if _l__lI_Oll_l then
                    IoOlIOIOl_oIOIIooII.Flags[_l__lI_Oll_l] = lIOoollOool
                end
            end
            
            _oIlIIIIOI_l_OolO.MouseButton1Click:Connect(function()
                --PlaySound("6895079853", 0.08, CurrentValue and 0.9 or 1.1)
                loIOIlooIoo(not lIOoollOool)
            end)
            
            -- Hover effect
            _oIlIIIIOI_l_OolO.MouseEnter:Connect(function()
                lOoolOoIoOOOl(I__llolIoOl, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh}, 0.15)
            end)
            
            _oIlIIIIOI_l_OolO.MouseLeave:Connect(function()
                lOoolOoIoOOOl(I__llolIoOl, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface}, 0.15)
            end)
            
            -- Initialize value
            loIOIlooIoo(lIOoollOool)
            
            -- Register with flag system
            if _l__lI_Oll_l then
                IoOlIOIOl_oIOIIooII.Registry[_l__lI_Oll_l] = {
                    Set = loIOIlooIoo,
                    Get = function() return lIOoollOool end
                }
            end
            
            -- Theme update
            local IloollOOIIOlIolI = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
                if I__llolIoOl and I__llolIoOl.Parent then
                    I__llolIoOl.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Surface
                    _OloIIIoIIoOooI.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
                    lIolIllIOI.BackgroundColor3 = lIOoollOool and IoOlIOIOl_oIOIIooII.Theme.Accent or IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh
                    _IOIIIOlOoOo.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
                end
            end)
            
            table.insert(IoOlIOIOl_oIOIIooII.Connections, IloollOOIIOlIolI)
            
            return {
                Set = loIOIlooIoo,
                Get = function() return lIOoollOool end,
                SetText = function(IoIlIOIlOo)
                    _OloIIIoIIoOooI.Text = tostring(IoIlIOIlOo or "")
                end
            }
        end
        
        function Tab:Slider(_oOoOoOlOlIlIllooO)
            if not _oOoOoOlOlIlIllooO then _oOoOoOlOlIlIllooO = {} end
            
            local Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO.Text or IO_oOOllOOoooIo_[105]
            local OlOOooIoOIO_OlO_oo = _oOoOoOlOlIlIllooO.Min or 0
            local I_I_IoooOOOlo_o = _oOoOoOlOlIlIllooO.Max or 100
            local IOIOI_OIIOlolooOolo = _oOoOoOlOlIlIllooO.Default or OlOOooIoOIO_OlO_oo
            local IOIolllOOOlI = _oOoOoOlOlIlIllooO.Increment or 1
            local loOIOOOllIloOoIooo = _oOoOoOlOlIlIllooO.Suffix or ""
            local _lolOoOlIooOIIlIo = _oOoOoOlOlIlIllooO.Prefix or ""
            local _OlllIIO_looolo_ = _oOoOoOlOlIlIllooO.Callback or function() end
            local _l__lI_Oll_l = _oOoOoOlOlIlIllooO.Flag
            
            -- Validate values
            OlOOooIoOIO_OlO_oo = tonumber(OlOOooIoOIO_OlO_oo) or 0
            I_I_IoooOOOlo_o = tonumber(I_I_IoooOOOlo_o) or 100
            IOIOI_OIIOlolooOolo = math.clamp(tonumber(IOIOI_OIIOlolooOolo) or OlOOooIoOIO_OlO_oo, OlOOooIoOIO_OlO_oo, I_I_IoooOOOlo_o)
            IOIolllOOOlI = math.max(tonumber(IOIolllOOOlI) or 1, 0.01)
            
            if OlOOooIoOIO_OlO_oo >= I_I_IoooOOOlo_o then
                I_I_IoooOOOlo_o = OlOOooIoOIO_OlO_oo + 100
            end
            
            local lIOoollOool = IOIOI_OIIOlolooOolo
            
            local Io_oloooII = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
                IIlolo_Ilo__ = UDim2.new(1, 0, 0, 56),
                O_OoOO_I_oI = _OoOoI_loloOO
            })
            
            llOl_IoIII_oIOIIo(Io_oloooII, 8)
            lIO__OIIOllOlOOl(Io_oloooII, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.4)
            
            -- Header section
            local l_II_IloloOII = _OI_olOOlOI("Frame", {
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 0, 28),
                lOoOolOOolool = UDim2.fromOffset(0, 8),
                O_OoOO_I_oI = Io_oloooII
            })
            
            local OOoooIOIlo_loooI = _OI_olOOlOI("TextLabel", {
                Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl,
                IlIoOollo_lIllII = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
                oIo_o_IIll = 1,
                lOoOolOOolool = UDim2.fromOffset(16, 0),
                IIlolo_Ilo__ = UDim2.new(1, -120, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                O_OoOO_I_oI = l_II_IloloOII
            })
            
            -- Value display
            local OIOIO_Iol_o_olIOl_I = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHighest,
                IIlolo_Ilo__ = UDim2.fromOffset(80, 20),
                lOoOolOOolool = UDim2.new(1, -96, 0, 4),
                O_OoOO_I_oI = l_II_IloloOII
            })
            
            llOl_IoIII_oIOIIo(OIOIO_Iol_o_olIOl_I, 4)
            lIO__OIIOllOlOOl(OIOIO_Iol_o_olIOl_I, IoOlIOIOl_oIOIIooII.Theme.Accent, 1, 0.6)
            
            local I_OolOIlIIolO_ = _OI_olOOlOI("TextLabel", {
                Ioolo_OoIoIIoOIl = _lolOoOlIooOIIlIo .. tostring(lIOoollOool) .. loOIOOOllIloOoIooo,
                IlIoOollo_lIllII = Enum.Font.GothamMedium,
                TextSize = 12,
                TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent,
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
                O_OoOO_I_oI = OIOIO_Iol_o_olIOl_I
            })
            
            -- Slider track
            local IOOoOIoIOOIIOlOO = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
                IIlolo_Ilo__ = UDim2.new(1, -32, 0, 6),
                lOoOolOOolool = UDim2.fromOffset(16, 40),
                O_OoOO_I_oI = Io_oloooII
            })
            
            llOl_IoIII_oIOIIo(IOOoOIoIOOIIOlOO, 3)
            
            -- Slider fill
            local o_OOIooOIOoO = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Accent,
                IIlolo_Ilo__ = UDim2.new((lIOoollOool - OlOOooIoOIO_OlO_oo) / (I_I_IoooOOOlo_o - OlOOooIoOIO_OlO_oo), 0, 1, 0),
                lOoOolOOolool = UDim2.fromOffset(0, 0),
                O_OoOO_I_oI = IOOoOIoIOOIIOlOO
            })
            
            llOl_IoIII_oIOIIo(o_OOIooOIOoO, 3)
            
            -- Slider handle
            local IIloooo_l_o = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Text,
                IIlolo_Ilo__ = UDim2.fromOffset(16, 16),
                lOoOolOOolool = UDim2.new((lIOoollOool - OlOOooIoOIO_OlO_oo) / (I_I_IoooOOOlo_o - OlOOooIoOIO_OlO_oo), -8, 0.5, -8),
                O_OoOO_I_oI = IOOoOIoIOOIIOlOO
            })
            
            llOl_IoIII_oIOIIo(IIloooo_l_o, 8)
            lIO__OIIOllOlOOl(IIloooo_l_o, IoOlIOIOl_oIOIIooII.Theme.Accent, 2, 0.3)
            IolOololoIOoOOlI(IIloooo_l_o, 4, 0.7)
            
            -- Handle glow effect
            local loOOoO_oIOIooI_ = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Accent,
                oIo_o_IIll = 0.8,
                IIlolo_Ilo__ = UDim2.fromOffset(24, 24),
                lOoOolOOolool = UDim2.fromOffset(-4, -4),
                O_OoOO_I_oI = IIloooo_l_o
            })
            
            llOl_IoIII_oIOIIo(loOOoO_oIOIooI_, 12)
            
            -- Slider interaction
            local OIOOIllOoIOI = false
            
            local function oIlOllooIOO(loolOoIIlIoloIIo_ll, _OIlIIlolOII_IIoOIo)
                loolOoIIlIoloIIo_ll = math.clamp(loolOoIIlIoloIIo_ll, OlOOooIoOIO_OlO_oo, I_I_IoooOOOlo_o)
                
                -- Round to increment
                if IOIolllOOOlI > 0 then
                    loolOoIIlIoloIIo_ll = math.round(loolOoIIlIoloIIo_ll / IOIolllOOOlI) * IOIolllOOOlI
                end
                
                lIOoollOool = loolOoIIlIoloIIo_ll
                local _OIolo_oIOoo = (loolOoIIlIoloIIo_ll - OlOOooIoOIO_OlO_oo) / (I_I_IoooOOOlo_o - OlOOooIoOIO_OlO_oo)
                
                -- Update visuals
                if _OIlIIlolOII_IIoOIo ~= false then
                    lOoolOoIoOOOl(o_OOIooOIOoO, {IIlolo_Ilo__ = UDim2.new(_OIolo_oIOoo, 0, 1, 0)}, 0.15)
                    lOoolOoIoOOOl(IIloooo_l_o, {lOoOolOOolool = UDim2.new(_OIolo_oIOoo, -8, 0.5, -8)}, 0.15)
                else
                    o_OOIooOIOoO.Size = UDim2.new(_OIolo_oIOoo, 0, 1, 0)
                    IIloooo_l_o.Position = UDim2.new(_OIolo_oIOoo, -8, 0.5, -8)
                end
                
                I_OolOIlIIolO_.Text = _lolOoOlIooOIIlIo .. tostring(loolOoIIlIoloIIo_ll) .. loOIOOOllIloOoIooo
                
                pcall(function()
                    _OlllIIO_looolo_(loolOoIIlIoloIIo_ll)
                end)
                
                if _l__lI_Oll_l then
                    IoOlIOIOl_oIOIIooII.Flags[_l__lI_Oll_l] = loolOoIIlIoloIIo_ll
                end
            end
            
            local lIIO_olIOOlIoloIo = _OI_olOOlOI("TextButton", {
                Ioolo_OoIoIIoOIl = "",
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
                O_OoOO_I_oI = Io_oloooII
            })
            
            local function IOOloloOoo(olIlO_OlIlIO)
                if olIlO_OlIlIO.UserInputType == Enum.UserInputType.MouseButton1 or
                   olIlO_OlIlIO.UserInputType == Enum.UserInputType.Touch then
                    
                    -- [SAFETY CHECK 1] Pastikan elemen slider masih ada
                    if not IOOoOIoIOOIIOlOO or not IOOoOIoIOOIIOlOO.Parent then return end

                    OIOOIllOoIOI = true
                    -- PlaySound("6895079853", 0.05)
                    
                    -- Handle glow animation (Cek dulu apakah HandleGlow ada)
                    if loOOoO_oIOIooI_ then
                        lOoolOoIoOOOl(loOOoO_oIOIooI_, {
                            IIlolo_Ilo__ = UDim2.fromOffset(32, 32),
                            lOoOolOOolool = UDim2.fromOffset(-8, -8),
                            oIo_o_IIll = 0.6
                        }, 0.15)
                    end
                    
                    -- Calculate initial value
                    local IOoIOIOlloOOlIlI = olIlO_OlIlIO.Position.X
                    local OIOo_OOIl_lI = IOOoOIoIOOIIOlOO.AbsolutePosition.X
                    local oOoIoOO_IIlIlolo = IOOoOIoIOOIIOlOO.AbsoluteSize.X
                    
                    -- [SAFETY CHECK 2] Mencegah pembagian dengan nol (jarang terjadi, tapi aman)
                    if oOoIoOO_IIlIlolo == 0 then return end

                    local _OIolo_oIOoo = math.clamp((IOoIOIOlloOOlIlI - OIOo_OOIl_lI) / oOoIoOO_IIlIlolo, 0, 1)
                    local _IloOOlOOIoIOII = OlOOooIoOIO_OlO_oo + (_OIolo_oIOoo * (I_I_IoooOOOlo_o - OlOOooIoOIO_OlO_oo))
                    
                    oIlOllooIOO(_IloOOlOOIoIOII)
                end
            end
            
            local function O_IooOIllllOlI(olIlO_OlIlIO)
                if OIOOIllOoIOI and (olIlO_OlIlIO.UserInputType == Enum.UserInputType.MouseMovement or
                                olIlO_OlIlIO.UserInputType == Enum.UserInputType.Touch) then
                    
                    -- [SAFETY CHECK 3] PENTING: Cek lagi saat dragging
                    -- Jika UI ditutup saat drag, hentikan drag dan return
                    if not IOOoOIoIOOIIOlOO or not IOOoOIoIOOIIOlOO.Parent then 
                        OIOOIllOoIOI = false
                        return 
                    end

                    local IOoIOIOlloOOlIlI = olIlO_OlIlIO.Position.X
                    local OIOo_OOIl_lI = IOOoOIoIOOIIOlOO.AbsolutePosition.X
                    local oOoIoOO_IIlIlolo = IOOoOIoIOOIIOlOO.AbsoluteSize.X
                    
                    if oOoIoOO_IIlIlolo == 0 then return end

                    local _OIolo_oIOoo = math.clamp((IOoIOIOlloOOlIlI - OIOo_OOIl_lI) / oOoIoOO_IIlIlolo, 0, 1)
                    local _IloOOlOOIoIOII = OlOOooIoOIO_OlO_oo + (_OIolo_oIOoo * (I_I_IoooOOOlo_o - OlOOooIoOIO_OlO_oo))
                    
                    oIlOllooIOO(_IloOOlOOIoIOII, false)
                end
            end
            
            local function O_oIlIoooOolo(olIlO_OlIlIO)
                if olIlO_OlIlIO.UserInputType == Enum.UserInputType.MouseButton1 or
                   olIlO_OlIlIO.UserInputType == Enum.UserInputType.Touch then
                    
                    OIOOIllOoIOI = false
                    --PlaySound("6895079725", 0.03)
                    
                    -- Reset handle glow
                    lOoolOoIoOOOl(loOOoO_oIOIooI_, {
                        IIlolo_Ilo__ = UDim2.fromOffset(24, 24),
                        lOoOolOOolool = UDim2.fromOffset(-4, -4),
                        oIo_o_IIll = 0.8
                    }, 0.15)
                end
            end
            
            -- Connect events
            table.insert(IoOlIOIOl_oIOIIooII.Connections, lIIO_olIOOlIoloIo.InputBegan:Connect(IOOloloOoo))
            table.insert(IoOlIOIOl_oIOIIooII.Connections, OOOllOIOllO_OoI.InputChanged:Connect(O_IooOIllllOlI))
            table.insert(IoOlIOIOl_oIOIIooII.Connections, OOOllOIOllO_OoI.InputEnded:Connect(O_oIlIoooOolo))
            
            -- Hover effects
            lIIO_olIOOlIoloIo.MouseEnter:Connect(function()
                lOoolOoIoOOOl(Io_oloooII, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh}, 0.15)
                lOoolOoIoOOOl(IIloooo_l_o, {IIlolo_Ilo__ = UDim2.fromOffset(18, 18)}, 0.15)
            end)
            
            lIIO_olIOOlIoloIo.MouseLeave:Connect(function()
                if not OIOOIllOoIOI then
                    lOoolOoIoOOOl(Io_oloooII, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface}, 0.15)
                    lOoolOoIoOOOl(IIloooo_l_o, {IIlolo_Ilo__ = UDim2.fromOffset(16, 16)}, 0.15)
                end
            end)
            
            -- Initialize
            oIlOllooIOO(lIOoollOool, false)
            
            -- Register
            if _l__lI_Oll_l then
                IoOlIOIOl_oIOIIooII.Registry[_l__lI_Oll_l] = {
                    Set = function(loolOoIIlIoloIIo_ll) oIlOllooIOO(tonumber(loolOoIIlIoloIIo_ll) or OlOOooIoOIO_OlO_oo) end,
                    Get = function() return lIOoollOool end
                }
            end
            
            -- Theme updates
            local olIlool__lIo = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
                if Io_oloooII and Io_oloooII.Parent then
                    Io_oloooII.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Surface
                    OOoooIOIlo_loooI.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
                    IOOoOIoIOOIIOlOO.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh
                    o_OOIooOIOoO.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent
                    IIloooo_l_o.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
                    OIOIO_Iol_o_olIOl_I.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.SurfaceHighest
                    I_OolOIlIIolO_.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent
                    loOOoO_oIOIooI_.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent
                end
            end)
            
            table.insert(IoOlIOIOl_oIOIIooII.Connections, olIlool__lIo)
            
            return {
                Set = function(loolOoIIlIoloIIo_ll) oIlOllooIOO(tonumber(loolOoIIlIoloIIo_ll) or OlOOooIoOIO_OlO_oo) end,
                Get = function() return lIOoollOool end,
                SetText = function(IoIlIOIlOo) OOoooIOIlo_loooI.Text = tostring(IoIlIOIlOo or "") end,
                SetMin = function(_lOoolOlIoIO) 
                    OlOOooIoOIO_OlO_oo = tonumber(_lOoolOlIoIO) or OlOOooIoOIO_OlO_oo
                    oIlOllooIOO(lIOoollOool)
                end,
                SetMax = function(IoOOoo_ooIllOI_)
                    I_I_IoooOOOlo_o = tonumber(IoOOoo_ooIllOI_) or I_I_IoooOOOlo_o
                    oIlOllooIOO(lIOoollOool)
                end
            }
        end
        
        function Tab:TextBox(_oOoOoOlOlIlIllooO)
            if not _oOoOoOlOlIlIllooO then _oOoOoOlOlIlIllooO = {} end
            
            local Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO.Text or "TextBox"
            local OloIoIlIlOIolOIlOII = _oOoOoOlOlIlIllooO.Placeholder or IO_oOOllOOoooIo_[106]
            local IOIOI_OIIOlolooOolo = _oOoOoOlOlIlIllooO.Default or ""
            local oOoO_OoOOool = _oOoOoOlOlIlIllooO.Multiline or false
            local OOlooooolO = _oOoOoOlOlIlIllooO.Numeric or false
            local _OlllIIO_looolo_ = _oOoOoOlOlIlIllooO.Callback or function() end
            local _l__lI_Oll_l = _oOoOoOlOlIlIllooO.Flag
            
            local lIOoollOool = tostring(IOIOI_OIIOlolooOolo)
            
            local IolIlOlOoIoO_lIII = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
                IIlolo_Ilo__ = UDim2.new(1, 0, 0, oOoO_OoOOool and 80 or 44),
                O_OoOO_I_oI = _OoOoI_loloOO
            })
            
            llOl_IoIII_oIOIIo(IolIlOlOoIoO_lIII, 8)
            lIO__OIIOllOlOOl(IolIlOlOoIoO_lIII, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.4)
            
            -- Label
            if Ioolo_OoIoIIoOIl and Ioolo_OoIoIIoOIl ~= "" then
                local OlO___oOOoOoI_lIlOl = _OI_olOOlOI("TextLabel", {
                    Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl,
                    IlIoOollo_lIllII = Enum.Font.GothamMedium,
                    TextSize = 12,
                    TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub,
                    oIo_o_IIll = 1,
                    lOoOolOOolool = UDim2.fromOffset(16, 4),
                    IIlolo_Ilo__ = UDim2.new(1, -32, 0, 16),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    O_OoOO_I_oI = IolIlOlOoIoO_lIII
                })
            end
            
            -- Input container
            local lOoolIOloIoooIOlIOo = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHighest,
                IIlolo_Ilo__ = UDim2.new(1, -16, 0, oOoO_OoOOool and 52 or 24),
                lOoOolOOolool = UDim2.fromOffset(8, Ioolo_OoIoIIoOIl and Ioolo_OoIoIIoOIl ~= "" and 22 or 10),
                O_OoOO_I_oI = IolIlOlOoIoO_lIII
            })
            
            llOl_IoIII_oIOIIo(lOoolIOloIoooIOlIOo, 6)
            lIO__OIIOllOlOOl(lOoolIOloIoooIOlIOo, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.8)
            
            -- TextBox
            local lIOl_lllOIoI_lIOIlO = _OI_olOOlOI("TextBox", {
                Ioolo_OoIoIIoOIl = lIOoollOool,
                PlaceholderText = OloIoIlIlOIolOIlOII,
                PlaceholderColor3 = IoOlIOIOl_oIOIIooII.Theme.TextMuted,
                IlIoOollo_lIllII = Enum.Font.Gotham,
                TextSize = 13,
                TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
                oIo_o_IIll = 1,
                lOoOolOOolool = UDim2.fromOffset(8, 0),
                IIlolo_Ilo__ = UDim2.new(1, -16, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = oOoO_OoOOool and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
                TextWrapped = oOoO_OoOOool,
                MultiLine = oOoO_OoOOool,
                ClearTextOnFocus = false,
                O_OoOO_I_oI = lOoolIOloIoooIOlIOo
            })
            
            -- Add padding for multiline
            if oOoO_OoOOool then
                local lOoOoO_OIII_o = _OI_olOOlOI("UIPadding", {
                    PaddingTop = UDim.new(0, 4),
                    PaddingBottom = UDim.new(0, 4),
                    O_OoOO_I_oI = lIOl_lllOIoI_lIOIlO
                })
            end
            
            -- Numeric input validation
            if OOlooooolO then
                TextBox:GetPropertyChangedSignal("Text"):Connect(function()
                    local IIIoIIoIIIoOO = lIOl_lllOIoI_lIOIlO.Text
                    local IoIlIOIlOo = text:gsub(IO_oOOllOOoooIo_[107], "") -- Allow digits, decimal point, minus
                    
                    -- Ensure only one decimal point and minus at start
                    local oololIoOOOIlol__Io = 0
                    local II_lOooIlOloI_OlIo = ""
                    local IIoOIlIlIlooO = false
                    
                    for oOIOOOIIOollolOO = 1, #IoIlIOIlOo do
                        local IllIOIooOIoo_I = newText:sub(oOIOOOIIOollolOO, oOIOOOIIOollolOO)
                        
                        if IllIOIooOIoo_I == IO_oOOllOOoooIo_[108] and oololIoOOOIlol__Io == 0 then
                            oololIoOOOIlol__Io = 1
                            II_lOooIlOloI_OlIo = II_lOooIlOloI_OlIo .. IllIOIooOIoo_I
                        elseif IllIOIooOIoo_I == IO_oOOllOOoooIo_[109] and oOIOOOIIOollolOO == 1 and not IIoOIlIlIlooO then
                            IIoOIlIlIlooO = true
                            II_lOooIlOloI_OlIo = II_lOooIlOloI_OlIo .. IllIOIooOIoo_I
                        elseif char:match(IO_oOOllOOoooIo_[110]) then
                            II_lOooIlOloI_OlIo = II_lOooIlOloI_OlIo .. IllIOIooOIoo_I
                        end
                    end
                    
                    if II_lOooIlOloI_OlIo ~= IIIoIIoIIIoOO then
                        lIOl_lllOIoI_lIOIlO.Text = II_lOooIlOloI_OlIo
                    end
                end)
            end
            
            -- Focus effects
            lIOl_lllOIoI_lIOIlO.Focused:Connect(function()
                --PlaySound("6895079853", 0.04)
                
                local olOI_ll_oOooOIOoIlO = InputContainer:FindFirstChild("UIStroke")
                if olOI_ll_oOooOIOoIlO then
                    lOoolOoIoOOOl(olOI_ll_oOooOIOoIlO, {
                        lOO_lIoI_O_o = IoOlIOIOl_oIOIIooII.Theme.Accent,
                        Transparency = 0.3,
                        Thickness = 1.5
                    }, 0.2)
                end
                
                lOoolOoIoOOOl(lOoolIOloIoooIOlIOo, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface}, 0.2)
            end)
            
            lIOl_lllOIoI_lIOIlO.FocusLost:Connect(function()
                local olOI_ll_oOooOIOoIlO = InputContainer:FindFirstChild("UIStroke")
                if olOI_ll_oOooOIOoIlO then
                    lOoolOoIoOOOl(olOI_ll_oOooOIOoIlO, {
                        lOO_lIoI_O_o = IoOlIOIOl_oIOIIooII.Theme.Outline,
                        Transparency = 0.8,
                        Thickness = 1
                    }, 0.2)
                end
                
                lOoolOoIoOOOl(lOoolIOloIoooIOlIOo, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHighest}, 0.2)
                
                -- Update value and trigger callback
                local _IloOOlOOIoIOII = lIOl_lllOIoI_lIOIlO.Text
                if OOlooooolO then
                    _IloOOlOOIoIOII = tonumber(_IloOOlOOIoIOII) or 0
                end
                
                lIOoollOool = _IloOOlOOIoIOII
                
                pcall(function()
                    _OlllIIO_looolo_(lIOoollOool)
                end)
                
                if _l__lI_Oll_l then
                    IoOlIOIOl_oIOIIooII.Flags[_l__lI_Oll_l] = lIOoollOool
                end
            end)
            
            -- Register
            if _l__lI_Oll_l then
                IoOlIOIOl_oIOIIooII.Registry[_l__lI_Oll_l] = {
                    Set = function(loolOoIIlIoloIIo_ll)
                        lIOoollOool = OOlooooolO and (tonumber(loolOoIIlIoloIIo_ll) or 0) or tostring(loolOoIIlIoloIIo_ll or "")
                        lIOl_lllOIoI_lIOIlO.Text = tostring(lIOoollOool)
                    end,
                    Get = function() return lIOoollOool end
                }
            end
            
            -- Theme updates
            local lOo_IolooO = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
                if IolIlOlOoIoO_lIII and IolIlOlOoIoO_lIII.Parent then
                    IolIlOlOoIoO_lIII.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Surface
                    lOoolIOloIoooIOlIOo.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.SurfaceHighest
                    lIOl_lllOIoI_lIOIlO.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
                    lIOl_lllOIoI_lIOIlO.PlaceholderColor3 = IoOlIOIOl_oIOIIooII.Theme.TextMuted
                    
                    if TextBoxFrame:FindFirstChild("TextLabel") then
                        TextBoxFrame:FindFirstChild("TextLabel").TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub
                    end
                end
            end)
            
            table.insert(IoOlIOIOl_oIOIIooII.Connections, lOo_IolooO)
            
            return {
                Set = function(loolOoIIlIoloIIo_ll)
                    lIOoollOool = OOlooooolO and (tonumber(loolOoIIlIoloIIo_ll) or 0) or tostring(loolOoIIlIoloIIo_ll or "")
                    lIOl_lllOIoI_lIOIlO.Text = tostring(lIOoollOool)
                end,
                Get = function() return lIOoollOool end,
                SetPlaceholder = function(_lIlOloOIoI)
                    lIOl_lllOIoI_lIOIlO.PlaceholderText = tostring(_lIlOloOIoI or "")
                end
            }
        end
        
        function Tab:Keybind(_oOoOoOlOlIlIllooO)
            if not _oOoOoOlOlIlIllooO then _oOoOoOlOlIlIllooO = {} end
            
            local Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO.Text or IO_oOOllOOoooIo_[111]
            local IOIOI_OIIOlolooOolo = _oOoOoOlOlIlIllooO.Default or Enum.KeyCode.F
            local _OlllIIO_looolo_ = _oOoOoOlOlIlIllooO.Callback or function() end
            local _l__lI_Oll_l = _oOoOoOlOlIlIllooO.Flag
            local _OOOOIooIoo_I = _oOoOoOlOlIlIllooO.Mode or "Toggle" -- Toggle, Hold, Always
            
            local IIOOOIIoIlooO = IOIOI_OIIOlolooOolo
            local Io_IllOIIIOll_ = false
            local IIOoOlo_IoOIllloooo = false
            
            local oIIoOlOIOOlllI = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
                IIlolo_Ilo__ = UDim2.new(1, 0, 0, 44),
                O_OoOO_I_oI = _OoOoI_loloOO
            })
            
            llOl_IoIII_oIOIIo(oIIoOlOIOOlllI, 8)
            lIO__OIIOllOlOOl(oIIoOlOIOOlllI, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.4)
            
            local oO_OIl_IlloIool = _OI_olOOlOI("TextLabel", {
                Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl,
                IlIoOollo_lIllII = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
                oIo_o_IIll = 1,
                lOoOolOOolool = UDim2.fromOffset(16, 0),
                IIlolo_Ilo__ = UDim2.new(1, -120, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                O_OoOO_I_oI = oIIoOlOIOOlllI
            })
            
            -- Mode indicator
            local OooIooIOoIOOIOIl_ = _OI_olOOlOI("TextLabel", {
                Ioolo_OoIoIIoOIl = _OOOOIooIoo_I,
                IlIoOollo_lIllII = Enum.Font.Gotham,
                TextSize = 10,
                TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextMuted,
                oIo_o_IIll = 1,
                lOoOolOOolool = UDim2.new(1, -100, 0, 2),
                IIlolo_Ilo__ = UDim2.new(0, 60, 0, 12),
                TextXAlignment = Enum.TextXAlignment.Center,
                O_OoOO_I_oI = oIIoOlOIOOlllI
            })
            
            -- Key display
            local lOO_OOlOlO = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHighest,
                IIlolo_Ilo__ = UDim2.fromOffset(80, 28),
                lOoOolOOolool = UDim2.new(1, -96, 0.5, -14),
                O_OoOO_I_oI = oIIoOlOIOOlllI
            })
            
            llOl_IoIII_oIOIIo(lOO_OOlOlO, 6)
            lIO__OIIOllOlOOl(lOO_OOlOlO, IIOoOlo_IoOIllloooo and IoOlIOIOl_oIOIIooII.Theme.Accent or IoOlIOIOl_oIOIIooII.Theme.Outline, 1, IIOoOlo_IoOIllloooo and 0.3 or 0.6)
            
            local oloI__OO_IllIIo = _OI_olOOlOI("TextLabel", {
                Ioolo_OoIoIIoOIl = Io_IllOIIIOll_ and IO_oOOllOOoooIo_[112] or (IIOOOIIoIlooO.Name or IO_oOOllOOoooIo_[113]),
                IlIoOollo_lIllII = Enum.Font.GothamBold,
                TextSize = 12,
                TextColor3 = Io_IllOIIIOll_ and IoOlIOIOl_oIOIIooII.Theme.Warning or (IIOoOlo_IoOIllloooo and IoOlIOIOl_oIOIIooII.Theme.Accent or IoOlIOIOl_oIOIIooII.Theme.Text),
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
                O_OoOO_I_oI = lOO_OOlOlO
            })
            
            local oOoIooIlOl_OooloIIO = _OI_olOOlOI("TextButton", {
                Ioolo_OoIoIIoOIl = "",
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
                O_OoOO_I_oI = oIIoOlOIOOlllI
            })
            
            -- Key names mapping
            local _l_oOlOloOOl = {
                [Enum.KeyCode.LeftShift] = IO_oOOllOOoooIo_[114],
                [Enum.KeyCode.RightShift] = IO_oOOllOOoooIo_[115],
                [Enum.KeyCode.LeftControl] = IO_oOOllOOoooIo_[116],
                [Enum.KeyCode.RightControl] = IO_oOOllOOoooIo_[117],
                [Enum.KeyCode.LeftAlt] = IO_oOOllOOoooIo_[118],
                [Enum.KeyCode.RightAlt] = IO_oOOllOOoooIo_[119],
                [Enum.KeyCode.CapsLock] = IO_oOOllOOoooIo_[120],
                [Enum.KeyCode.One] = IO_oOOllOOoooIo_[121],
                [Enum.KeyCode.Two] = IO_oOOllOOoooIo_[122],
                [Enum.KeyCode.Three] = IO_oOOllOOoooIo_[123],
                [Enum.KeyCode.Four] = IO_oOOllOOoooIo_[124],
                [Enum.KeyCode.Five] = IO_oOOllOOoooIo_[125],
                [Enum.KeyCode.Six] = IO_oOOllOOoooIo_[126],
                [Enum.KeyCode.Seven] = IO_oOOllOOoooIo_[127],
                [Enum.KeyCode.Eight] = IO_oOOllOOoooIo_[128],
                [Enum.KeyCode.Nine] = IO_oOOllOOoooIo_[129],
                [Enum.KeyCode.Zero] = IO_oOOllOOoooIo_[130],
                [Enum.KeyCode.KeypadOne] = IO_oOOllOOoooIo_[131],
                [Enum.KeyCode.KeypadTwo] = IO_oOOllOOoooIo_[132],
                [Enum.KeyCode.KeypadThree] = IO_oOOllOOoooIo_[133],
                [Enum.KeyCode.KeypadFour] = IO_oOOllOOoooIo_[134],
                [Enum.KeyCode.KeypadFive] = IO_oOOllOOoooIo_[135],
                [Enum.KeyCode.KeypadSix] = IO_oOOllOOoooIo_[136],
                [Enum.KeyCode.KeypadSeven] = IO_oOOllOOoooIo_[137],
                [Enum.KeyCode.KeypadEight] = IO_oOOllOOoooIo_[138],
                [Enum.KeyCode.KeypadNine] = IO_oOOllOOoooIo_[139],
                [Enum.KeyCode.KeypadZero] = IO_oOOllOOoooIo_[140]
            }
            
            local function I_IIoOIOloOllIOOI(_I_IOoIIlOl)
                return _l_oOlOloOOl[_I_IOoIIlOl] or _I_IOoIIlOl.Name or IO_oOOllOOoooIo_[141]
            end
            
            local function olI_oOoIol()
                oloI__OO_IllIIo.Text = Io_IllOIIIOll_ and "..." or I_IIoOIOloOllIOOI(IIOOOIIoIlooO)
                oloI__OO_IllIIo.TextColor3 = Io_IllOIIIOll_ and IoOlIOIOl_oIOIIooII.Theme.Warning or (IIOoOlo_IoOIllloooo and IoOlIOIOl_oIOIIooII.Theme.Accent or IoOlIOIOl_oIOIIooII.Theme.Text)
                
                local olOI_ll_oOooOIOoIlO = KeyDisplay:FindFirstChild("UIStroke")
                if olOI_ll_oOooOIOoIlO then
                    olOI_ll_oOooOIOoIlO.Color = IIOoOlo_IoOIllloooo and IoOlIOIOl_oIOIIooII.Theme.Accent or IoOlIOIOl_oIOIIooII.Theme.Outline
                    olOI_ll_oOooOIOoIlO.Transparency = IIOoOlo_IoOIllloooo and 0.3 or 0.6
                end
            end
            
            -- Keybind setting
            oOoIooIlOl_OooloIIO.MouseButton1Click:Connect(function()
                if Io_IllOIIIOll_ then return end
                
                Io_IllOIIIOll_ = true
                --PlaySound("6895079853", 0.08)
                olI_oOoIol()
                
                local IolIIOOoll
                IolIIOOoll = OOOllOIOllO_OoI.InputBegan:Connect(function(olIlO_OlIlIO, _OlOl_IooO)
                    if _OlOl_IooO then return end
                    
                    if olIlO_OlIlIO.UserInputType == Enum.UserInputType.Keyboard then
                        local _I_IOoIIlOl = olIlO_OlIlIO.KeyCode
                        
                        if _I_IOoIIlOl ~= Enum.KeyCode.Unknown then
                            IIOOOIIoIlooO = _I_IOoIIlOl
                            Io_IllOIIIOll_ = false
                            
                            olI_oOoIol()
                            --PlaySound("6895079725", 0.06)
                            
                            if _l__lI_Oll_l then
                                IoOlIOIOl_oIOIIooII.Flags[_l__lI_Oll_l] = IIOOOIIoIlooO
                            end
                            
                            connection:Disconnect()
                        end
                    end
                end)
                
                -- Auto-cancel after 5 seconds
                task.spawn(function()
                    task.wait(5)
                    if Io_IllOIIIOll_ then
                        Io_IllOIIIOll_ = false
                        olI_oOoIol()
                        connection:Disconnect()
                    end
                end)
            end)
            
            -- Key activation handling
            local IOlIOoIIloOoo = OOOllOIOllO_OoI.InputBegan:Connect(function(olIlO_OlIlIO, _OlOl_IooO)
                if _OlOl_IooO or Io_IllOIIIOll_ then return end
                
                if olIlO_OlIlIO.KeyCode == IIOOOIIoIlooO then
                    if _OOOOIooIoo_I == "Toggle" then
                        IIOoOlo_IoOIllloooo = not IIOoOlo_IoOIllloooo
                        olI_oOoIol()
                        pcall(function()
                            _OlllIIO_looolo_(IIOoOlo_IoOIllloooo, IIOOOIIoIlooO)
                        end)
                    elseif _OOOOIooIoo_I == IO_oOOllOOoooIo_[142] then
                        IIOoOlo_IoOIllloooo = true
                        olI_oOoIol()
                        pcall(function()
                            _OlllIIO_looolo_(true, IIOOOIIoIlooO)
                        end)
                    elseif _OOOOIooIoo_I == IO_oOOllOOoooIo_[143] then
                        pcall(function()
                            _OlllIIO_looolo_(IIOOOIIoIlooO)
                        end)
                    end
                end
            end)
            
            local olIOIololOoIolOIOl = OOOllOIOllO_OoI.InputEnded:Connect(function(olIlO_OlIlIO, _OlOl_IooO)
                if _OlOl_IooO or Io_IllOIIIOll_ then return end
                
                if olIlO_OlIlIO.KeyCode == IIOOOIIoIlooO and _OOOOIooIoo_I == "Hold" then
                    IIOoOlo_IoOIllloooo = false
                    olI_oOoIol()
                    pcall(function()
                        _OlllIIO_looolo_(false, IIOOOIIoIlooO)
                    end)
                end
            end)
            
            table.insert(IoOlIOIOl_oIOIIooII.Connections, IOlIOoIIloOoo)
            table.insert(IoOlIOIOl_oIOIIooII.Connections, olIOIololOoIolOIOl)
            
            -- Initialize
            olI_oOoIol()
            
            -- Register
            if _l__lI_Oll_l then
                IoOlIOIOl_oIOIIooII.Registry[_l__lI_Oll_l] = {
                    Set = function(_I_IOoIIlOl)
                        if typeof(_I_IOoIIlOl) == "EnumItem" and _I_IOoIIlOl.EnumType == Enum.KeyCode then
                            IIOOOIIoIlooO = _I_IOoIIlOl
                            olI_oOoIol()
                        end
                    end,
                    Get = function() return IIOOOIIoIlooO end,
                    GetState = function() return IIOoOlo_IoOIllloooo end
                }
            end
            
            -- Theme updates
            local _oOl____o_llO = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
                if oIIoOlOIOOlllI and oIIoOlOIOOlllI.Parent then
                    oIIoOlOIOOlllI.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Surface
                    oO_OIl_IlloIool.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
                    lOO_OOlOlO.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.SurfaceHighest
                    OooIooIOoIOOIOIl_.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextMuted
                    olI_oOoIol()
                end
            end)
            
            table.insert(IoOlIOIOl_oIOIIooII.Connections, _oOl____o_llO)
            
            return {
                Set = function(_I_IOoIIlOl)
                    if typeof(_I_IOoIIlOl) == "EnumItem" and _I_IOoIIlOl.EnumType == Enum.KeyCode then
                        IIOOOIIoIlooO = _I_IOoIIlOl
                        olI_oOoIol()
                    end
                end,
                Get = function() return IIOOOIIoIlooO end,
                GetState = function() return IIOoOlo_IoOIllloooo end,
                SetMode = function(oIllO_oOIo)
                    if oIllO_oOIo == "Toggle" or oIllO_oOIo == "Hold" or oIllO_oOIo == "Always" then
                        _OOOOIooIoo_I = oIllO_oOIo
                        OooIooIOoIOOIOIl_.Text = _OOOOIooIoo_I
                    end
                end
            }
        end

        function Tab:Collapsible(llOooOoIIOOlllI)
            local function ooIoooOIlOl(Illllllolo, _oOoOoOlOlIlIllooO)
                if type(_oOoOoOlOlIlIllooO) == "string" then _oOoOoOlOlIlIllooO = {Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO} end
                if not _oOoOoOlOlIlIllooO then _oOoOoOlOlIlIllooO = {} end
                
                local Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO.Text or IO_oOOllOOoooIo_[144]
                local oOoI_OlOIoooIloOI_ = _oOoOoOlOlIlIllooO.Open or false
                
                local lOIIlIIIIolO = _OI_olOOlOI("Frame", {
                    IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
                    IIlolo_Ilo__ = UDim2.new(1, 0, 0, 36),
                    ooloolOOlIoOolOool = true,
                    ZIndex = 1,
                    O_OoOO_I_oI = Illllllolo
                })
                
                llOl_IoIII_oIOIIo(lOIIlIIIIolO, 8)
                lIO__OIIOllOlOOl(lOIIlIIIIolO, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.4)
                
                -- Header Button (Bagian yang diklik)
                local oIOOo_oIl_IolIllIlI = _OI_olOOlOI("TextButton", {
                    Ioolo_OoIoIIoOIl = "",
                    oIo_o_IIll = 1,
                    IIlolo_Ilo__ = UDim2.new(1, 0, 0, 36),
                    O_OoOO_I_oI = lOIIlIIIIolO
                })
                
                local oOIlo_olIl_IIlO = _OI_olOOlOI("TextLabel", {
                    Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl,
                    IlIoOollo_lIllII = Enum.Font.GothamBold,
                    TextSize = 14,
                    TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
                    oIo_o_IIll = 1,
                    lOoOolOOolool = UDim2.new(0, 12, 0, 0),
                    IIlolo_Ilo__ = UDim2.new(1, -40, 1, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    O_OoOO_I_oI = oIOOo_oIl_IolIllIlI
                })
                
                local IlIIOlIoloII_ = _OI_olOOlOI("TextLabel", {
                    Ioolo_OoIoIIoOIl = "▼",
                    IlIoOollo_lIllII = Enum.Font.Gotham,
                    TextSize = 12,
                    TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub,
                    oIo_o_IIll = 1,
                    lOoOolOOolool = UDim2.new(1, -32, 0, 0),
                    IIlolo_Ilo__ = UDim2.new(0, 24, 1, 0),
                    Rotation = oOoI_OlOIoooIloOI_ and 180 or 0,
                    O_OoOO_I_oI = oIOOo_oIl_IolIllIlI
                })
                
                -- Container untuk isi elemen (Button, Toggle, dll)
                local _lloOolOOl_IlolOO = _OI_olOOlOI("Frame", {
                    oIo_o_IIll = 1,
                    lOoOolOOolool = UDim2.new(0, 0, 0, 36), -- Di bawah header
                    IIlolo_Ilo__ = UDim2.new(1, 0, 1, -36), -- Mengisi sisa ruang
                    ooloolOOlIoOolOool = false, 
                    O_OoOO_I_oI = lOIIlIIIIolO
                })
                
                local oIOlloolOloOlolo = _OI_olOOlOI("UIListLayout", {
                    Padding = UDim.new(0, 8),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    O_OoOO_I_oI = _lloOolOOl_IlolOO
                })
                
                local olooollOOOllIIoI = _OI_olOOlOI("UIPadding", {
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    O_OoOO_I_oI = _lloOolOOl_IlolOO
                })
                
                -- Fungsi Resize Otomatis
                local function oIIoOOoIOOIllolOl()
                    local IIllOIl_IIIoOIll = oIOlloolOloOlolo.AbsoluteContentSize.Y
                    local _IIoIloO_Il = oOoI_OlOIoooIloOI_ and (IIllOIl_IIIoOIll + 36 + 16) or 36
                    
                    if oOoI_OlOIoooIloOI_ then
                        lOIIlIIIIolO.ZIndex = 5 -- Naikkan prioritas saat buka
                        
                        lOoolOoIoOOOl(lOIIlIIIIolO, {IIlolo_Ilo__ = UDim2.new(1, 0, 0, _IIoIloO_Il)}, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                        lOoolOoIoOOOl(IlIIOlIoloII_, {Rotation = 180, TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent}, 0.3)
                        
                        task.delay(0.25, function()
                            if oOoI_OlOIoooIloOI_ then lOIIlIIIIolO.ClipsDescendants = false end
                        end)
                    else
                        lOIIlIIIIolO.ClipsDescendants = true
                        lOIIlIIIIolO.ZIndex = 1
                        
                        lOoolOoIoOOOl(lOIIlIIIIolO, {IIlolo_Ilo__ = UDim2.new(1, 0, 0, _IIoIloO_Il)}, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                        lOoolOoIoOOOl(IlIIOlIoloII_, {Rotation = 0, TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub}, 0.3)
                    end
                end
                
                ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    if oOoI_OlOIoooIloOI_ then oIIoOOoIOOIllolOl() end
                end)
                
                oIOOo_oIl_IolIllIlI.MouseButton1Click:Connect(function()
                    oOoI_OlOIoooIloOI_ = not oOoI_OlOIoooIloOI_
                    oIIoOOoIOOIllolOl()
                end)
                
                -- Hover Effects Header
                oIOOo_oIl_IolIllIlI.MouseEnter:Connect(function()
                    lOoolOoIoOOOl(lOIIlIIIIolO, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh}, 0.2)
                end)
                oIOOo_oIl_IolIllIlI.MouseLeave:Connect(function()
                    lOoolOoIoOOOl(lOIIlIIIIolO, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface}, 0.2)
                end)
                
                -- ==========================================================
                -- GROUP API
                -- ==========================================================
                local _oIoIO_oIIlooIlIO_O = {}
                
                function Group:Button(lOO_OlOolIO_loo_)
                    if type(lOO_OlOolIO_loo_) == "string" then lOO_OlOolIO_loo_ = {Ioolo_OoIoIIoOIl = lOO_OlOolIO_loo_} end
                    local Ioolo_OoIoIIoOIl = lOO_OlOolIO_loo_.Text or "Button"
                    local _OlllIIO_looolo_ = lOO_OlOolIO_loo_.Callback or function() end
                    
                    local olOlOlloOoololoOlOI = _OI_olOOlOI("Frame", {
                        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
                        IIlolo_Ilo__ = UDim2.new(1, 0, 0, 40),
                        O_OoOO_I_oI = _lloOolOOl_IlolOO
                    })
                    llOl_IoIII_oIOIIo(olOlOlloOoololoOlOI, 6)
                    
                    local oOIlOooOOOOOIOoooll = _OI_olOOlOI("TextButton", {
                        Ioolo_OoIoIIoOIl = "", oIo_o_IIll = 1, IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0), O_OoOO_I_oI = olOlOlloOoololoOlOI
                    })
                    
                    _OI_olOOlOI("TextLabel", {
                        Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl, IlIoOollo_lIllII = Enum.Font.GothamMedium, TextSize = 13,
                        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text, oIo_o_IIll = 1,
                        IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0), lOoOolOOolool = UDim2.new(0, 12, 0, 0),
                        TextXAlignment = Enum.TextXAlignment.Left, O_OoOO_I_oI = olOlOlloOoololoOlOI
                    })
                    
                    oOIlOooOOOOOIOoooll.MouseEnter:Connect(function() lOoolOoIoOOOl(olOlOlloOoololoOlOI, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHighest}, 0.15) end)
                    oOIlOooOOOOOIOoooll.MouseLeave:Connect(function() lOoolOoIoOOOl(olOlOlloOoololoOlOI, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh}, 0.15) end)
                    oOIlOooOOOOOIOoooll.MouseButton1Click:Connect(function() pcall(_OlllIIO_looolo_) end)
                    
                    return {
                        SetText = function(l_OoOOoIOoIIlOIl) end, -- Implement if needed
                        _IIIl__OO_oO = function(IoOOIOOolIIlIl) _OlllIIO_looolo_ = IoOOIOOolIIlIl end
                    }
                end

                -- [TAMBAHAN] Paragraph (Title + Content)
                function Group:Paragraph(lOO_OlOolIO_loo_)
                    if type(lOO_OlOolIO_loo_) == "string" then lOO_OlOolIO_loo_ = {oOIlo_olIl_IIlO = lOO_OlOolIO_loo_} end
                    if not lOO_OlOolIO_loo_ then lOO_OlOolIO_loo_ = {} end
                    
                    local OOll_lollolOOloOI = lOO_OlOolIO_loo_.Title or IO_oOOllOOoooIo_[145]
                    local IlOoIIIlo_olo = lOO_OlOolIO_loo_.Content or lOO_OlOolIO_loo_.Desc or ""
                    
                    -- Frame Container
                    local lOIIIlooOlI_lo = _OI_olOOlOI("Frame", {
                        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
                        IIlolo_Ilo__ = UDim2.new(1, 0, 0, 0), -- Tinggi akan otomatis
                        OoollIOIoOlOOOoOoII = Enum.AutomaticSize.Y, -- Agar menyesuaikan panjang teks
                        O_OoOO_I_oI = _lloOolOOl_IlolOO
                    })
                    llOl_IoIII_oIOIIo(lOIIIlooOlI_lo, 6)
                    
                    -- Padding agar teks tidak mepet pinggir
                    _OI_olOOlOI("UIPadding", {
                        PaddingTop = UDim.new(0, 10),
                        PaddingBottom = UDim.new(0, 10),
                        PaddingLeft = UDim.new(0, 12),
                        PaddingRight = UDim.new(0, 12),
                        O_OoOO_I_oI = lOIIIlooOlI_lo
                    })
                    
                    -- Layout untuk menyusun Judul dan Isi secara vertikal
                    local lIloloOoloOooI = _OI_olOOlOI("UIListLayout", {
                        Padding = UDim.new(0, 4),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        O_OoOO_I_oI = lOIIIlooOlI_lo
                    })
                    
                    -- Label Judul
                    local oooOI_Oll_IOlI = _OI_olOOlOI("TextLabel", {
                        Ioolo_OoIoIIoOIl = OOll_lollolOOloOI,
                        IlIoOollo_lIllII = Enum.Font.GothamBold,
                        TextSize = 13,
                        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
                        oIo_o_IIll = 1,
                        IIlolo_Ilo__ = UDim2.new(1, 0, 0, 0),
                        OoollIOIoOlOOOoOoII = Enum.AutomaticSize.Y,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        LayoutOrder = 1,
                        O_OoOO_I_oI = lOIIIlooOlI_lo
                    })
                    
                    -- Label Isi (Content)
                    local IlOIooOlI_lOOO_ = _OI_olOOlOI("TextLabel", {
                        Ioolo_OoIoIIoOIl = IlOoIIIlo_olo,
                        IlIoOollo_lIllII = Enum.Font.Gotham,
                        TextSize = 12,
                        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub,
                        oIo_o_IIll = 1,
                        IIlolo_Ilo__ = UDim2.new(1, 0, 0, 0),
                        OoollIOIoOlOOOoOoII = Enum.AutomaticSize.Y,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        LayoutOrder = 2,
                        O_OoOO_I_oI = lOIIIlooOlI_lo
                    })
                    
                    -- Return API untuk update teks nanti
                    return {
                        SetTitle = function(l_OoOOoIOoIIlOIl) oooOI_Oll_IOlI.Text = tostring(l_OoOOoIOoIIlOIl) end,
                        SetDesc = function(IoOOIOOolIIlIl) IlOIooOlI_lOOO_.Text = tostring(IoOOIOOolIIlIl) end,
                        SetContent = function(IoOOIOOolIIlIl) IlOIooOlI_lOOO_.Text = tostring(IoOOIOOolIIlIl) end
                    }
                end
                
                function Group:Toggle(lOO_OlOolIO_loo_)
                    if type(lOO_OlOolIO_loo_) == "string" then lOO_OlOolIO_loo_ = {Ioolo_OoIoIIoOIl = lOO_OlOolIO_loo_} end
                    local Ioolo_OoIoIIoOIl = lOO_OlOolIO_loo_.Text or "Toggle"
                    local IOIOI_OIIOlolooOolo = lOO_OlOolIO_loo_.Default or false
                    local _OlllIIO_looolo_ = lOO_OlOolIO_loo_.Callback or function() end
                    local _l__lI_Oll_l = lOO_OlOolIO_loo_.Flag
                    local IIloIII_ol = IOIOI_OIIOlolooOolo
                    
                    local I__llolIoOl = _OI_olOOlOI("Frame", {
                        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
                        IIlolo_Ilo__ = UDim2.new(1, 0, 0, 40),
                        O_OoOO_I_oI = _lloOolOOl_IlolOO
                    })
                    llOl_IoIII_oIOIIo(I__llolIoOl, 6)
                    
                    _OI_olOOlOI("TextLabel", {
                        Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl, IlIoOollo_lIllII = Enum.Font.GothamMedium, TextSize = 13,
                        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text, oIo_o_IIll = 1,
                        IIlolo_Ilo__ = UDim2.new(1, -50, 1, 0), lOoOolOOolool = UDim2.new(0, 12, 0, 0),
                        TextXAlignment = Enum.TextXAlignment.Left, O_OoOO_I_oI = I__llolIoOl
                    })
                    
                    local Il_lIloIIIOOOOlOlOo = _OI_olOOlOI("Frame", {
                        IoIOIo_I_IOllllOI = IIloIII_ol and IoOlIOIOl_oIOIIooII.Theme.Accent or IoOlIOIOl_oIOIIooII.Theme.Surface,
                        IIlolo_Ilo__ = UDim2.new(0, 36, 0, 18),
                        lOoOolOOolool = UDim2.new(1, -48, 0.5, -9),
                        O_OoOO_I_oI = I__llolIoOl
                    })
                    llOl_IoIII_oIOIIo(Il_lIloIIIOOOOlOlOo, 9)
                    
                    local OOlolIol_IOlIl = _OI_olOOlOI("Frame", {
                        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Text,
                        IIlolo_Ilo__ = UDim2.new(0, 14, 0, 14),
                        lOoOolOOolool = UDim2.new(0, IIloIII_ol and 20 or 2, 0.5, -7),
                        O_OoOO_I_oI = Il_lIloIIIOOOOlOlOo
                    })
                    llOl_IoIII_oIOIIo(OOlolIol_IOlIl, 7)
                    
                    local oOIlOooOOOOOIOoooll = _OI_olOOlOI("TextButton", {
                        Ioolo_OoIoIIoOIl = "", oIo_o_IIll = 1, IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0), O_OoOO_I_oI = I__llolIoOl
                    })
                    
                    local function oloOl_oIlIloIIOloo()
                        lOoolOoIoOOOl(Il_lIloIIIOOOOlOlOo, {IoIOIo_I_IOllllOI = IIloIII_ol and IoOlIOIOl_oIOIIooII.Theme.Accent or IoOlIOIOl_oIOIIooII.Theme.Surface}, 0.2)
                        lOoolOoIoOOOl(OOlolIol_IOlIl, {lOoOolOOolool = UDim2.new(0, IIloIII_ol and 20 or 2, 0.5, -7)}, 0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                        pcall(_OlllIIO_looolo_, IIloIII_ol)
                        if _l__lI_Oll_l then IoOlIOIOl_oIOIIooII.Flags[_l__lI_Oll_l] = IIloIII_ol end
                    end
                    
                    oOIlOooOOOOOIOoooll.MouseButton1Click:Connect(function()
                        IIloIII_ol = not IIloIII_ol
                        oloOl_oIlIloIIOloo()
                    end)
                    
                    if _l__lI_Oll_l then
                        IoOlIOIOl_oIOIIooII.Registry[_l__lI_Oll_l] = {
                            Set = function(_lIoOOolIlOoII) IIloIII_ol = _lIoOOolIlOoII; oloOl_oIlIloIIOloo() end,
                            Get = function() return IIloIII_ol end
                        }
                    end
                    
                    -- Trigger default jika true
                    if IOIOI_OIIOlolooOolo then pcall(_OlllIIO_looolo_, true) end
                    
                    return {
                        Set = function(_lIoOOolIlOoII) IIloIII_ol = _lIoOOolIlOoII; oloOl_oIlIloIIOloo() end,
                        Get = function() return IIloIII_ol end
                    }
                end
                
                function Group:Slider(lOO_OlOolIO_loo_)
                    local Ioolo_OoIoIIoOIl = lOO_OlOolIO_loo_.Text or "Slider"
                    local OlOOooIoOIO_OlO_oo, I_I_IoooOOOlo_o = lOO_OlOolIO_loo_.Min or 0, lOO_OlOolIO_loo_.Max or 100
                    local IOIOI_OIIOlolooOolo = lOO_OlOolIO_loo_.Default or OlOOooIoOIO_OlO_oo
                    local _OlllIIO_looolo_ = lOO_OlOolIO_loo_.Callback or function() end
                    local _l__lI_Oll_l = lOO_OlOolIO_loo_.Flag
                    local looI_oI_II = math.clamp(IOIOI_OIIOlolooOolo, OlOOooIoOIO_OlO_oo, I_I_IoooOOOlo_o)
                    
                    local Io_oloooII = _OI_olOOlOI("Frame", {
                        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
                        IIlolo_Ilo__ = UDim2.new(1, 0, 0, 50),
                        O_OoOO_I_oI = _lloOolOOl_IlolOO
                    })
                    llOl_IoIII_oIOIIo(Io_oloooII, 6)
                    
                    _OI_olOOlOI("TextLabel", {
                        Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl, IlIoOollo_lIllII = Enum.Font.GothamMedium, TextSize = 13,
                        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text, oIo_o_IIll = 1,
                        lOoOolOOolool = UDim2.new(0, 12, 0, 8), IIlolo_Ilo__ = UDim2.new(1, -24, 0, 14),
                        TextXAlignment = Enum.TextXAlignment.Left, O_OoOO_I_oI = Io_oloooII
                    })
                    
                    local _oIolIIOOOO = _OI_olOOlOI("TextLabel", {
                        Ioolo_OoIoIIoOIl = tostring(looI_oI_II), IlIoOollo_lIllII = Enum.Font.GothamBold, TextSize = 12,
                        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent, oIo_o_IIll = 1,
                        lOoOolOOolool = UDim2.new(1, -12, 0, 8), IIlolo_Ilo__ = UDim2.new(0, 0, 0, 14),
                        TextXAlignment = Enum.TextXAlignment.Right, O_OoOO_I_oI = Io_oloooII
                    })
                    
                    local _IllOOlIOlOollooO_ = _OI_olOOlOI("Frame", {
                        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
                        IIlolo_Ilo__ = UDim2.new(1, -24, 0, 4), lOoOolOOolool = UDim2.new(0, 12, 0, 32),
                        O_OoOO_I_oI = Io_oloooII
                    })
                    llOl_IoIII_oIOIIo(_IllOOlIOlOollooO_, 2)
                    
                    local OIIIlIOOOlIOOIOoI = _OI_olOOlOI("Frame", {
                        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Accent,
                        IIlolo_Ilo__ = UDim2.new((looI_oI_II - OlOOooIoOIO_OlO_oo)/(I_I_IoooOOOlo_o - OlOOooIoOIO_OlO_oo), 0, 1, 0),
                        O_OoOO_I_oI = _IllOOlIOlOollooO_
                    })
                    llOl_IoIII_oIOIIo(OIIIlIOOOlIOOIOoI, 2)
                    
                    local oOIlOooOOOOOIOoooll = _OI_olOOlOI("TextButton", {Ioolo_OoIoIIoOIl="", oIo_o_IIll=1, IIlolo_Ilo__=UDim2.new(1,0,1,0), O_OoOO_I_oI=Io_oloooII})
                    local OIOOIllOoIOI = false
                    
                    local function oloOl_oIlIloIIOloo(olIlO_OlIlIO)
                        local OllOOIIlOOlIolOoIOl = math.clamp((olIlO_OlIlIO.Position.X - _IllOOlIOlOollooO_.AbsolutePosition.X) / _IllOOlIOlOollooO_.AbsoluteSize.X, 0, 1)
                        looI_oI_II = math.floor(OlOOooIoOIO_OlO_oo + ((I_I_IoooOOOlo_o - OlOOooIoOIO_OlO_oo) * OllOOIIlOOlIolOoIOl))
                        _oIolIIOOOO.Text = tostring(looI_oI_II)
                        OIIIlIOOOlIOOIOoI.Size = UDim2.new(OllOOIIlOOlIolOoIOl, 0, 1, 0)
                        pcall(_OlllIIO_looolo_, looI_oI_II)
                        if _l__lI_Oll_l then IoOlIOIOl_oIOIIooII.Flags[_l__lI_Oll_l] = looI_oI_II end
                    end
                    
                    oOIlOooOOOOOIOoooll.InputBegan:Connect(function(oOIOOOIIOollolOO) if oOIOOOIIOollolOO.UserInputType == Enum.UserInputType.MouseButton1 then OIOOIllOoIOI=true; oloOl_oIlIloIIOloo(oOIOOOIIOollolOO) end end)
                    OOOllOIOllO_OoI.InputEnded:Connect(function(oOIOOOIIOollolOO) if oOIOOOIIOollolOO.UserInputType == Enum.UserInputType.MouseButton1 then OIOOIllOoIOI=false end end)
                    OOOllOIOllO_OoI.InputChanged:Connect(function(oOIOOOIIOollolOO) if OIOOIllOoIOI and oOIOOOIIOollolOO.UserInputType == Enum.UserInputType.MouseMovement then oloOl_oIlIloIIOloo(oOIOOOIIOollolOO) end end)
                    
                    if _l__lI_Oll_l then
                        IoOlIOIOl_oIOIIooII.Registry[_l__lI_Oll_l] = { Set = function(_lIoOOolIlOoII) looI_oI_II = math.clamp(_lIoOOolIlOoII, OlOOooIoOIO_OlO_oo, I_I_IoooOOOlo_o); _oIolIIOOOO.Text=tostring(looI_oI_II); OIIIlIOOOlIOOIOoI.Size=UDim2.new((looI_oI_II-OlOOooIoOIO_OlO_oo)/(I_I_IoooOOOlo_o-OlOOooIoOIO_OlO_oo),0,1,0) end }
                    end
                    
                    return {Set = function(_lIoOOolIlOoII) looI_oI_II = math.clamp(_lIoOOolIlOoII, OlOOooIoOIO_OlO_oo, I_I_IoooOOOlo_o); _oIolIIOOOO.Text=tostring(looI_oI_II); OIIIlIOOOlIOOIOoI.Size=UDim2.new((looI_oI_II-OlOOooIoOIO_OlO_oo)/(I_I_IoooOOOlo_o-OlOOooIoOIO_OlO_oo),0,1,0) end}
                end
                
                function Group:Input(lOO_OlOolIO_loo_)
                    if not lOO_OlOolIO_loo_ then lOO_OlOolIO_loo_ = {} end
                    local Ioolo_OoIoIIoOIl = lOO_OlOolIO_loo_.Text or IO_oOOllOOoooIo_[146]
                    local OloIoIlIlOIolOIlOII = lOO_OlOolIO_loo_.Placeholder or IO_oOOllOOoooIo_[147]
                    local looI_oI_II = lOO_OlOolIO_loo_.Value or ""
                    local _OlllIIO_looolo_ = lOO_OlOolIO_loo_.Callback or function() end
                    local _l__lI_Oll_l = lOO_OlOolIO_loo_.Flag
                    
                    local IolIIIo_oll = _OI_olOOlOI("Frame", {
                        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
                        IIlolo_Ilo__ = UDim2.new(1, 0, 0, 50),
                        O_OoOO_I_oI = _lloOolOOl_IlolOO
                    })
                    llOl_IoIII_oIOIIo(IolIIIo_oll, 6)
                    
                    _OI_olOOlOI("TextLabel", {
                        Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl, IlIoOollo_lIllII = Enum.Font.GothamMedium, TextSize = 13,
                        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text, oIo_o_IIll = 1,
                        lOoOolOOolool = UDim2.new(0, 12, 0, 8), IIlolo_Ilo__ = UDim2.new(1, -24, 0, 14),
                        TextXAlignment = Enum.TextXAlignment.Left, O_OoOO_I_oI = IolIIIo_oll
                    })
                    
                    local lOoolIOloIoooIOlIOo = _OI_olOOlOI("Frame", {
                        IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
                        IIlolo_Ilo__ = UDim2.new(1, -24, 0, 24), lOoOolOOolool = UDim2.new(0, 12, 0, 24),
                        O_OoOO_I_oI = IolIIIo_oll
                    })
                    llOl_IoIII_oIOIIo(lOoolIOloIoooIOlIOo, 4)
                    lIO__OIIOllOlOOl(lOoolIOloIoooIOlIOo, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.5)
                    
                    local lIIIoO_oI_OlIOIol = _OI_olOOlOI("TextBox", {
                        Ioolo_OoIoIIoOIl = tostring(looI_oI_II), PlaceholderText = OloIoIlIlOIolOIlOII, IlIoOollo_lIllII = Enum.Font.Gotham, TextSize = 12,
                        TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text, PlaceholderColor3 = IoOlIOIOl_oIOIIooII.Theme.TextMuted, oIo_o_IIll = 1,
                        IIlolo_Ilo__ = UDim2.new(1, -8, 1, 0), lOoOolOOolool = UDim2.new(0, 4, 0, 0),
                        TextXAlignment = Enum.TextXAlignment.Left, O_OoOO_I_oI = lOoolIOloIoooIOlIOo
                    })
                    
                    lIIIoO_oI_OlIOIol.FocusLost:Connect(function()
                        pcall(_OlllIIO_looolo_, lIIIoO_oI_OlIOIol.Text)
                        if _l__lI_Oll_l then IoOlIOIOl_oIOIIooII.Flags[_l__lI_Oll_l] = lIIIoO_oI_OlIOIol.Text end
                        lOoolOoIoOOOl(lOoolIOloIoooIOlIOo, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface}, 0.2)
                    end)
                    lIIIoO_oI_OlIOIol.Focused:Connect(function() lOoolOoIoOOOl(lOoolIOloIoooIOlIOo, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHighest}, 0.2) end)
                    
                    if _l__lI_Oll_l then IoOlIOIOl_oIOIIooII.Registry[_l__lI_Oll_l] = {Set=function(_lIoOOolIlOoII) lIIIoO_oI_OlIOIol.Text=tostring(_lIoOOolIlOoII) end, Get=function() return lIIIoO_oI_OlIOIol.Text end} end
                    return {Set=function(_lIoOOolIlOoII) lIIIoO_oI_OlIOIol.Text=tostring(_lIoOOolIlOoII) end, Get=function() return lIIIoO_oI_OlIOIol.Text end}
                end
                
                function Group:Dropdown(lOO_OlOolIO_loo_)
                    if not _lloOolOOl_IlolOO or not _lloOolOOl_IlolOO.Parent then return nil end
                    
                    -- Set parent ke ContentContainer kalo belum ada
                    lOO_OlOolIO_loo_.Parent = lOO_OlOolIO_loo_.Parent or _lloOolOOl_IlolOO
                    
                    return Nexus:CreateModernDropdown(lOO_OlOolIO_loo_)
                end

                
                function Group:Label(lOO_OlOolIO_loo_)
                    if type(lOO_OlOolIO_loo_) == "string" then lOO_OlOolIO_loo_ = {Ioolo_OoIoIIoOIl = lOO_OlOolIO_loo_} end
                    local lI_loIIoolI = _OI_olOOlOI("Frame", {oIo_o_IIll = 1, IIlolo_Ilo__ = UDim2.new(1, 0, 0, 24), O_OoOO_I_oI = _lloOolOOl_IlolOO})
                    _OI_olOOlOI("TextLabel", {
                        Ioolo_OoIoIIoOIl = lOO_OlOolIO_loo_.Text, IlIoOollo_lIllII = Enum.Font.Gotham, TextSize = 12, TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub, oIo_o_IIll = 1,
                        IIlolo_Ilo__ = UDim2.new(1, -16, 1, 0), lOoOolOOolool = UDim2.new(0, 16, 0, 0), TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, O_OoOO_I_oI = lI_loIIoolI
                    })
                end
                
                -- [[ KUNCI UTAMA NESTING ]]
                -- Kita tambahkan fungsi Collapsible ke dalam Group itu sendiri
                function Group:Collapsible(OooOO_l_lllIOOo)
                    -- Panggil fungsi pembangun rekursif ini lagi,
                    -- TAPI Parent-nya sekarang adalah ContentContainer milik Collapsible ini
                    return ooIoooOIlOl(_lloOolOOl_IlolOO, OooOO_l_lllIOOo)
                end
                
                return _oIoIO_oIIlooIlIO_O
            end
            
            -- Panggilan pertama (Parent = TabPage utama)
            return ooIoooOIlOl(_OoOoI_loloOO, llOooOoIIOOlllI)
        end
        
        function Tab:ColorPicker(_oOoOoOlOlIlIllooO)
            if not _oOoOoOlOlIlIllooO then _oOoOoOlOlIlIllooO = {} end
            
            local Ioolo_OoIoIIoOIl = _oOoOoOlOlIlIllooO.Text or IO_oOOllOOoooIo_[148]
            local IOIOI_OIIOlolooOolo = _oOoOoOlOlIlIllooO.Default or Color3.fromRGB(255, 255, 255)
            local _OlllIIO_looolo_ = _oOoOoOlOlIlIllooO.Callback or function() end
            local _l__lI_Oll_l = _oOoOoOlOlIlIllooO.Flag
            
            local ooo_llIlIooIooIl = IOIOI_OIIOlolooOolo
            
            local lIOIollIIoO = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
                IIlolo_Ilo__ = UDim2.new(1, 0, 0, 44),
                O_OoOO_I_oI = _OoOoI_loloOO
            })
            
            llOl_IoIII_oIOIIo(lIOIollIIoO, 8)
            lIO__OIIOllOlOOl(lIOIollIIoO, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.4)
            
            local OlOl_Io_oIOOIloOl = _OI_olOOlOI("TextLabel", {
                Ioolo_OoIoIIoOIl = Ioolo_OoIoIIoOIl,
                IlIoOollo_lIllII = Enum.Font.GothamMedium,
                TextSize = 14,
                TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
                oIo_o_IIll = 1,
                lOoOolOOolool = UDim2.fromOffset(16, 0),
                IIlolo_Ilo__ = UDim2.new(1, -80, 1, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                O_OoOO_I_oI = lIOIollIIoO
            })
            
            -- Color preview
            local olIlIIIOoOo = _OI_olOOlOI("Frame", {
                IoIOIo_I_IOllllOI = ooo_llIlIooIooIl,
                IIlolo_Ilo__ = UDim2.fromOffset(48, 28),
                lOoOolOOolool = UDim2.new(1, -64, 0.5, -14),
                O_OoOO_I_oI = lIOIollIIoO
            })
            
            llOl_IoIII_oIOIIo(olIlIIIOoOo, 6)
            lIO__OIIOllOlOOl(olIlIIIOoOo, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.4)
            
            local O_oIO_II_OolO = _OI_olOOlOI("TextButton", {
                Ioolo_OoIoIIoOIl = "",
                oIo_o_IIll = 1,
                IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
                O_OoOO_I_oI = lIOIollIIoO
            })
            
            -- Color picker popup
            local O_lOOIIOIOOolIo = false
            local OollIolOOlOlOl__o = nil
            
            local function loOoOlO_OoI(I_Ilollo_o)
                ooo_llIlIooIooIl = I_Ilollo_o
                olIlIIIOoOo.BackgroundColor3 = I_Ilollo_o
                
                pcall(function()
                    _OlllIIO_looolo_(I_Ilollo_o)
                end)
                
                if _l__lI_Oll_l then
                    IoOlIOIOl_oIOIIooII.Flags[_l__lI_Oll_l] = I_Ilollo_o
                end
            end
            
            O_oIO_II_OolO.MouseButton1Click:Connect(function()
                if O_lOOIIOIOOolIo then return end
                
                O_lOOIIOIOOolIo = true
                --PlaySound("6895079853", 0.08)
                
                -- Create color picker popup
                OollIolOOlOlOl__o = _OI_olOOlOI("Frame", {
                    IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface,
                    IIlolo_Ilo__ = UDim2.fromOffset(280, 320),
                    lOoOolOOolool = UDim2.new(0.5, -140, 0.5, -160),
                    O_OoOO_I_oI = _oIIIIlIoool_I
                })
                
                llOl_IoIII_oIOIIo(OollIolOOlOlOl__o, 12)
                lIO__OIIOllOlOOl(OollIolOOlOlOl__o, IoOlIOIOl_oIOIIooII.Theme.Accent, 2, 0.4)
                IolOololoIOoOOlI(OollIolOOlOlOl__o, 16, 0.8)
                
                -- Header
                local ooOlOIoOOllOOIOOo = _OI_olOOlOI("Frame", {
                    IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
                    IIlolo_Ilo__ = UDim2.new(1, 0, 0, 40),
                    O_OoOO_I_oI = OollIolOOlOlOl__o
                })
                
                llOl_IoIII_oIOIIo(ooOlOIoOOllOOIOOo, 12)
                
                local oIloOlIOlII = _OI_olOOlOI("Frame", {
                    IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh,
                    IIlolo_Ilo__ = UDim2.new(1, 0, 0, 12),
                    lOoOolOOolool = UDim2.new(0, 0, 1, -12),
                    BorderSizePixel = 0,
                    O_OoOO_I_oI = ooOlOIoOOllOOIOOo
                })
                
                local lIollIoloO = _OI_olOOlOI("TextLabel", {
                    Ioolo_OoIoIIoOIl = "Color Picker",
                    IlIoOollo_lIllII = Enum.Font.GothamBold,
                    TextSize = 16,
                    TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text,
                    oIo_o_IIll = 1,
                    lOoOolOOolool = UDim2.fromOffset(16, 0),
                    IIlolo_Ilo__ = UDim2.new(1, -80, 1, 0),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    O_OoOO_I_oI = ooOlOIoOOllOOIOOo
                })
                
                -- Close button
                local lolloIOOlI_lIlIo = _OI_olOOlOI("TextButton", {
                    Ioolo_OoIoIIoOIl = "✕",
                    IlIoOollo_lIllII = Enum.Font.GothamBold,
                    TextSize = 14,
                    TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub,
                    oIo_o_IIll = 1,
                    IIlolo_Ilo__ = UDim2.fromOffset(32, 32),
                    lOoOolOOolool = UDim2.new(1, -40, 0, 4),
                    O_OoOO_I_oI = ooOlOIoOOllOOIOOo
                })
                
                -- HSV conversion functions
                local function IOoOOOoloOII(oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo)
                    oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo = oOoOlooIlolIollIo / 255, looIOOllIol / 255, lIlOOIlOoOo / 255
                    local looOloO_IOO, IIIolOlllI = math.max(oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo), math.min(oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo)
                    local OoIO_OOllIIlIoI, llOoIlIOII, _lIoOOolIlOoII
                    _lIoOOolIlOoII = looOloO_IOO
                    
                    local IlI_lOlOlolOlo = looOloO_IOO - IIIolOlllI
                    if looOloO_IOO == 0 then
                        llOoIlIOII = 0
                    else
                        llOoIlIOII = IlI_lOlOlolOlo / looOloO_IOO
                    end
                    
                    if looOloO_IOO == IIIolOlllI then
                        OoIO_OOllIIlIoI = 0
                    else
                        if looOloO_IOO == oOoOlooIlolIollIo then
                            OoIO_OOllIIlIoI = (looIOOllIol - lIlOOIlOoOo) / IlI_lOlOlolOlo
                            if looIOOllIol < lIlOOIlOoOo then OoIO_OOllIIlIoI = OoIO_OOllIIlIoI + 6 end
                        elseif looOloO_IOO == looIOOllIol then
                            OoIO_OOllIIlIoI = (lIlOOIlOoOo - oOoOlooIlolIollIo) / IlI_lOlOlolOlo + 2
                        elseif looOloO_IOO == lIlOOIlOoOo then
                            OoIO_OOllIIlIoI = (oOoOlooIlolIollIo - looIOOllIol) / IlI_lOlOlolOlo + 4
                        end
                        OoIO_OOllIIlIoI = OoIO_OOllIIlIoI / 6
                    end
                    
                    return OoIO_OOllIIlIoI, llOoIlIOII, _lIoOOolIlOoII
                end
                
                local function _oOlo_ooOIOOlII(OoIO_OOllIIlIoI, llOoIlIOII, _lIoOOolIlOoII)
                    local oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo
                    local oOIOOOIIOollolOO = math.floor(OoIO_OOllIIlIoI * 6)
                    local oIIOOIooOOII = OoIO_OOllIIlIoI * 6 - oOIOOOIIOollolOO
                    local lO_lO_IIlOO = _lIoOOolIlOoII * (1 - llOoIlIOII)
                    local IOlIOIl_l_lOo = _lIoOOolIlOoII * (1 - oIIOOIooOOII * llOoIlIOII)
                    local l_OoOOoIOoIIlOIl = _lIoOOolIlOoII * (1 - (1 - oIIOOIooOOII) * llOoIlIOII)
                    
                    oOIOOOIIOollolOO = oOIOOOIIOollolOO % 6
                    
                    if oOIOOOIIOollolOO == 0 then
                        oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo = _lIoOOolIlOoII, l_OoOOoIOoIIlOIl, lO_lO_IIlOO
                    elseif oOIOOOIIOollolOO == 1 then
                        oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo = IOlIOIl_l_lOo, _lIoOOolIlOoII, lO_lO_IIlOO
                    elseif oOIOOOIIOollolOO == 2 then
                        oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo = lO_lO_IIlOO, _lIoOOolIlOoII, l_OoOOoIOoIIlOIl
                    elseif oOIOOOIIOollolOO == 3 then
                        oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo = lO_lO_IIlOO, IOlIOIl_l_lOo, _lIoOOolIlOoII
                    elseif oOIOOOIIOollolOO == 4 then
                        oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo = l_OoOOoIOoIIlOIl, lO_lO_IIlOO, _lIoOOolIlOoII
                    elseif oOIOOOIIOollolOO == 5 then
                        oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo = _lIoOOolIlOoII, lO_lO_IIlOO, IOlIOIl_l_lOo
                    end
                    
                    return math.floor(oOoOlooIlolIollIo * 255), math.floor(looIOOllIol * 255), math.floor(lIlOOIlOoOo * 255)
                end
                
                -- Get current HSV
                local OoIO_OOllIIlIoI, llOoIlIOII, _lIoOOolIlOoII = IOoOOOoloOII(ooo_llIlIooIooIl.R * 255, ooo_llIlIooIooIl.G * 255, ooo_llIlIooIooIl.B * 255)
                
                -- Color wheel
                local oIlIooOlO_OOlloIo = _OI_olOOlOI("Frame", {
                    IoIOIo_I_IOllllOI = Color3.new(1, 1, 1),
                    IIlolo_Ilo__ = UDim2.fromOffset(200, 200),
                    lOoOolOOolool = UDim2.fromOffset(16, 56),
                    O_OoOO_I_oI = OollIolOOlOlOl__o
                })
                
                llOl_IoIII_oIOIIo(oIlIooOlO_OOlloIo, 8)
                
                -- Hue bar
                local OlIOOlloIO = _OI_olOOlOI("Frame", {
                    IoIOIo_I_IOllllOI = Color3.new(1, 0, 0),
                    IIlolo_Ilo__ = UDim2.fromOffset(24, 200),
                    lOoOolOOolool = UDim2.fromOffset(232, 56),
                    O_OoOO_I_oI = OollIolOOlOlOl__o
                })
                
                llOl_IoIII_oIOIIo(OlIOOlloIO, 4)
                
                -- Hue gradient
                local lOoIlI_loOoIoIIOoo = _OI_olOOlOI("UIGradient", {
                    lOO_lIoI_O_o = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
                        ColorSequenceKeypoint.new(0.17, Color3.new(1, 1, 0)),
                        ColorSequenceKeypoint.new(0.33, Color3.new(0, 1, 0)),
                        ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 1)),
                        ColorSequenceKeypoint.new(0.67, Color3.new(0, 0, 1)),
                        ColorSequenceKeypoint.new(0.83, Color3.new(1, 0, 1)),
                        ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
                    },
                    Rotation = 90,
                    O_OoOO_I_oI = OlIOOlloIO
                })
                
                -- Color preview in picker
                local OOlllIIloo = _OI_olOOlOI("Frame", {
                    IoIOIo_I_IOllllOI = ooo_llIlIooIooIl,
                    IIlolo_Ilo__ = UDim2.fromOffset(200, 32),
                    lOoOolOOolool = UDim2.fromOffset(16, 272),
                    O_OoOO_I_oI = OollIolOOlOlOl__o
                })
                
                llOl_IoIII_oIOIIo(OOlllIIloo, 6)
                lIO__OIIOllOlOOl(OOlllIIloo, IoOlIOIOl_oIOIIooII.Theme.Outline, 1, 0.4)
                
                -- Update color function
                local function _OIIIOOIOIoll()
                    local oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo = _oOlo_ooOIOOlII(OoIO_OOllIIlIoI, llOoIlIOII, _lIoOOolIlOoII)
                    local I_Ilollo_o = Color3.fromRGB(oOoOlooIlolIollIo, looIOOllIol, lIlOOIlOoOo)
                    OOlllIIloo.BackgroundColor3 = I_Ilollo_o
                    loOoOlO_OoI(I_Ilollo_o)
                end
                
                -- Hue slider interaction
                local _Io_oOlIlIOoIoOoOO = _OI_olOOlOI("TextButton", {
                    Ioolo_OoIoIIoOIl = "",
                    oIo_o_IIll = 1,
                    IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
                    O_OoOO_I_oI = OlIOOlloIO
                })
                
                local IO_lOOoOo_oo = false
                
                _Io_oOlIlIOoIoOoOO.InputBegan:Connect(function(olIlO_OlIlIO)
                    if olIlO_OlIlIO.UserInputType == Enum.UserInputType.MouseButton1 then
                        -- [SAFETY 1] Cek apakah HueBar ada
                        if not OlIOOlloIO or not OlIOOlloIO.Parent then return end

                        IO_lOOoOo_oo = true
                        
                        -- Definisi variabel koneksi dulu agar bisa saling akses
                        local lIOoO_OOIoI_oI, IOOlIOloOoOII
                        
                        local function lOOoOOlllo()
                            -- [SAFETY 2] Cek lagi saat update berjalan
                            if not OlIOOlloIO or not OlIOOlloIO.Parent then
                                -- Jika bar hilang saat drag, putuskan koneksi paksa
                                if lIOoO_OOIoI_oI then moveConnection:Disconnect() end
                                if IOOlIOloOoOII then releaseConnection:Disconnect() end
                                IO_lOOoOo_oo = false
                                return
                            end

                            local O_lIIOollooo = UserInputService:GetMouseLocation().Y
                            local looooIIl_Il_ool = O_lIIOollooo - OlIOOlloIO.AbsolutePosition.Y
                            
                            -- [SAFETY 3] Hindari pembagian dengan nol
                            local lloI_IOlOllloOOOo_ = OlIOOlloIO.AbsoluteSize.Y
                            if lloI_IOlOllloOOOo_ == 0 then return end

                            local _OIolo_oIOoo = math.clamp(looooIIl_Il_ool / lloI_IOlOllloOOOo_, 0, 1)
                            OoIO_OOllIIlIoI = _OIolo_oIOoo
                            _OIIIOOIOIoll()
                        end
                        
                        lOOoOOlllo()
                        
                        lIOoO_OOIoI_oI = OOOllOIOllO_OoI.InputChanged:Connect(function(OoOI_OoIlIIloO_llOo)
                            if OoOI_OoIlIIloO_llOo.UserInputType == Enum.UserInputType.MouseMovement and IO_lOOoOo_oo then
                                lOOoOOlllo()
                            end
                        end)
                        
                        IOOlIOloOoOII = OOOllOIOllO_OoI.InputEnded:Connect(function(OoOI_OoIlIIloO_llOo)
                            if OoOI_OoIlIIloO_llOo.UserInputType == Enum.UserInputType.MouseButton1 then
                                IO_lOOoOo_oo = false
                                
                                -- Putuskan koneksi agar memori bersih
                                if lIOoO_OOIoI_oI then moveConnection:Disconnect() end
                                if IOOlIOloOoOII then releaseConnection:Disconnect() end
                            end
                        end)
                    end
                end)
                
                -- Color wheel interaction
                local oIoOoolloOIolIo = _OI_olOOlOI("TextButton", {
                    Ioolo_OoIoIIoOIl = "",
                    oIo_o_IIll = 1,
                    IIlolo_Ilo__ = UDim2.new(1, 0, 1, 0),
                    O_OoOO_I_oI = oIlIooOlO_OOlloIo
                })
                
                local olIOolOlIooI = false
                
                oIoOoolloOIolIo.InputBegan:Connect(function(olIlO_OlIlIO)
                    if olIlO_OlIlIO.UserInputType == Enum.UserInputType.MouseButton1 then
                        olIOolOlIooI = true
                        
                        local function _OlIollOIloI()
                            local OlOIl_oOoOlI = UserInputService:GetMouseLocation()
                            local Oo__OlIlOOoOlolI = OlOIl_oOoOlI.X - oIlIooOlO_OOlloIo.AbsolutePosition.X
                            local looooIIl_Il_ool = OlOIl_oOoOlI.Y - oIlIooOlO_OOlloIo.AbsolutePosition.Y
                            llOoIlIOII = math.clamp(Oo__OlIlOOoOlolI / oIlIooOlO_OOlloIo.AbsoluteSize.X, 0, 1)
                            _lIoOOolIlOoII = math.clamp(1 - (looooIIl_Il_ool / oIlIooOlO_OOlloIo.AbsoluteSize.Y), 0, 1)
                            _OIIIOOIOIoll()
                        end
                        
                        _OlIollOIloI()
                        
                        local lIOoO_OOIoI_oI = OOOllOIOllO_OoI.InputChanged:Connect(function(OoOI_OoIlIIloO_llOo)
                            if OoOI_OoIlIIloO_llOo.UserInputType == Enum.UserInputType.MouseMovement and olIOolOlIooI then
                                _OlIollOIloI()
                            end
                        end)
                        
                        local IOOlIOloOoOII = OOOllOIOllO_OoI.InputEnded:Connect(function(OoOI_OoIlIIloO_llOo)
                            if OoOI_OoIlIIloO_llOo.UserInputType == Enum.UserInputType.MouseButton1 then
                                olIOolOlIooI = false
                                moveConnection:Disconnect()
                                releaseConnection:Disconnect()
                            end
                        end)
                    end
                end)
                
                -- Update color wheel gradient based on hue
                local function llIIlOoIOIoOIO_IO()
                    local IOoIoOIol_lIoOO_ = Color3.fromHSV(OoIO_OOllIIlIoI, 1, 1)
                    oIlIooOlO_OOlloIo.BackgroundColor3 = IOoIoOIol_lIoOO_
                end
                
                -- Color wheel gradients for saturation and value
                local looIIlOOo_O = _OI_olOOlOI("UIGradient", {
                    lOO_lIoI_O_o = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                        ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                    },
                    Transparency = NumberSequence.new{
                        ColorSequenceKeypoint.new(0, 0),
                        ColorSequenceKeypoint.new(1, 1)
                    },
                    Rotation = 0,
                    O_OoOO_I_oI = oIlIooOlO_OOlloIo
                })
                
                local _oO__OloooIloOlloI = _OI_olOOlOI("UIGradient", {
                    lOO_lIoI_O_o = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
                        ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                    },
                    Transparency = NumberSequence.new{
                        ColorSequenceKeypoint.new(0, 1),
                        ColorSequenceKeypoint.new(1, 0)
                    },
                    Rotation = 90,
                    O_OoOO_I_oI = oIlIooOlO_OOlloIo
                })
                
                llIIlOoIOIoOIO_IO()
                
                -- Close picker
                local function lolIloOooo()
                    O_lOOIIOIOOolIo = false
                    lOoolOoIoOOOl(OollIolOOlOlOl__o, {
                        IIlolo_Ilo__ = UDim2.fromOffset(0, 0),
                        oIo_o_IIll = 1
                    }, 0.2)
                    task.wait(0.2)
                    if OollIolOOlOlOl__o then
                        ColorPickerFrame:Destroy()
                        OollIolOOlOlOl__o = nil
                    end
                end
                
                lolloIOOlI_lIlIo.MouseButton1Click:Connect(function()
                    --PlaySound("6895079725", 0.06)
                    lolIloOooo()
                end)
                
                -- Click outside to close
                local lIlI__llllOlIIoooo
                lIlI__llllOlIIoooo = OOOllOIOllO_OoI.InputBegan:Connect(function(olIlO_OlIlIO)
                    if olIlO_OlIlIO.UserInputType == Enum.UserInputType.MouseButton1 then
                        local OlOIl_oOoOlI = UserInputService:GetMouseLocation()
                        local I_lOOoo_IOl = OollIolOOlOlOl__o.AbsolutePosition
                        local IIolIOOIIo_lOollOl = OollIolOOlOlOl__o.AbsoluteSize
                        
                        if OlOIl_oOoOlI.X < I_lOOoo_IOl.X or OlOIl_oOoOlI.X > I_lOOoo_IOl.X + IIolIOOIIo_lOollOl.X or
                           OlOIl_oOoOlI.Y < I_lOOoo_IOl.Y or OlOIl_oOoOlI.Y > I_lOOoo_IOl.Y + IIolIOOIIo_lOollOl.Y then
                            lolIloOooo()
                            OutsideClickConnection:Disconnect()
                        end
                    end
                end)
                
                -- Animate picker open
                OollIolOOlOlOl__o.Size = UDim2.fromOffset(0, 0)
                OollIolOOlOlOl__o.BackgroundTransparency = 1
                lOoolOoIoOOOl(OollIolOOlOlOl__o, {
                    IIlolo_Ilo__ = UDim2.fromOffset(280, 320),
                    oIo_o_IIll = 0
                }, 0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                
                -- Initial color wheel update
                llIIlOoIOIoOIO_IO()
            end)
            
            -- Hover effects
            O_oIO_II_OolO.MouseEnter:Connect(function()
                lOoolOoIoOOOl(lIOIollIIoO, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh}, 0.15)
                lOoolOoIoOOOl(olIlIIIOoOo, {IIlolo_Ilo__ = UDim2.fromOffset(52, 32)}, 0.15)
            end)
            
            O_oIO_II_OolO.MouseLeave:Connect(function()
                lOoolOoIoOOOl(lIOIollIIoO, {IoIOIo_I_IOllllOI = IoOlIOIOl_oIOIIooII.Theme.Surface}, 0.15)
                lOoolOoIoOOOl(olIlIIIOoOo, {IIlolo_Ilo__ = UDim2.fromOffset(48, 28)}, 0.15)
            end)
            
            -- Register
            if _l__lI_Oll_l then
                IoOlIOIOl_oIOIIooII.Registry[_l__lI_Oll_l] = {
                    Set = function(ol_ooIlOlOo)
                        if typeof(ol_ooIlOlOo) == "Color3" then
                            loOoOlO_OoI(ol_ooIlOlOo)
                        end
                    end,
                    Get = function() return ooo_llIlIooIooIl end
                }
            end
            
            -- Theme updates
            local _olIlIIIIIOo = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
                if lIOIollIIoO and lIOIollIIoO.Parent then
                    lIOIollIIoO.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Surface
                    OlOl_Io_oIOOIloOl.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
                end
            end)
            
            table.insert(IoOlIOIOl_oIOIIooII.Connections, _olIlIIIIIOo)
            
            return {
                Set = function(ol_ooIlOlOo)
                    if typeof(ol_ooIlOlOo) == "Color3" then
                        loOoOlO_OoI(ol_ooIlOlOo)
                    end
                end,
                Get = function() return ooo_llIlIooIooIl end,
                SetText = function(IoIlIOIlOo)
                    OlOl_Io_oIOOIloOl.Text = tostring(IoIlIOIlOo or "")
                end
            }
        end

        
        
        -- Return Tab API
        return oooolIOoOo
    end
    
    -- Window Theme Updates
    local IIlOOloIlO_oo_O = IoOlIOIOl_oIOIIooII.ThemeChanged.Event:Connect(function()
        if not OlOloollIIoloIolO_l or not OlOloollIIoloIolO_l.Parent then return end
        
        -- Update window colors
        OlOloollIIoloIolO_l.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Background
        ___IIIIoloIIl_oIolo.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Surface
        OoooooOOoI_IoOo_OOo.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Surface
        oooIooIIlOlIO.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Text
        loOloIIOOIlIO.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub
        _oOlIIoloOIII_.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Surface
        lOIOIllooOl_ooOII.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.Background
        _IooOOOlO_O.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.Accent
        
        -- Update gradients
        loOOoOIoIIllo.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, IoOlIOIOl_oIOIIooII.Theme.Gradient1),
            ColorSequenceKeypoint.new(1, IoOlIOIOl_oIOIIooII.Theme.Gradient2)
        }
        
        -- Update control buttons
        Il_lOllOlIO.TextColor3 = IoOlIOIOl_oIOIIooII.Theme.TextSub
        Il_lOllOlIO.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh
        oIOoOlOOOOIloOI.BackgroundColor3 = IoOlIOIOl_oIOIIooII.Theme.SurfaceHigh
        
        -- Update strokes
        local ll_IolIolol = MainWindow:FindFirstChild("UIStroke")
        if ll_IolIolol then
            ll_IolIolol.Color = IoOlIOIOl_oIOIIooII.Theme.Outline
        end
        
        local oIIloOllIooOl = TabContainer:FindFirstChild("UIStroke")
        if oIIloOllIooOl then
            oIIloOllIooOl.Color = IoOlIOIOl_oIOIIooII.Theme.Outline
        end
    end)
    
    table.insert(IoOlIOIOl_oIOIIooII.Connections, IIlOOloIlO_oo_O)
    
    -- 📍 SEKARANG WINDOWAPI BISA MENGGUNAKAN CreateTab
    local OIIO_OoOlOIOo_lO = {
        SetTitle = function(IlooOl_lOOoIIIIO)
            oooIooIIlOlIO.Text = tostring(IlooOl_lOOoIIIIO or "")
        end,
        SetSubtitle = function(I_IlIlO_Ill___IoIlO)
            loOloIIOOIlIO.Text = tostring(I_IlIlO_Ill___IoIlO or "")
        end,
        SetIcon = function(IIIOoooOIIIlOO)
            _IooOOOlO_O.Text = tostring(IIIOoooOIIIlOO or "🚀")
        end,
        oooolIOoOo = function(lO_Oo_lIllI, _oOoOoOlOlIlIllooO)
            -- Cek apakah dipanggil dengan titik dua (:) atau titik (.)
            -- Jika self adalah tabel WindowAPI (punya fungsi SetTitle), maka argumen asli ada di 'config'
            if type(lO_Oo_lIllI) == "table" and lO_Oo_lIllI.SetTitle then
                return __I_IloOolOIIIloIO(_oOoOoOlOlIlIllooO)
            else
                -- Jika dipanggil dengan titik (Window.Tab), maka 'self' adalah config-nya
                return __I_IloOolOIIIloIO(lO_Oo_lIllI)
            end
        end,
        Notify = IoOlIOIOl_oIOIIooII.Notify,
        SetTheme = IoOlIOIOl_oIOIIooII.SetTheme,
        SaveConfig = IoOlIOIOl_oIOIIooII.SaveConfig,
        LoadConfig = IoOlIOIOl_oIOIIooII.LoadConfig,
        GetConfigs = IoOlIOIOl_oIOIIooII.GetConfigs,
        Destroy = function()
            for ooIlololllolIOlo, IolIIOOoll in pairs(IoOlIOIOl_oIOIIooII.Connections) do
                if IolIIOOoll and typeof(IolIIOOoll) == IO_oOOllOOoooIo_[149] then
                    connection:Disconnect()
                elseif IolIIOOoll and IolIIOOoll.Disconnect then
                    connection:Disconnect()
                end
            end
            
            -- Close window with animation
            lOoolOoIoOOOl(OlOloollIIoloIolO_l, {
                IIlolo_Ilo__ = UDim2.fromOffset(0, 0),
                oIo_o_IIll = 1
            }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            
            task.wait(0.3)
            
            if _oIIIIlIoool_I and _oIIIIlIoool_I.Parent then
                ScreenGui:Destroy()
            end
            
            IoOlIOIOl_oIOIIooII.Connections = {}
            IoOlIOIOl_oIOIIooII.Registry = {}
            IoOlIOIOl_oIOIIooII.Flags = {}
        end,
        Minimize = function()
            if _oIooIOlllOlIoOoII then
                _oIooIOlllOlIoOoII = false
                lOoolOoIoOOOl(OlOloollIIoloIolO_l, {
                    IIlolo_Ilo__ = OIllO_OoOO
                }, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                Il_lOllOlIO.Text = IO_oOOllOOoooIo_[150]
            else
                _oIooIOlllOlIoOoII = true
                lOoolOoIoOOOl(OlOloollIIoloIolO_l, {
                    IIlolo_Ilo__ = UDim2.new(0, OIllO_OoOO.X.Offset, 0, 40)
                }, 0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                Il_lOllOlIO.Text = IO_oOOllOOoooIo_[151]
            end
        end,
        GetFlag = function(I_lIolo_l_oIloIo_)
            return IoOlIOIOl_oIOIIooII.Flags[I_lIolo_l_oIloIo_]
        end,
        SetFlag = function(I_lIolo_l_oIloIo_, loolOoIIlIoloIIo_ll)
            if IoOlIOIOl_oIOIIooII.Registry[I_lIolo_l_oIloIo_] and IoOlIOIOl_oIOIIooII.Registry[I_lIolo_l_oIloIo_].Set then
                IoOlIOIOl_oIOIIooII.Registry[I_lIolo_l_oIloIo_].Set(loolOoIIlIoloIIo_ll)
            else
                IoOlIOIOl_oIOIIooII.Flags[I_lIolo_l_oIloIo_] = loolOoIIlIoloIIo_ll
            end

            Nexus:_ScheduleAutoSave()
        end
    }

    
    return OIIO_OoOlOIOo_lO
end

-- Export Nexus
return IoOlIOIOl_oIOIIooII
