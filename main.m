#import <Foundation/Foundation.h>
#import "MobileDeviceAccess.h"
#import "MobileDeviceConnection.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

int main (void) {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  /* parsing command-line arguments */
  NSUserDefaults *options = [NSUserDefaults standardUserDefaults];

  int gems = [options integerForKey:@"gems"];
  int crystals = [options integerForKey:@"crystals"];
  NSString *unlockHeroes = [options stringForKey:@"unlockHeroes"];
  NSString *godMode = [options stringForKey:@"godMode"];

  if (godMode) {
    gems = gems ? gems : 99999999;
    crystals = crystals ? crystals : 9999;
    unlockHeroes = @"yes";
  }

  /* print usage if no sufficient options given */
  if (!gems && !crystals && !unlockHeroes && !godMode) {
    NSLog(@"usage: ./nimble-quest-trainer [-gems <num>] [-crystals <num>] [-unlockHeroes yes] [-godMode yes]");
    exit(1);
  }

  NSLog(@"Nimble Quest Trainer");
  NSLog(@"--------------------");

  /* connect to the target device */
  MobileDeviceConnection *deviceConnection = [[MobileDeviceConnection alloc] init];
  [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
  AMDevice *device = deviceConnection.device;
  NSLog(@"[+] target device: %@", device.deviceName);

  /* constant pathnames */
  NSString *localPath = @"/tmp/ios.nimblebit.nimblequest.plist";
  NSString *remotePath = @"/Library/Preferences/ios.nimblebit.nimblequest.plist";
  NSString *appId = @"ios.nimblebit.nimblequest";

  /* read plist file from Nimble Quest application folder */
  AFCApplicationDirectory *nqAppDirectory = [device newAFCApplicationDirectory:appId];
  [nqAppDirectory copyRemoteFile:remotePath toLocalFile:localPath];
  NSMutableDictionary *nqDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:localPath];
  NSLog(@"[+] reading plist file from device");

  /* applying cheats on plist */
  NSLog(@"[+] apply cheats");
  if (gems) {
    NSLog(@"  [+] gems: %d -> %d", [[nqDictionary valueForKey:@"gems"] intValue], gems);
    [nqDictionary setObject:[NSNumber numberWithInt:gems] forKey:@"gems"];
  }

  if (crystals) {
    NSLog(@"  [+] crystals: %d -> %d", [[nqDictionary valueForKey:@"crystals"] intValue], crystals);
    [nqDictionary setObject:[NSNumber numberWithInt:crystals] forKey:@"crystals"];
  }

  if (unlockHeroes) {
    NSLog(@"  [+] all heroes unlocked!");
    NSString *unlockString = @"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15";
    [nqDictionary setObject:unlockString forKey:@"unlocked"];
  }

  if (godMode) {
    NSLog(@"  [+] god mode enabled!!");

    /* level up all heroes */
    for (int heroId = 1; heroId <= 15; heroId++) {
      NSString *objectKey = [NSString stringWithFormat:@"hero%dxp", heroId];
      [nqDictionary setObject:[NSNumber numberWithInt:55500] forKey:objectKey];
    }

    /* level up all powerups */
    NSArray *powerUpNames = [NSArray arrayWithObjects: @"attack", @"blizzard", @"bomb", @"health", @"loot", @"magnet", @"shield", nil];
    for (id powerUpName in powerUpNames) {
      NSString *objectKey = [NSString stringWithFormat:@"powerup_%@", powerUpName];
      [nqDictionary setObject:[NSNumber numberWithInt:5] forKey:objectKey];
    }
  }

  /* write patched plist back to device */
  [nqDictionary writeToFile:localPath atomically:YES];
  [nqAppDirectory unlink:remotePath];
  [nqAppDirectory copyLocalFile:localPath toRemoteFile:remotePath];
  [[NSFileManager defaultManager] removeItemAtPath:localPath error:NULL];
  NSLog(@"[+] write back changes to device");

  [pool drain];
  return 0;
}