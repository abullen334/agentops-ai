# Evidence Handling Guide

This folder indexes the records used to substantiate AgentOps AI implementation claims.

## Principles
- Prefer commit SHAs, workflow run IDs, timestamps, command outputs, and redacted inventory exports.
- Separate **OBSERVED**, **REPORTED**, **DECIDED**, **FAILED**, and **PENDING VERIFICATION**.
- A successful dry run is not a successful deployment.
- Never commit OCI API keys, secrets, Terraform state, private SSH keys, tokens, sensitive identifiers, or raw logs without review.

## Source materials
The documentation package was prepared from supplied Git history exports, workflow metadata, six selected job logs, the existing infrastructure audit log, and explicit project-owner confirmation of zero VMs. These source artifacts are **not embedded** in the package because they may contain sensitive configuration.

## Suggested evidence collection
Store sanitized exports in a controlled location, then link or hash them from [evidence-index.md](evidence-index.md). Capture both the command used and UTC collection time.

## Outstanding verification
Independent OCI inventory, current Terraform state, and a fresh repository source review remain open.
