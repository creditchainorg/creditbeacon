Copyright (c) CreditChain Research Team
SPDX-License-Identifier: Apache-2.0

# CreditChain Networks

CreditChain Beacon is expected to support these CreditChain networks:

- local
- devnet
- testnet
- mainnet

Network placeholders live under `configs/creditchain/`. They are intentionally
documentation-only until canonical CreditChain specs are published.

## Required Canonical Inputs

Each network must define:

- genesis state and genesis validators root
- fork schedule and fork versions
- deposit contract address, deploy block, and chain ID
- bootnodes and trusted checkpoint sync endpoints
- execution endpoint defaults for CreditChain execution nodes
- validator parameter policy
- ENR metadata and any CreditChain-specific network identity

Do not infer these values from upstream Ethereum networks.
