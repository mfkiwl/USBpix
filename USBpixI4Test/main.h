#pragma once
#ifdef __VISUALC__
  #include "stdafx.h"

  DEFINE_GUID(GUID_DEVINTERFACE_USB_DEVICE,
    0xA5DCBF10L, 0x6530, 0x11D2, 0x90, 0x1F, 0x00, 0xC0, 0x4F, 0xB9, 0x51, 0xED);
#endif

#include <QApplication>
#include "MainForm.h"



// derived QApplication class to overwrite event handler for Windows Message handling
class MyQApplication: public QApplication
{
public:
	MyQApplication(int argc, char* argv[]): QApplication(argc, argv)
	{;};
	MainForm *myMainForm;  // pointer to class which member function should be called 
#ifdef __VISUALC__
bool MyQApplication::doRegisterForDevNotification(void)
{
  DEV_BROADCAST_DEVICEINTERFACE NotificationFilter;

  ZeroMemory( &NotificationFilter, sizeof(NotificationFilter) );
  NotificationFilter.dbcc_size = sizeof(DEV_BROADCAST_DEVICEINTERFACE);
  NotificationFilter.dbcc_devicetype = DBT_DEVTYP_DEVICEINTERFACE;
  NotificationFilter.dbcc_classguid  = GUID_DEVINTERFACE_USB_DEVICE;

  /*hDevNotify = */RegisterDeviceNotification( HANDLE(this->myMainForm->winId()), &NotificationFilter,DEVICE_NOTIFY_WINDOW_HANDLE);
  return true;//(NULL != hDevNotify); 
};
#endif
protected:
#ifdef __VISUALC__
	bool winEventFilter(MSG * msg, long * result)  //extension of the applications message handler
	{
		if ((msg->message == WM_DEVICECHANGE) & ((msg->wParam == DBT_DEVICEARRIVAL) || (msg->wParam == DBT_DEVICEREMOVECOMPLETE)))
		{
			myMainForm->onDeviceChange();
			result = 0;
		  return true;
		}
		else
			return false;
	}
#endif
};