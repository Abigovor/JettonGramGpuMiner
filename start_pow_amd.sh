#!/bin/bash
npm install


while true; do
  node send_pow.js --api tonapi --bin ./pow-miner-opencl
  sleep 1;
done;
