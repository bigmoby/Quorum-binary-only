#!/bin/bash
set -u
set -e

echo "[*] Cleaning up temporary data directories"
rm -rf home/workspace/example/7nodes/qdata
mkdir -p home/workspace/example/7nodes/qdata/logs

echo "[*] Configuring node 1 (permissioned)"
mkdir -p qdata/dd1/{keystore,geth}
cp home/workspace/example/7nodes/permissioned-nodes.json home/workspace/example/7nodes/qdata/dd1/static-nodes.json
cp home/workspace/example/7nodes/permissioned-nodes.json home/workspace/example/7nodes/qdata/dd1/
cp home/workspace/example/7nodes/keys/key1 home/workspace/example/7nodes/qdata/dd1/keystore
cp raft/nodekey1 qdata/dd1/geth/nodekey
geth --datadir home/workspace/example/7nodes/qdata/dd1 init home/workspace/example/7nodes/genesis.json
