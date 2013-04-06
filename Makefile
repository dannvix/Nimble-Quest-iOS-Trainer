CC = clang
CFLAGS =
CINC = 
CLIB = -F/System/Library/PrivateFrameworks -framework Foundation -framework Cocoa -framework MobileDevice

all:
	$(CC) $(CFLAGS) $(CINC) $(CLIB) -o nimble-quest-trainer main.m MobileDeviceConnection.m MobileDeviceAccess.m

clean:
	@rm -rf nimble-quest-trainer
