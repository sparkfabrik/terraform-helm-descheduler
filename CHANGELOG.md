# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres
to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.4.0] - 2026-11-03

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-descheduler/compare/0.3.0...0.4.0)

### Added

- Add `topology_spread_constraints` variable to balance `ScheduleAnyway` topology spread constraints too.
- Add `node_fit` variable to evict a pod only when it fits on another node.
- Add `max_pods_to_evict_per_node` variable to limit evictions per node in each run.

### Changed

- **Breaking:** render the descheduler policy with the `descheduler/v1alpha2` API, required by descheduler 0.31.0 and later. The module now requires chart 0.27.0 or later.
- Update the default chart version to 0.35.1. Chart 0.35.1 also sets default resource limits (500m CPU, 256Mi memory).
- Keep the previous eviction protections: pods with local storage stay protected and pods with PVCs stay evictable, unlike the chart 0.35.1 defaults.

### Fixed

- Render all `commonLabels` entries: only the last label was applied when more than one was set.

## [0.3.0] - 2024-06-05

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-descheduler/compare/0.2.0...0.3.0)

### Added

- Add `resources.requests.cpu` and `resources.requests.memory` default values in the Helm chart values.

## [0.2.0] - 2024-05-16

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-descheduler/compare/0.1.0...0.2.0)

### Added

- Add `ServiceMonitor` configuration for Prometheus.
- Add `additional_values` variable to allow customizing the Helm chart values.

## [0.1.0] - 2024-05-15

- First release.
