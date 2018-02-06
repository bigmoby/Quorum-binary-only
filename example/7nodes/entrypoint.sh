#!/bin/bash
set -e

/bin/bash -c "source /home/workspace/example/7nodes/raft-init.sh"
sleep 10
/bin/bash -c "source /home/workspace/example/7nodes/raft-start.sh"
