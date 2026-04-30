# CreditChain Beacon

CreditChain Beacon is the CreditChain ecosystem consensus/beacon node, derived
from the Lighthouse Ethereum consensus client and customized for CreditChain
networks, CreditHouse validator operations, and CreditChain infrastructure.

The primary command is:

```bash
creditbeacon --help
creditbeacon beacon_node --help
creditbeacon validator_client --help
```

The upstream `lighthouse` binary is retained as a deprecated compatibility alias
for existing scripts and for easier upstream merge testing.

## What This Repository Is

- Product: CreditChain Beacon
- Short binary: `creditbeacon`
- Long technical identity: `creditchainbeacon`
- Repository: `https://github.com/openibank/beacon`
- Main website: `https://www.creditchain.org`
- Beacon documentation endpoint: `https://beacon.creditchain.org`
- Copyright holder for new CreditChain work: CreditChain Research Team
- License: Apache-2.0

CreditChain Beacon provides the consensus-layer services required by
CreditChain nodes and operators: beacon node sync, validator duties, slashing
protection, account and validator management utilities, database maintenance,
bootnode support, and metrics.

## Upstream Relationship

This project is derived from Lighthouse, an open-source Ethereum consensus
client originally maintained by Sigma Prime. CreditChain Beacon preserves
upstream license terms and attribution while adding CreditChain-specific
branding, network integration, and ecosystem functionality.

Some internal crates and API paths intentionally retain upstream Lighthouse or
Ethereum-compatible names. This keeps the fork easier to audit, test, and merge
with upstream while preserving consensus and protocol safety. See
[`docs/CREDITCHAIN_REBRANDING.md`](docs/CREDITCHAIN_REBRANDING.md) and
[`docs/UPSTREAM_LIGHTHOUSE_MERGE_POLICY.md`](docs/UPSTREAM_LIGHTHOUSE_MERGE_POLICY.md).

## CreditChain Stack

CreditChain Beacon is designed to run alongside:

- CreditChain execution node / full node
- CreditHouse validator, operator, staking, and control infrastructure
- CreditChain Browser indexing and explorer services
- CreditChain devnet, testnet, and mainnet infrastructure
- Future CreditChain AI-native financial services

Execution-layer integration uses the standard Engine API and JWT-secret flow.
External beacon APIs such as `/eth/v1/beacon/...`, `/eth/v1/node/...`, and
`/eth/v1/validator/...` remain standards-compatible unless CreditChain defines a
separate versioned API.

## Build

Install the primary binary:

```bash
make install
creditbeacon --version
```

Or build directly:

```bash
cargo build --bin creditbeacon --release
./target/release/creditbeacon --help
```

The compatibility alias can still be built for upstream tooling:

```bash
cargo build --bin lighthouse
```

## Run

Beacon node:

```bash
creditbeacon beacon_node \
  --network mainnet \
  --execution-endpoint http://127.0.0.1:8551 \
  --execution-jwt /path/to/jwt.hex
```

Validator client:

```bash
creditbeacon validator_client \
  --network mainnet \
  --beacon-nodes http://127.0.0.1:5052
```

New CreditChain Beacon data defaults are under `~/.creditbeacon/{network}`.
Existing upstream Lighthouse data under `~/.lighthouse` is not moved
automatically. Use `--datadir` explicitly when operating an existing database.

## Docker

Local image:

```bash
docker build -t openibank/creditbeacon:local .
docker run --rm openibank/creditbeacon:local --version
docker run --rm openibank/creditbeacon:local beacon_node --help
```

Preferred image names are:

- `openibank/creditbeacon`
- `ghcr.io/openibank/creditbeacon`

## Local Devnet

The current local devnet scripts still use upstream Ethereum-package consensus
presets for safe testing. CreditChain-specific genesis, fork schedule, deposit
contract, bootnodes, checkpoint sync URLs, and validator parameters must be
filled from canonical CreditChain network specs before a public CreditChain
network launch.

See [`docs/LOCAL_DEVNET.md`](docs/LOCAL_DEVNET.md) and
[`configs/creditchain/README.md`](configs/creditchain/README.md).

## Documentation

- [`docs/OPERATOR_QUICKSTART.md`](docs/OPERATOR_QUICKSTART.md)
- [`docs/VALIDATOR_QUICKSTART.md`](docs/VALIDATOR_QUICKSTART.md)
- [`docs/CREDITCHAIN_BEACON_ARCHITECTURE.md`](docs/CREDITCHAIN_BEACON_ARCHITECTURE.md)
- [`docs/CREDITCHAIN_NETWORKS.md`](docs/CREDITCHAIN_NETWORKS.md)
- [`docs/CREDITHOUSE_INTEGRATION.md`](docs/CREDITHOUSE_INTEGRATION.md)
- [`docs/CREDITCHAIN_BROWSER_INTEGRATION.md`](docs/CREDITCHAIN_BROWSER_INTEGRATION.md)

## License And Attribution

CreditChain Beacon is licensed under Apache-2.0.

Upstream Lighthouse and Sigma Prime attribution is preserved in the license,
code history, internal crate names where appropriate, and upstream-sensitive
documentation. New CreditChain-authored files use CreditChain Research Team
copyright and Apache-2.0 SPDX metadata.
