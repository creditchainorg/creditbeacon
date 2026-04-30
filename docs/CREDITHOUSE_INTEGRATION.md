Copyright (c) CreditChain Research Team
SPDX-License-Identifier: Apache-2.0

# CreditHouse Integration

CreditHouse is expected to orchestrate validator and operator workflows around
CreditChain Beacon.

## Integration Points

- validator key import, creation, and lifecycle management
- validator client HTTP API access and token handling
- slashing protection import/export and backup policy
- validator status, duty, and performance monitoring
- staking and institutional operator dashboards
- safe voluntary exits and validator movement workflows

## Current Boundary

CreditChain Beacon exposes the inherited validator client APIs and CLI tools.
CreditHouse should treat those APIs as operational integration points while
CreditChain-native API namespaces are designed.
