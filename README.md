Nimble Quest iOS Trainer
========================

Introduction
------------
[Nimble Quest](https://itunes.apple.com/us/app/nimble-quest/id583638819) ia a great and addictive game. Lead a conga line of heroes to glory against hordes of enemies across an endless number of stages.

However, I am done with the fxxking expensive respawning. It costs me 2^n crystals each time to revive without lost current progress. Here comes the trainer!

By the way, sorry for Windows and Android users. lol


Screenshot (God Mode)
---------------------
![Nimble Quest god mode screenshot](https://raw.github.com/dannvix/Nimble-Quest-iOS-Trainer/master/god-mode-screenshot.png)
The copyright of the screenshots belongss to all the original authors.


Before You Jump
---------------
* **consider support the author for such great game!** purchase some items inside the game :)
* this tool uses undocumented APIs, which might be harmful to your device, and I'm not responsible


Requirements
------------
* Nimble Quest for iOS
    - download from [iTunes App Store](https://itunes.apple.com/us/app/nimble-quest/id583638819), it's free!
    - tested on v1.0 with iPhone 4S
* Mac OS X
    - I use 10.7.5; don't know backward compatibility :P
* iTunes, version compatible to your iOS device
* Xcode, 4.3+
    - [command-line tools](http://stackoverflow.com/questions/9329243) is required
* USB cable for iOS device


How to CHEAT
------------
1. plug iOS device to Mac with USB cable (*Wi-Fi is currently not supported*)
2. download this trainer
    - download the Zip archive
    - or `git clone https://github.com/dannvix/Nimble-Quest-iOS-Trainer.git`
3. build the program by `cd Nimble-Quest-iOS-Trainer/ && make`
4. `./nimble-quest-trainer [-gems <num>] [-crystals <num>] [-unlockHeroes yes] [-godMode yes]`
    - example: `./nimble-quest-trainer -gems 9999 -crystals 99 -unlockHeroes yes`
    - `-godMode yes` unlocks and upgrade all heros and powerups, **this actually makes the game boring**


Acknowledgements
----------------
* Thanks to NimbleBit for making great games!
* Thanks to Jeff Liang (@tristero) for the [MobileDeviceAccess](https://bitbucket.org/tristero/mobiledeviceaccess) library


License
-------
Copyright (c) 2013 Shao-Chung Chen

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
