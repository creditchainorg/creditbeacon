Copyright (c) CreditChain Research Team
SPDX-License-Identifier: Apache-2.0

# CreditChain Beacon Rebranding

CreditChain Beacon is the CreditChain-branded consensus/beacon node derived from
upstream Lighthouse. This rebrand is intentionally layered so that public
operator-facing identity changes without corrupting consensus-critical or
protocol-compatible behavior.

## Applied Public Identity

- Human product name: CreditChain Beacon
- Primary binary: `creditbeacon`
- Compatibility binary: `lighthouse`
- Repository: `https://github.com/openibank/beacon`
- Website: `https://www.creditchain.org`
- Beacon docs endpoint: `https://beacon.creditchain.org`
- New data root: `~/.creditbeacon/{network}`
- Docker image target: `openibank/creditbeacon`

## Deliberately Retained Upstream Names

Some internal crates retain upstream Lighthouse names temporarily, including
`lighthouse_version`, `lighthouse_network`, and `lighthouse_validator_store`.
This reduces churn and keeps upstream merges reviewable.

The following names are also retained unless CreditChain publishes a deliberate
compatibility plan:

- REST API paths such as `/eth/v1/beacon/...`, `/eth/v1/node/...`,
  `/eth/v1/validator/...`, and existing `/lighthouse/...` extension endpoints.
- Ethereum-compatible SSZ, BLS, Engine API, and fork-choice terminology.
- Database schema keys and migration identifiers.
- Fork versions, fork digests, domain constants, genesis roots, and deposit
  contract settings.
- Slashing protection interchange formats.

## Future Cleanup Points

- Rename internal crates only after measuring upstream merge cost.
- Add CreditChain-native API namespaces such as `/creditchain/v1/node/version`
  after the API compatibility policy is approved.
- Add a guided migration from `~/.lighthouse` to `~/.creditbeacon` if existing
  operator data must be moved automatically.
