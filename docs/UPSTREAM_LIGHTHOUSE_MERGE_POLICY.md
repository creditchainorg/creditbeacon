Copyright (c) CreditChain Research Team
SPDX-License-Identifier: Apache-2.0

# Upstream Lighthouse Merge Policy

CreditChain Beacon should remain mergeable with upstream Lighthouse.

## Principles

- Keep consensus, networking, database, and API behavior close to upstream until
  CreditChain specs require a reviewed divergence.
- Prefer public branding and packaging changes over internal crate renames.
- Keep upstream license notices and technical attribution.
- Isolate CreditChain network specs in dedicated config directories.
- Avoid broad string replacement in protocol code.

## Merge Workflow

1. Import upstream Lighthouse changes into a staging branch.
2. Resolve conflicts in branding, packaging, and docs separately from consensus
   or protocol conflicts.
3. Run `cargo fmt --all`, `cargo check --workspace`, and targeted tests for
   touched crates.
4. Review all remaining `lighthouse`, `sigp`, and `Ethereum` references and
   classify them as attribution, compatibility, internal mergeability, protocol,
   test fixture, or future TODO.

## Divergence Rules

Any change to fork versions, genesis roots, deposit contract parameters,
fork schedules, BLS domains, gossip topics, ENR fork IDs, database keys,
slashing protection formats, signing roots, or Engine API semantics requires a
dedicated CreditChain consensus specification and review.
