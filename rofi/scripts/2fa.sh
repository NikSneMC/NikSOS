#!/usr/bin/env bash

if [ -z "$1" ]
then
	accts=$( ls -1 $HOME/.2fa )
	echo -en "\0no-custom\x1ftrue\n"
	echo -en "$accts\n"
	exit 0
fi

if ! [ -f "$HOME/.2fa/$1" ]
then
	notify-send "No 2FA secret found for $1"
	exit 1
fi

# capture stdout (code), stderr (any oathtool error), and exit code
eval "$({ reserr=$({ res=$(cat "$HOME/.2fa/$1" | oathtool --totp -b - ); resret=$?; } 2>&1; declare -p res resret >&2); declare -p reserr; } 2>&1)"


if [ $resret -ne 0 ]
then
	notify-send "oath error: $reserr"
	exit 1
fi

notify-send "Copied token for $1!"
wl-copy $res
exit 0
