
FLAG_FILE="/home/tmp/flagfile"
service="[.]/bin/bash ./myscript.sh"
read -p 'Enter your mail id : ' email
while [ ! -f "${FLAG_FILE}" ]
do
if ps -ef | grep "[l]ivestream.sh"; then
        echo "Service is running"
else
        touch "$FLAG_FILE"
        echo "Sending notification"
        echo " My process stopped.......!" | mail -s "Service has stopped!" $email
fi
sleep 5
done
rm FLAG_FILE
