Copyright (c) CreditChain Research Team
SPDX-License-Identifier: Apache-2.0

# CreditChain Beacon Architecture

CreditChain Beacon keeps the upstream Lighthouse architecture and layers
CreditChain identity, packaging, and network configuration around it.

## Major Components

- `creditbeacon beacon_node`: consensus sync, fork choice, networking, HTTP API,
  execution-layer Engine API integration, storage, and metrics.
- `creditbeacon validator_client`: validator duties, signing, fallback beacon
  nodes, slashing protection, builder proposal configuration, and monitoring.
- `creditbeacon account`: validator key, wallet, and slashing protection tools.
- `creditbeacon validator-manager`: validator lifecycle operations through the
  validator client HTTP API.
- `creditbeacon database_manager`: schema inspection, migration, pruning, and
  compaction utilities.
- `creditbeacon boot_node`: discv5 bootnode process for network discovery.

## Upstream-Sensitive Core

The consensus core remains Lighthouse-derived and Ethereum-compatible until
canonical CreditChain consensus specs are added. Do not modify fork-choice,
SSZ containers, fork digest calculation, BLS domains, ENR fork IDs, or database
schema keys as part of branding work.

## CreditChain Integration Layer

CreditChain-specific work should enter through explicit configuration and
documentation first:

- network configs under `configs/creditchain/`
- operator docs under `docs/`
- Docker and release image names
- CreditHouse and CreditChain Browser ingestion contracts
- future additive `/creditchain/v1/...` API endpoints
