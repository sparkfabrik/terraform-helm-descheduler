# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres
to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
