#!/bin/sh

OS_NAME=`uname -s`
BASE=`dirname $0`

if [ $OS_NAME != "Darwin" ]; then
	echo "chorus only runs on MacOS"
	exit 1
fi

SERF=`which serf`
if [ -z "$SERF" ]; then
	echo "You don't have serf installed, I'll try to fetch it for you..."
	
	WGET=`which wget`
	if [ -z "$WGET" ]; then
		echo "You don't have wget installed, I'll try to fetch it for you..."
		
		BREW=`which brew`
		if [ -z "$BREW" ]; then
			echo "You don't have home brew installed, what is wrong with you?"
			echo "I give up! You have to either install serf by hand or home brew:"
			echo "\thttp://www.serfdom.io/downloads.html"
			echo "\thttp://brew.sh/"
			exit 1
		fi
		
		$BREW install wget
		WGET=`which wget`
		if [ -z "$WGET" ]; then
			echo "wget installation failed!"
			exit 1
		fi
	fi
	
	$WGET -q https://dl.bintray.com/mitchellh/serf/0.6.3_darwin_amd64.zip
	unzip 0.6.3_darwin_amd64.zip
	SERF="$BASE/serf"
fi

exec $SERF agent -discover=chorus -event-handler user:say=$BASE/chorus.sh
