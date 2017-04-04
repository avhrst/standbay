#!/bin/sh

### set orahome ###
# Oracle
ORACLE_BASE=/u01/app/oracle; export ORACLE_BASE
ORACLE_HOME=$ORACLE_BASE/product/11.2.0/dbhome_1; export ORACLE_HOME
ORACLE_SID=orcl; export ORACLE_SID


PATH=$PATH:$HOME/bin; export PATH
PATH=$PATH:$ORACLE_HOME/bin; export PATH

export NLS_LANG=AMERICAN_AMERICA.AL32UTF8

cd /home/oracle/standbay

rman  target / @s1.rman;
sqlplus / as sysdba @s2.sql;
rman target sys/***@master auxiliary / @s3.rman;
