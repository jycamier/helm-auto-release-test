# Changelog

## [0.1.1](https://github.com/jycamier/helm-auto-release-test/compare/base-chart-2-v0.1.0...base-chart-2-v0.1.1) (2022-06-19)


### Features

* **autoscaling:** maxReplicas default to 200 ([#20](https://github.com/jycamier/helm-auto-release-test/issues/20)) ([88d34b7](https://github.com/jycamier/helm-auto-release-test/commit/88d34b73bc824002e338f1678ad0ecf00d74ea4d))
* **ingress:** add nginx annotations ([#22](https://github.com/jycamier/helm-auto-release-test/issues/22)) ([2c8b2be](https://github.com/jycamier/helm-auto-release-test/commit/2c8b2be4638f457b94736ac100686118879aded9))

## [0.1.0](https://github.com/jycamier/helm-auto-release-test/compare/base-chart-2-v0.0.1...base-chart-2-v0.1.0) (2022-06-14)


### ⚠ BREAKING CHANGES

* HPA is enabled by default so be carefull about your fpm metrics

### Features

* HPA is enabled by default ([#17](https://github.com/jycamier/helm-auto-release-test/issues/17)) ([5f006d2](https://github.com/jycamier/helm-auto-release-test/commit/5f006d28eb7566751efd5cdcd07a1fc21477377a))
* update request CPU to 200m ([#14](https://github.com/jycamier/helm-auto-release-test/issues/14)) ([2a13bb4](https://github.com/jycamier/helm-auto-release-test/commit/2a13bb4e5f7cec84b32cc9b1f42f5fabb8f69492))

## 0.0.1 (2022-06-12)


### Features

* **autoscaling:** increase minReplicas to 10 ([#8](https://github.com/jycamier/helm-auto-release-test/issues/8)) ([e2b7c4b](https://github.com/jycamier/helm-auto-release-test/commit/e2b7c4bb7c7d7bc53d841f477b4e068d06f82405))
* set default request and limit ([#11](https://github.com/jycamier/helm-auto-release-test/issues/11)) ([12d48f3](https://github.com/jycamier/helm-auto-release-test/commit/12d48f33090daeac9195c24974354d688be9d1df))
