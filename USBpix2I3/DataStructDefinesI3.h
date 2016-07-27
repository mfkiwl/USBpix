#ifndef DATASTRUCTDEFINESI3_H
#define DATASTRUCTDEFINESI3_H

//	numbered				name					BRAM	bit		standard
//	consecutively									address	length	value

static ConfDataStructI3 gloCnfRegItem[GLOBAL_REG_ITEMS] =
{
	{COMMAND,				"COMMAND",				0,		24,		0},
	{CHIPADDRESS,			"CHIPADDRESS",			24,		5,		31},
	{EMPTY3BIT,				"EMPTY3BIT",			29,		3,		0},
	{GLOBALPARITY,			"GLOBALPARITY",			262,	1,		1},
	{CHIP_LATENCY,			"CHIP_LATENCY",			254,	8,		255},
	{SELFTRGDELAY,			"SELFTRGDELAY",			250,	4,		0},
	{SELFTRGWIDTH,			"SELFTRGWIDTH",			246,	4,		0},
	{ENABLESELFTRG,			"ENABLESELFTRG",		245,	1,		0},
	{ENABLEHITPARITY,		"ENABLEHITPARITY",		244,	1,		0},
	{SELECTDO,				"SELECTDO",				240,	4,		8},
	{SELECTMONHIT,			"SELECTMONHIT",			236,	4,		1},
	{TSITSCENABLE,			"TSITSCENABLE",			235,	1,		1},
	{SELECTDATAPHASE,		"SELECTDATAPHASE",		234,	1,		0},
	{ENABLEEOEPARITY,		"ENABLEEOEPARITY",		233,	1,		0},
	{HITBUSSCALER,			"HITBUSSCALER",			225,	8,		0},
	{MONLEAKADC,			"MONLEAKADC",			211,	14,		0},
	{AREGTRIM,				"AREGTRIM",				209,	2,		0},
	{ENABLEAREGMEAS,		"ENABLEAREGMEAS",		208,	1,		0},
	{AREGMEAS,				"AREGMEAS",				206,	2,		0},
	{ENABLEAREG,			"ENABLEAREG",			205,	1,		0},
	{ENABLELVDSREFMEAS,		"ENABLELVDSREFMEAS",	204,	1,		0},
	{DREGTRIM,				"DREGTRIM",				202,	2,		0},
	{ENABLEDREGMEAS,		"ENABLEDREGMEAS",		201,	1,		0},
	{DREGMEAS,				"DREGMEAS",				199,	2,		0},
	{CAPMEASCIRCUIT,		"CAPMEASCIRCUIT",		193,	6,		0},
	{ENABLECAPTEST,			"ENABLECAPTEST",		192,	1,		0},
	{ENABLEANALOGOUT,		"ENABLEANALOGOUT",		191,	1,		0},
	{TESTPIXELMUX,			"TESTPIXELMUX",			189,	2,		0},
	{ENABLEVCALMEAS,		"ENABLEVCALMEAS",		188,	1,		0},
	{ENABLELEAKMEAS,		"ENABLELEAKMEAS",		187,	1,		0},
	{ENABLEBUFFERBOOST,		"ENABLEBUFFERBOOST",	186,	1,		0},
	{ENABLECOL8,			"ENABLECOL8",			185,	1,		1},
	{TESTDACIVDD2,			"TESTDACIVDD2",			184,	1,		0},
	{IVDD2DAC,				"IVDD2DAC",				176,	8,		64},
	{IDDAC,					"IDDAC",				168,	8,		64},
	{TESTDACID,				"TESTDACID",			167,	1,		0},
	{ENABLECOL7,			"ENABLECOL7",			166,	1,		1},
	{TESTDACIP2,			"TESTDACIP2",			165,	1,		0},
	{IP2DAC,				"IP2DAC",				157,	8,		64},
	{IPDAC,					"IPDAC",				149,	8,		64},
	{TESTDACIP,				"TESTDACIP",			148,	1,		0},
	{ENABLECOL6,			"ENABLECOL6",			147,	1,		1},
	{TESTDACITRIMTH,		"TESTDACITRIMTH",		146,	1,		0},
	{ITRIMTHDAC,			"ITRIMTHDAC",			138,	8,		64},
	{IFDAC,					"IFDAC",				130,	8,		32},
	{TESTDACIF,				"TESTDACIF",			129,	1,		0},
	{ENABLECOL5,			"ENABLECOL5",			128,	1,		1},
	{TESTDACITRIMIF,		"TESTDACITRIMIF",		127,	1,		0},
	{ITRIMIFDAC,			"ITRIMIFDAC",			119,	8,		16},
	{VCALDAC,				"VCALDAC",				109,	10,		200},
	{TESTDACVCAL,			"TESTDACVCAL",			108,	1,		0},
	{ENABLECOL4,			"ENABLECOL4",			107,	1,		1},
	{HITINJECTCAPSEL,		"HITINJECTCAPSEL",		106,	1,		0},
	{ENABLEEXTINJ,			"ENABLEEXTINJ",			105,	1,		0},
	{TESTANALOGREF,			"TESTANALOGREF",		104,	1,		0},
	{EOCMUXCONTROL,			"EOCMUXCONTROL",		102,	2,		0},
	{CEUCLOCKCONTROL,		"CEUCLOCKCONTROL",		100,	2,		2},
	{ENABLEDIGITALINJ,		"ENABLEDIGITALINJ",		99,		1,		0},
	{ENABLECOL3,			"ENABLECOL3",			98,		1,		1},
	{TESTDACITH1,			"TESTDACITH1",			97,		1,		0},
	{ITH1DAC,				"ITH1DAC",				89,		8,		0},
	{ITH2DAC,				"ITH2DAC",				81,		8,		0},
	{TESTDACITH2,			"TESTDACITH2",			80,		1,		0},
	{ENABLECOL2,			"ENABLECOL2",			79,		1,		1},
	{TESTDACIL,				"TESTDACIL",			78,		1,		0},
	{ILDAC,					"ILDAC",				70,		8,		64},
	{IL2DAC,				"IL2DAC",				62,		8,		64},
	{TESTDACIL2,			"TESTDACIL2",			61,		1,		0},
	{ENABLECOL1,			"ENABLECOL1",			60,		1,		1},
	{THRMIN,				"THRMIN",				52,		8,		0},
	{THRDUB,				"THRDUB",				44,		8,		0},
	{READMODE,				"READMODE",				42,		2,		0},
	{ENABLECOL0,			"ENABLECOL0",			41,		1,		1},
	{HITBUSENABLE,			"HITBUSENABLE",			40,		1,		0},
	{GLOBALTDAC,			"GLOBALTDAC",			35,		5,		14},
	{ENABLETUNE,			"ENABLETUNE",			34,		1,		0},
	{ENABLEBIASCOMP,		"ENABLEBIASCOMP",		33,		1,		1},
	{ENABLEIPMONITOR,		"ENABLEIPMONITOR",		32,		1,		0}
};

static ConfDataStructI3 pixCnfRegItem[PIXEL_REG_ITEMS] =
{
	{COMMAND,				"COMMAND",				0,		24,		0},
	{CHIPADDRESS,			"CHIPADDRESS",			24,		5,		15},
	{EMPTY3BIT,				"EMPTY3BIT",			29,		3,		0},
	{PIXEL2880,				"PIXEL2880",			32,		32,		0},
	{PIXEL2848,				"PIXEL2848",			64,		32,		0},
	{PIXEL2816,				"PIXEL2816",			96,		32,		0},
	{PIXEL2784,				"PIXEL2784",			128,	32,		0},
	{PIXEL2752,				"PIXEL2752",			160,	32,		0},
	{PIXEL2720,				"PIXEL2720",			192,	32,		0},
	{PIXEL2688,				"PIXEL2688",			224,	32,		0},
	{PIXEL2656,				"PIXEL2656",			256,	32,		0},
	{PIXEL2624,				"PIXEL2624",			288,	32,		0},
	{PIXEL2592,				"PIXEL2592",			320,	32,		0},
	{PIXEL2560,				"PIXEL2560",			352,	32,		0},
	{PIXEL2528,				"PIXEL2528",			384,	32,		0},
	{PIXEL2496,				"PIXEL2496",			416,	32,		0},
	{PIXEL2464,				"PIXEL2464",			448,	32,		0},
	{PIXEL2432,				"PIXEL2432",			480,	32,		0},
	{PIXEL2400,				"PIXEL2400",			512,	32,		0},
	{PIXEL2368,				"PIXEL2368",			544,	32,		0},
	{PIXEL2336,				"PIXEL2336",			576,	32,		0},
	{PIXEL2304,				"PIXEL2304",			608,	32,		0},
	{PIXEL2272,				"PIXEL2272",			640,	32,		0},
	{PIXEL2240,				"PIXEL2240",			672,	32,		0},
	{PIXEL2208,				"PIXEL2208",			704,	32,		0},
	{PIXEL2176,				"PIXEL2176",			736,	32,		0},
	{PIXEL2144,				"PIXEL2144",			768,	32,		0},
	{PIXEL2112,				"PIXEL2112",			800,	32,		0},
	{PIXEL2080,				"PIXEL2080",			832,	32,		0},
	{PIXEL2048,				"PIXEL2048",			864,	32,		0},
	{PIXEL2016,				"PIXEL2016",			896,	32,		0},
	{PIXEL1984,				"PIXEL1984",			928,	32,		0},
	{PIXEL1952,				"PIXEL1952",			960,	32,		0},
	{PIXEL1920,				"PIXEL1920",			992,	32,		0},
	{PIXEL1888,				"PIXEL1888",			1024,	32,		0},
	{PIXEL1856,				"PIXEL1856",			1056,	32,		0},
	{PIXEL1824,				"PIXEL1824",			1088,	32,		0},
	{PIXEL1792,				"PIXEL1792",			1120,	32,		0},
	{PIXEL1760,				"PIXEL1760",			1152,	32,		0},
	{PIXEL1728,				"PIXEL1728",			1184,	32,		0},
	{PIXEL1696,				"PIXEL1696",			1216,	32,		0},
	{PIXEL1664,				"PIXEL1664",			1248,	32,		0},
	{PIXEL1632,				"PIXEL1632",			1280,	32,		0},
	{PIXEL1600,				"PIXEL1600",			1312,	32,		0},
	{PIXEL1568,				"PIXEL1568",			1344,	32,		0},
	{PIXEL1536,				"PIXEL1536",			1376,	32,		0},
	{PIXEL1504,				"PIXEL1504",			1408,	32,		0},
	{PIXEL1472,				"PIXEL1472",			1440,	32,		0},
	{PIXEL1440,				"PIXEL1440",			1472,	32,		0},
	{PIXEL1408,				"PIXEL1408",			1504,	32,		0},
	{PIXEL1376,				"PIXEL1376",			1536,	32,		0},
	{PIXEL1344,				"PIXEL1344",			1568,	32,		0},
	{PIXEL1312,				"PIXEL1312",			1600,	32,		0},
	{PIXEL1280,				"PIXEL1280",			1632,	32,		0},
	{PIXEL1248,				"PIXEL1248",			1664,	32,		0},
	{PIXEL1216,				"PIXEL1216",			1696,	32,		0},
	{PIXEL1184,				"PIXEL1184",			1728,	32,		0},
	{PIXEL1152,				"PIXEL1152",			1760,	32,		0},
	{PIXEL1120,				"PIXEL1120",			1792,	32,		0},
	{PIXEL1088,				"PIXEL1088",			1824,	32,		0},
	{PIXEL1056,				"PIXEL1056",			1856,	32,		0},
	{PIXEL1024,				"PIXEL1024",			1888,	32,		0},
	{PIXEL992,				"PIXEL992",				1920,	32,		0},
	{PIXEL960,				"PIXEL960",				1952,	32,		0},
	{PIXEL928,				"PIXEL928",				1984,	32,		0},
	{PIXEL896,				"PIXEL896",				2016,	32,		0},
	{PIXEL864,				"PIXEL864",				2048,	32,		0},
	{PIXEL832,				"PIXEL832",				2080,	32,		0},
	{PIXEL800,				"PIXEL800",				2112,	32,		0},
	{PIXEL768,				"PIXEL768",				2144,	32,		0},
	{PIXEL736,				"PIXEL736",				2176,	32,		0},
	{PIXEL704,				"PIXEL704",				2208,	32,		0},
	{PIXEL672,				"PIXEL672",				2240,	32,		0},
	{PIXEL640,				"PIXEL640",				2272,	32,		0},
	{PIXEL608,				"PIXEL608",				2304,	32,		0},
	{PIXEL576,				"PIXEL576",				2336,	32,		0},
	{PIXEL544,				"PIXEL544",				2368,	32,		0},
	{PIXEL512,				"PIXEL512",				2400,	32,		0},
	{PIXEL480,				"PIXEL480",				2432,	32,		0},
	{PIXEL448,				"PIXEL448",				2464,	32,		0},
	{PIXEL416,				"PIXEL416",				2496,	32,		0},
	{PIXEL384,				"PIXEL384",				2528,	32,		0},
	{PIXEL352,				"PIXEL352",				2560,	32,		0},
	{PIXEL320,				"PIXEL320",				2592,	32,		0},
	{PIXEL288,				"PIXEL288",				2624,	32,		0},
	{PIXEL256,				"PIXEL256",				2656,	32,		0},
	{PIXEL224,				"PIXEL224",				2688,	32,		0},
	{PIXEL192,				"PIXEL192",				2720,	32,		0},
	{PIXEL160,				"PIXEL160",				2752,	32,		0},
	{PIXEL128,				"PIXEL128",				2784,	32,		0},
	{PIXEL96,				"PIXEL96",				2816,	32,		0},
	{PIXEL64,				"PIXEL64",				2848,	32,		0},
	{PIXEL32,				"PIXEL32",				2880,	32,		0}
};

#endif
