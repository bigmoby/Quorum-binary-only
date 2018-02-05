#!/bin/bash
set -u
set -e

GLOBAL_ARGS="--raft --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --emitcheckpoints"

echo "[*] Starting Constellation nodes"
nohup constellation-node home/workspace/example/7nodes/tm1.conf 2>> home/workspace/example/7nodes/qdata/logs/constellation1.log &

sleep 1

echo "[*] Starting node 1 (permissioned)"
PRIVATE_CONFIG=home/workspace/example/7nodes/tm1.conf nohup geth --datadir home/workspace/example/7nodes/qdata/dd1 $GLOBAL_ARGS --permissioned --raftport 50401 --rpcport 22000 --port 21000 --unlock 0 --password home/workspace/example/7nodes/passwords.txt 2>>home/workspace/example/7nodes/qdata/logs/1.log &

echo "[*] Waiting for nodes to start"
sleep 10
echo "[*] Sending first transaction"
PRIVATE_CONFIG=home/workspace/example/7nodes/tm1.conf geth attach ipc:home/workspace/example/7nodes/qdata/dd1/geth.ipc

echo "All nodes configured. See 'qdata/logs' for logs, and run e.g. 'geth attach qdata/dd1/geth.ipc' to attach to the first Geth node"
