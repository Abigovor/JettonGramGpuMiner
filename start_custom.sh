#!/bin/bash

api="tonapi"
timeout=5
givers=1000
minerPath="."

if [ -n "$1" ]; then
  api=$1
fi

if [ "$2" ]; then
  timeout=$2
fi

if [ "$3" ]; then
  givers=$3
fi

if [ "$4" = "mrdn" ]; then
  script="send_meridian.js"
else
  script="send_universal.js"
fi

echo "run ${script}"

npm install


while true; do
  node ${script} --api ${api} --bin ${minerPath}/pow-miner-cuda --givers ${givers} --timeout ${timeout}
  sleep 1;
done;
