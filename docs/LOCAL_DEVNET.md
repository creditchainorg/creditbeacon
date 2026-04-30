Copyright (c) CreditChain Research Team
SPDX-License-Identifier: Apache-2.0

# Local Devnet

The current local testnet scripts are inherited from upstream Lighthouse and use
Ethereum-package presets for safe local testing.

Build and run the local image:

```bash
docker build --build-arg FEATURES=portable,spec-minimal -t creditbeacon:local .
./scripts/local_testnet/start_local_testnet.sh
```

The `cl_type` may remain `lighthouse` in Ethereum-package configuration because
that package knows how to launch Lighthouse-compatible consensus clients. The
image and binary exposed by this repository are CreditChain Beacon.

Before a CreditChain devnet is public, replace placeholder values with canonical
CreditChain genesis, fork schedule, deposit contract, bootnodes, checkpoint sync
URLs, and validator parameters.
