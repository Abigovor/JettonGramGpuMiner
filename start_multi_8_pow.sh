#!/bin/bash
npm install


while true; do
  node send_multigpu_pow.js --api tonapi --bin ./pow-miner-cuda --gpu-count 8
  sleep 1;
done;
