#!/bin/bash
logfile=~/repl-watch.log
while true; do
    status=$(mysql --execute="show slave status\G"|grep "Seconds_Behind_Master:"|awk '{print $2}')
    dup_err=$(mysql --execute="show slave status\G"|grep "Last_SQL_Error:"|grep -oh 'Duplicate')
    delete_err=$(mysql --execute="show slave status\G"|grep "Last_SQL_Error:"|grep -oh 'HA_ERR_KEY_NOT_FOUND')
    if [[ $status == "NULL" || $dup_err == "Duplicate" || $delete_err == "HA_ERR_KEY_NOT_FOUND"  ]]; then
        mysql --execute="show slave status\G" | grep "Last_SQL_Error:" | tee -a $logfile
        mysql --execute="set global sql_slave_skip_counter=1; start slave;"
    fi
    sleep 1
done
