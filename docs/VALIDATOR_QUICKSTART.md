Copyright (c) CreditChain Research Team
SPDX-License-Identifier: Apache-2.0

# Validator Quickstart

Start a validator client against a local beacon node:

```bash
creditbeacon validator_client \
  --network mainnet \
  --beacon-nodes http://127.0.0.1:5052 \
  --datadir /var/lib/creditbeacon
```

Manage validator accounts:

```bash
creditbeacon account --help
creditbeacon account validator --help
creditbeacon validator-manager --help
```

CreditHouse integrations should use validator client HTTP APIs, API-token
handling, and slashing protection import/export until CreditChain-native control
APIs are introduced.
