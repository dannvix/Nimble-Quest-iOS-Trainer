#pragma once
#if !defined(_MobileDeviceConnection_)
#define _MobileDeviceConnection_

#import <Foundation/Foundation.h>
#import "MobileDeviceAccess.h"

@class MobileDeviceConnection;

@interface MobileDeviceConnection : NSObject <MobileDeviceAccessListener> {
  AMDevice *device;
}

@property (nonatomic, retain) AMDevice *device;

- (BOOL) isDeviceConnected;

@end

#endif /* _MobileDeviceConnection_ */