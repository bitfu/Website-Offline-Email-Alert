#!/bin/sh

# Website Offline Email Alert script by bitfu
# https://keybase.io/bitfu
# https://twitter.com/bitfu_
# https://github.com/bitfu

# A configurable script to regularly test availability of a Website/HTTP resource and send an email alert if it goes offline.

# Requirements:
# 1) Mail installed/configured
# 2) Curl
# 3) Edit variables throughout script to preferred settings


# Begin Script:

# Set email address and message

SUBJECT="*** RESOURCE OFFLINE ***"
EMAIL="email_address_to_send_alert_to@domain.com"
EMAILMESSAGE="DOWNLOAD ERROR = DO SOMETHING!"


# Set URL(s) to test, uncomment/add more where required

url1="http://insert_address_1_here/samplepage.htm"
#url2="http://insert_address_2_here/samplepage.htm"
#url3="http://insert_address_3_here/samplepage.htm"


while :
do

function check {
     if [ $? -ne 0 ] ; then
         mail -s "$SUBJECT" "$EMAIL" < $EMAILMESSAGE
         exit 1
     fi

}


# Add/Uncomment lines to match number of URL's being tested above

echo Testing URL1: $url1
curl -s -o "/dev/null" $url1
check;

#echo Testing URL2: $url2
#curl -s -o "/dev/null" $url2
#check;

#echo Testing URL3: $url3
#curl -s -o "/dev/null" $url3
#check;


# Set time to wait (in seconds) before retesting URL(s)

sleep 120
done
