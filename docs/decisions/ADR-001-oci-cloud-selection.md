# ADR-001 — Select OCI as Initial Cloud Deployment Target

- **Status:** Accepted for initial evaluation; compute deployment blocked
- **Decision date:** Exact date not independently established
- **Reviewed:** 2026-10-28

## Context
AgentOps AI needs a low-cost, remotely accessible demonstration environment with infrastructure as code and CI/CD. The project prefers free tiers and on-demand activation rather than paying for an always-running deployment.

## Decision
Use **Oracle Cloud Infrastructure (OCI), US East (Ashburn)** as the initial cloud target. Manage infrastructure through Terraform and a manually gated GitHub Actions workflow. Keep local development viable independently of cloud compute.

## Rationale
OCI Always Free A1 Flex was considered a plausible low-cost target for an ARM-compatible application demonstration. Terraform and GitHub Actions provide portable infrastructure and deployment practices.

## Alternatives considered
- Local Docker Compose only: reliable for development, but not a public remote demonstration.
- Other free-tier cloud offerings: possible fallback; provider, limits, cost and account eligibility not yet evaluated in a formal comparison.
- Paid VM hosting: more predictable availability but conflicts with the no-subscription preference.

## Consequences
**Positive:** Infrastructure automation experience, isolated OCI environment, potential low operating cost.  
**Negative:** Free-tier host capacity is not guaranteed; ARM architecture and OCI IAM/networking add operational constraints.

## Current evidence and status
OCI A1 Flex launch attempts returned `500-InternalError, Out of host capacity`. **No VM was created**, manually or through GitHub Actions. Cloud provisioning is paused; this ADR does not assert that an application has been deployed.

## Revisit when
OCI capacity becomes available, a validated fallback is selected, or cloud costs change materially.
