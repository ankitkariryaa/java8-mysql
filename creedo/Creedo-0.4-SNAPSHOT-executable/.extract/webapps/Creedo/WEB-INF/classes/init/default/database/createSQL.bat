REM Simple script that concatenates all locally found .sql files into
REM one sql file, which can be used to update the local database.
REM
REM Command that should be executed like:
REM mysql --default_character_set utf8 -u username -p <data.sql

SET OutputFile="data.sql"
IF EXIST %OutputFile% del /F %OutputFile%
copy /b *.sql >> data.sql
