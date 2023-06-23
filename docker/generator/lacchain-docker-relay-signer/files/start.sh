#!/bin/sh
/opt/lacchain/gas-relay-signer/gas-relay-signer . & 
sleep 3
tail -f  /opt/lacchain/gas-relay-signer/log/idbServiceLog.log > /proc/1/fd/1