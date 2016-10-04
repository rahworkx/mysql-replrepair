# mysql-replrepair
Bash script to repair mysql replication due to duplicate entries error or key not found error

I've utilized this script when repairing replication on a mysql slave that isn't in production that has failed replicating.

The three conditions are as follows:

1. Seconds Behind Master = Null

2. Last Error known = Duplicate Entry

3. Last Error known = Key not found

This script should ouly be used after mysql db has been restored and the original error should be diagnosed before using this script. 
Use at your own risk :) 


