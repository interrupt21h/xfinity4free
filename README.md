xfinity4free
============

Script to probe Comcast's WISPr server for valid MAC addresses

...this seems to no longer work.  Maybe they fixed it.  It was great while it lasted.  The same program could be used for any other such service... but, Comcast was especially easy, due to the size of their network.


Usage:
 ./xfinity4free.sh [MASK]

Example:
 ./xfinity4free.sh 4c:b1:99:27:2X:XX


You can use the web to find a valid OUI to use as a prefix (ex http://www.wireshark.org/tools/oui-lookup.html).  I simply grabbed the first 28 bits of an iPad and an android WiFi adapter as a starting point.  

After finding a valid MAC, using a program such as macchanger to change your adapter's MAC will result in free wifi at "xfinitywifi" hot spots.


Sample output:

$ ./xfinity4free.sh e4:25:e7:ee:3x:xx

.-=[ Xfinity public wifi miner by scott@21h.io ]=-.

Starting scan of E4:25:E7:EE:3X:XX ...

[E4:25:E7:EE:30:00] [E4:25:E7:EE:30:01] [E4:25:E7:EE:30:02] [E4:25:E7:EE:30:03] [E4:25:E7:EE:30:04] [E4:25:E7:EE:30:05] [E4:25:E7:EE:30:06] [E4:25:E7:EE:30:07] [E4:25:E7:EE:30:08] [E4:25:E7:EE:30:09] [E4:25:E7:EE:30:0A] 

***** Thanks, Comcast!    *****
      Free Wifi with MAC: 
      E4:25:E7:EE:30:0A 

[E4:25:E7:EE:30:0B] [E4:25:E7:EE:30:0C] [E4:25:E7:EE:30:0D] [E4:25:E7:EE:30:0E] [E4:25:E7:EE:30:0F] [E4:25:E7:EE:30:10] [E4:25:E7:EE:30:11] [E4:25:E7:EE:30:12] [E4:25:E7:EE:30:13] [E4:25:E7:EE:30:14] [E4:25:E7:EE:30:15] [E4:25:E7:EE:30:16] [E4:25:E7:EE:30:17] [E4:25:E7:EE:30:18] [E4:25:E7:EE:30:19]

...


