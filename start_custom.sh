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
  echo "Use send_meridian.js"
  script="send_meridian.js"
else
  echo "Use send_universal.js"
  script="send_universal.js"
fi

npm install


while true; do
  node ${script} --api ${api} --bin ${minerPath}/pow-miner-cuda --givers ${givers} --timeout ${timeout}
  sleep 1;
done;
