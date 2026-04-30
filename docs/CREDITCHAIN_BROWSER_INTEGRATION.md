Copyright (c) CreditChain Research Team
SPDX-License-Identifier: Apache-2.0

# CreditChain Browser Integration

CreditChain Browser should index CreditChain Beacon data for explorer and
operator visibility.

## Candidate Data

- beacon blocks, slots, epochs, and finality checkpoints
- validator registry and validator status
- proposer and attestation duties
- aggregate and attestation inclusion data
- sync committee data where applicable
- node sync status and peer health
- execution payload references for joining with execution-chain data

## API Policy

Standards-compatible `/eth/v1/...` beacon APIs remain available. CreditChain
Browser-specific ingestion should prefer additive CreditChain APIs only after
they are versioned and documented.
