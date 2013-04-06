#import "MobileDeviceConnection.h"

@implementation MobileDeviceConnection

@synthesize device;

- (id) init {
  self = [super init];
  if (self) {
    [[MobileDeviceAccess singleton] setListener:self];
  }
  return self;
}

- (void) dealloc {
  self.device = NULL;
  [super dealloc];
}

#pragma mark MobileDeviceAccessListener
- (void) deviceConnected:(AMDevice*)targetDevice {
  self.device = targetDevice;
}

#pragma mark MobileDeviceAccessListener
- (void) deviceDisconnected:(AMDevice*) targetDevice {
  self.device = NULL;
}

- (BOOL) isDeviceConnected {
  return !!(self.device);
}

@end