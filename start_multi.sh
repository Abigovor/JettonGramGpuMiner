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
  script="send_multigpu_meridian.js"
else
  script="send_multigpu.js"
fi

if [ "$5" ]; then
  gpu=$5
else
  gpu=$(nvidia-smi --query-gpu=name --format=csv,noheader | wc -l)
fi

echo "run ${script} gpu ${gpu}"

npm install


while true; do
  node ${script} --api ${api} --bin ${minerPath}/pow-miner-cuda --givers ${givers} --timeout ${timeout} --gpu-count ${gpu}
  sleep 1;
done;
