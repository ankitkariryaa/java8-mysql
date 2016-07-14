#!/bin/sh
#
# Simple script that concatenates all locally found .sql files into
# one sql file, which can be used to update the local database.
#
# Command that should be executed like:
# mysql --default_character_set utf8 -u $user -p <data.sql
#

rm -f ./data.sql
cat *.sql >data.sql
