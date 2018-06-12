CONFIG -= qt
QT -= core gui
TEMPLATE = lib

include(../../../build-config/config.inc)

unix {
	INCLUDEPATH += $${system(root-config --incdir)} 
}
win32 {
	INCLUDEPATH += $(ROOTSYS)\include
}

INCLUDEPATH += $(VME_INTERFACE) 
INCLUDEPATH += $(PIX_RS232) 
INCLUDEPATH += $(USBPIXI3DLL) 
INCLUDEPATH += $(USBPIXI4DLL) 
INCLUDEPATH += $(PIX_SMTP)/src 
INCLUDEPATH += $(USB_INCL_DIR) 
INCLUDEPATH += $(ROD_DAQ) 
INCLUDEPATH += $(DAQ_INCL_DIR) 
INCLUDEPATH += $(ROD_DAQ)/CommonWithDsp 
INCLUDEPATH += $(ROD_DAQ)/CommonWithDsp/Pixel 
INCLUDEPATH += $(PIX_ANA)/Fitting
INCLUDEPATH += $(DAQ_BASE)/libSuess
INCLUDEPATH += $(PIX_LIB)

test_eudaq()
contains(DEFINES, WITHEUDAQ) {
  DEFINES += WITH_EUDAQ
}

DEFINES += PIXEL_ROD 
equals(GPIB_FLAG, "-DHAVE_GPIB") {
	INCLUDEPATH += $(PIX_GPIB)
	DEFINES += HAVE_GPIB
} else {
	SOURCES -= GPIBPixDcs.cxx
}

TDAQ_FLAG=$$(TDAQ_FLAG)
win32{
	TDAQ_FLAG = "-DNOTDAQ"
}
equals(TDAQ_FLAG, "-DNOTDAQ") {
	DEFINES += NOTDAQ
	SOURCES -= TimPixTrigController.cxx
	SOURCES -= RodPixController.cxx
	SUBDIRS -= TimPixTrigController
	SOURCES -= PixBoc.cxx
} else {
    INCLUDEPATH += $(ROD_DAQ)/NewDsp/common/DspInterface/PIX
    INCLUDEPATH += $(ROD_DAQ)/NewDsp/common/DspInterface
}

DEFINES += I_AM_LINUX_HOST 
DEFINES += TSTAMP

unix {
	DEFINES += CF__LINUX
	INCLUDEPATH += $(BOOSTINC)
}

win32{
	DEFINES += __VISUALC__
	DEFINES += MBCS
	DEFINES += _WINDOWS
	DEFINES += WIN32
}

win32{
	!equals(TARGET, libPixLib) {
		QMAKE_LINK = rem
		QMAKE_LINK_SHLIB = rem
		CONFIG -= embed_manifest_dll
	}
}

DESTDIR = $(DAQ_BASE)/lib