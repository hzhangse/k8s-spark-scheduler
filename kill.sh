kill -9 `ps -ef|grep debug|grep -v 'grep' | awk '{print $2}'`
sleep 1s