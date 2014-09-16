#!/bin/sh

URL="http://www.serfdom.io/downloads.html"

SERF=`which serf`
if [ -z "$SERF" ]; then
	echo "You don't have serf installed, go to $URL and download it..."
	exit 1
fi

BASE=`dirname $0`
serf agent -discover=chorus -event-handler user:say=$BASE/chorus.sh
