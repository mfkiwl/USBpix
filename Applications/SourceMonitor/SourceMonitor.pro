######################################################################
# Automatically generated by qmake (2.01a) Sun Jul 5 10:19:23 2015
######################################################################

include($(DAQ_BASE)/build-config/config.inc)
MOC_DIR = .moc
OBJECTS_DIR = .obj

unix {
   QMAKE_CXXFLAGS = -pipe -g -funsigned-char -fPIC -fexceptions $(GENCCFLAG)
   INCLUDEPATH += . $${system(root-config --incdir)}
   LIBS        +=   $${system(root-config --libs)} $(GENCCFLAG)
}
win32{
   CONFIG += warn_off
   QMAKE_CXXFLAGS = /D"_CRT_SECURE_NO_WARNINGS" /D "_WINDOWS" /MP
   LIBS += libCore.lib
   LIBS += libCint.lib
   LIBS += libRIO.lib
   LIBS += libNet.lib
   LIBS += libHist.lib
   LIBS += libGraf.lib
   LIBS += libGraf3d.lib
   LIBS += libGpad.lib
   LIBS += libTree.lib
   LIBS += libRint.lib
   LIBS += libPostscript.lib
   LIBS += libMatrix.lib
   LIBS += libPhysics.lib
   LIBS += libMathCore.lib
   LIBS += libHistPainter.lib
   INCLUDEPATH += . $(ROOTSYS)/include
   QMAKE_LFLAGS_RELEASE = delayimp.lib
   QMAKE_LFLAGS_WINDOWS += /LIBPATH:"$(ROOTSYS)/lib"
   QMAKE_LFLAGS_CONSOLE += /LIBPATH:"$(ROOTSYS)/lib"
}


TEMPLATE = app
DESTDIR = $$(DAQ_BASE)/bin

# Input
HEADERS += external_input.h monitor.h
SOURCES += external_input.cpp main.cpp monitor.cpp

equals(QT_MAJOR_VERSION, 5) {
  QT+= widgets
}
contains(BUILDFLAGS, QT5_FIX_QDIALOG) {
	message ("Applying buildflag: QT5_FIX_DIALOG")
	DEFINES += QT5_FIX_QDIALOG
}
