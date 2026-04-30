Copyright (c) CreditChain Research Team
SPDX-License-Identifier: Apache-2.0

# Operator Quickstart

Build CreditChain Beacon:

```bash
make install
creditbeacon --version
```

Run a beacon node with a CreditChain execution endpoint:

```bash
creditbeacon beacon_node \
  --network mainnet \
  --execution-endpoint http://127.0.0.1:8551 \
  --execution-jwt /etc/creditbeacon/jwt.hex \
  --datadir /var/lib/creditbeacon
```

For existing Lighthouse-derived data, pass the old data directory explicitly:

```bash
creditbeacon beacon_node --datadir ~/.lighthouse/mainnet
```

CreditChain canonical network specs are required before public devnet, testnet,
or mainnet operation.
