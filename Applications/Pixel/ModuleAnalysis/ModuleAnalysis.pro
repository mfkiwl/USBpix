######################################################################
# Automatically generated by qmake (1.06c) Tue Oct 26 09:52:45 2004
######################################################################

TEMPLATE = app

include(../../../build-config/config.inc)

DESTDIR = $$(DAQ_BASE)/bin

unix {
   CONFIG += thread
   QMAKE_CXXFLAGS += -fPIC -DCOMPL -DHAVE_PLDB -DPIXEL_ROD -DTSTAMP -DI_AM_LINUX_HOST $(TDAQ_FLAG)
   INCLUDEPATH += $${system(root-config --incdir)} $(PIX_LIB)/PixConfDBInterface $(PIX_LIB)/Histo $(PIX_LIB)/Histo $(PIX_LIB)/PixController $(PIX_LIB) $(VME_INTERFACE) $(ROD_DAQ)/CommonWithDsp $(ROD_DAQ)/CommonWithDsp/Pixel $(ROD_DAQ)/Dsp/Code $(ROD_DAQ)/RodCrate $(PIX_ANA)/DataContainer $(PIX_ANA)/Fitting $(USBPIXDLL) $(USB_INCL_DIR)
   LIBS        += $${system(root-config --libs)} -lHistPainter \
                  -L$(DAQ_BASE)/lib -lPixAnalysis -lPixLib -lVmeInterface -lusbpixdll -lsiusb -lPixRS232
TDTEST = $$system(echo $TDAQ_FLAG)
count(TDTEST,0){
   LIBS        += -lRodCrate -L$(DAQ_LIB_DIR) -lvme_rcc -lcmem_rcc -lio_rcc -lrcc_error -lowl
}
GPTEST = $$system(echo $GPIB_FLAG)
GP_LINUX_TEST = $$system(echo $USE_GPIB_LINUX)
!count(GPTEST,0){
   count(GP_LINUX_TEST,0){
      LIBS        += -lPixGPIB -lgpibapi
   }
   !count(GP_LINUX_TEST,0){
      LIBS        += -lPixGPIB -lgpib
   }
}

   QMAKE_AR       = ar r
   QMAKE_RANLIB   = ranlib

   genLR.target = dictLogRoot.cpp
   genLR.commands = $$(ROOTSYS)/bin/rootcint -f dictLogRoot.cpp -c LogClasses.h LogRoot.h LinkDef.h
   genLR.depends = LogClasses.h LogRoot.h LinkDef.h
   genMAP.target = dictPalette.cpp
   genMAP.commands = $$(ROOTSYS)/bin/rootcint -f dictPalette.cpp -c MATPalette.h paletteLinkDef.h
   genMAP.depends = MATPalette.h paletteLinkDef.h
   TGLIB.target = lib
   TGLIB.depends = $(UICDECLS) $(OBJECTS) $(OBJMOC) 
   TGLIB.commands = $(AR) l$(DAQ_BASE)/lib/ibModuleAnalysis.a $(OBJECTS) $(OBJMOC) ; ar d $(DAQ_BASE)/lib/libModuleAnalysis.a main.o ; $(RANLIB) libModuleAnalysis.a
   TGSHR.target = shared
   TGSHR.depends = $(UICDECLS) $(OBJECTS) $(OBJMOC) 
   TGSHR.commands = $(LINK) -shared -o $(DAQ_BASE)/lib/libModuleAnalysis.so $(OBJECTS) $(OBJMOC)
   QMAKE_EXTRA_TARGETS += genLR genMAP TGLIB TGSHR
}
win32{
   CONFIG += thread
# (un-)comment following line to switch between windows and console building
#   CONFIG += console
   QMAKE_CXXFLAGS += /D"_CRT_SECURE_NO_WARNINGS" /D "_WINDOWS" /DWIN32 /D "_MBCS" /DUNICODE /DCOMPL /DHAVE_PLDB \
		     /DPIXEL_ROD /DI_AM_LINUX_HOST /DNOTDAQ /MP
   genLR.target = dictLogRoot.cpp
   genLR.commands = $$(ROOTSYS)\bin\rootcint -f dictLogRoot.cpp -c -DWIN32 LogClasses.h LogRoot.h LinkDef.h
   genLR.depends = LogClasses.h LogRoot.h LinkDef.h
   genMAP.target = dictPalette.cpp
   genMAP.commands = $$(ROOTSYS)\bin\rootcint -f dictPalette.cpp -c -DWIN32 MATPalette.h paletteLinkDef.h
   genMAP.depends = MATPalette.h paletteLinkDef.h
   INCLUDEPATH += $(ROOTSYS)\include $(PIX_LIB)\PixConfDBInterface $(PIX_LIB)\Histo $(PIX_LIB)\Histo $(PIX_LIB)\PixController $(PIX_LIB) $(VME_INTERFACE) $(ROD_DAQ)\CommonWithDsp $(ROD_DAQ)\CommonWithDsp/Pixel $(ROD_DAQ)\RodCrate $(PIX_ANA)\DataContainer $(PIX_ANA)\Fitting $(USBPIXDLL) $(USB_INCL_DIR)
   QMAKE_LFLAGS_RELEASE = delayimp.lib
   QMAKE_LFLAGS += /LIBPATH:"$(ROOTSYS)\lib" /LIBPATH:"$(USB_LIB_DIR)" /LIBPATH:"$(DAQ_BASE)"\lib
   LIBS        += libCore.lib libCint.lib libRIO.lib libNet.lib libHist.lib libGraf.lib libGraf3d.lib libGpad.lib libTree.lib libRint.lib libPostscript.lib libMatrix.lib libPhysics.lib libMathCore.lib libHistPainter.lib libPixAnalysis.lib libPixLib.lib libVmeInterface.lib SiLibUSB.lib USBPixdll.lib
   TGLIB.target = lib
#   TGLIB.depends = $(UICDECLS) $(OBJECTS) $(OBJMOC) 
   TGLIB.commands = lib /NOLOGO /OUT:"$(DAQ_BASE)"\lib\libModuleAnalysis.lib release\*.obj
#$(OBJECTS) $(OBJMOC)
   QMAKE_EXTRA_TARGETS += genLR genMAP TGLIB
}

INCLUDEPATH += .

# Input
HEADERS += BadPixel.h \
           CfgForm.h \
           ConfigViewer.h \
           CorrelSel.h \
           CutPanel.h \
           CDatabase.h \
           DataStuff.h \
	   DummyMain.h \
	   DBtoMAData.h \
           FileTypes.h \
           FileWin.h \
           FitWin.h \
	   MAFitting.h \
           PSFitWin.h \
           LinkDef.h \
	   LoadStave.h \
           LogClasses.h \
           LogDisp.h \
           LogRoot.h \
	   LoginPanel.h \
	   MaskMaker.h \
           MaskedSel.h \
           ModWin.h \
           ModTree.h \
           MultiLoad.h \
	   MultiLoadRDB.h \
           OptClass.h \
           OptWin.h \
           Overviewselect.h \
	   ParFitfun.h \
           PDBForm.h \
           QAReport.h \
           QRootApplication.h \
           RefWin.h \
           RegPanel.h \
           RenameWin.h \
           RootDataList.h \
           RootStuff.h \
           SelectionPanel.h \
           StdListChoice.h \
           StdTestWin.h \
           TopWin.h \
           TotRecal.h \
           Twodsel.h
FORMS  +=     BadPixelBase.ui \
              CfgFormBase.ui \
              CorrelSelBase.ui \
	      CutPanelBase.ui \
	      DummyMain.ui \
              FileWinBase.ui \
              FitWinBase.ui \
	      LoadStaveBase.ui \
              LogDispBase.ui \
              LoginPanelBase.ui \
	      MaskMaker.ui \
              MaskedSelBase.ui \
              ModWin.ui \
              MultiLoadBase.ui \
   	      MultiLoadRDBBase.ui \
              Overviewselectbase.ui \
	      OptWinBase.ui \
  	      ParFitfunBase.ui \
              PDBFormBase.ui \
              PSFitWinBase.ui \
              QAReportBase.ui \
              RefWinBase.ui \
              RegPanelBase.ui \
              RenameWin.ui \
              RootDataListBase.ui \
              SelectionPanelBase.ui \
              StdTestWinBase.ui \
              TopWinBase.ui \
              TotRecalBase.ui \
              TwodselBase.ui
SOURCES += BadPixel.cpp \
           CfgForm.cpp \
           ConfigViewer.cpp \
           CorrelSel.cpp \
           CutPanel.cpp \
           CDatabase.cpp \
           DataStuff.cpp \
	   DummyMain.cpp \
  	   DBtoMAData.cxx \
           dictLogRoot.cpp \
           dictPalette.cpp \
           FileWin.cpp \
           FitWin.cpp \
           MAFitting.cpp \
           PSFitWin.cpp \
	   LoadStave.cpp \
           LogClasses.cpp \
           LogDisp.cpp \
           LogRoot.cpp \
	   LoginPanel.cpp \
           main.cpp \
	   MAEngine.cpp \
	   MaskMaker.cpp \
           MaskedSel.cpp \
           ModTree.cpp \
           ModWin.cpp \
           MultiLoad.cpp \
	   MultiLoadRDB.cpp \
           OptClass.cpp \
           OptWin.cpp \
           Overviewselect.cpp \
	   ParFitfun.cpp \
           PDBForm.cpp \
           QAReport.cpp \
           QRootApplication.cpp \
           RefWin.cpp \
           RegPanel.cpp \
           RenameWin.cpp \
           RootDataList.cpp \
           RootStuff.cpp \
           SelectionPanel.cpp \
           StdListChoice.cpp \
           StdTestWin.cpp \
           TopWin.cpp \
           TotRecal.cpp \
           Twodsel.cpp 

#The following line was inserted by qt3to4
QT +=  qt3support 