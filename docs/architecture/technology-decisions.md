# AgentOps AI — Technology Decisions

**Status:** Working technical baseline. Selections do not imply deployment.

| Area | Decision | Reason / trade-off | Status |
|---|---|---|---|
| Backend | Java 21; Spring Boot 3.2.5; multi-module Gradle | Enterprise experience and modular architecture | Selected |
| Frontend | React and TypeScript | Full-stack portfolio alignment | Selected |
| API | REST first; gRPC later | Simpler first milestone; retain future RPC demonstration | Selected |
| Persistence | PostgreSQL; Spring Data JPA/Hibernate | Relational domain modeling and standard ORM | Selected |
| Schema migrations | Liquibase | Auditable database changes | Selected |
| Database client | DBeaver | Local database inspection | Selected |
| Identity | Keycloak, OIDC/SSO | Self-hostable identity and role management | Selected |
| Messaging | Apache Kafka | Event-driven design and workplace-relevant practice | Selected |
| Scheduling | Kestra plus Spring Batch | Workflow orchestration and batch execution | Selected |
| Observability | OpenTelemetry, Prometheus, Grafana, Tempo | Traces, metrics, and dashboards | Selected |
| Local runtime | Docker Compose | Low-cost reproducible environment | Selected |
| Infrastructure | Terraform and OCI | Infrastructure-as-code and free-tier-first experimentation | In progress; VM blocked |
| CI/CD | GitHub Actions | Repository-native automation and safety gates | Workflow implemented; deployment unsuccessful |
| Secrets | Vault and environment-specific configuration | Reduce hardcoded credentials | Planned; implementation unverified |
| Edge/DNS | Cloudflare | DNS flexibility | Configuration needs independent validation |

## Constraints
- Prefer free or no-subscription development tools.
- Development machine is Apple Silicon with approximately 24 GB RAM.
- Cloud demo should be activatable on demand, rather than always on.
- OCI Always Free capacity is not guaranteed; do not equate a successful plan with deployment.

## Deferred decisions
Specific module boundaries, cloud fallback provider, cost ceilings, persistent cloud data strategy, Kafka local resource sizing, and gRPC rollout need dedicated ADRs.
