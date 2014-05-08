#!/bin/sh
PATH=$PATH:/usr/local/bin:/usr/bin:/bin
TOKEN=$(cat ~/.github/oauth_token)
if ! curl -s -u $TOKEN:x-oauth-basic https://api.github.com/users/Terminus-IMRC/events|egrep 'created_at|updated_at' | cut -d: -f2- | tr -d ' ",' | cut -dT -f1 | grep -q "^$(date '+%Y-%m-%d')$"; then
	echo You have NO progress on GitHub today
	exit 1
else
	echo Nice progress
	exit 0
fi
