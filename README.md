<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://www.openlogix.org/brand/readme/openlogix-dark.svg">
  <img alt="Open Logix website" src="https://www.openlogix.org/brand/readme/openlogix-light.svg" height="96">
</picture>

<br>

[![License: MIT or Apache 2.0](https://img.shields.io/badge/License-MIT%20or%20Apache%202.0-blue)](LICENSE-MIT)

[![site](https://img.shields.io/github/actions/workflow/status/openlogix/openlogix.github.io/pages%2Fpages-build-deployment?branch=main&label=site)](https://github.com/openlogix/openlogix.github.io/actions/workflows/pages/pages-build-deployment)

Source for **[www.openlogix.org](https://www.openlogix.org)**, the home page of Open Logix: free, open source tools for FPGA design.

The site is static HTML in [`docs/`](docs/), published with GitHub Pages: the home page, one page per product (e.g. [`docs/ide/`](docs/ide/) at [www.openlogix.org/ide/](https://www.openlogix.org/ide/); also `engine`, `ai`, `cli`, `vscode`, `studio` and `remote`), and one shared stylesheet, [`docs/assets/site.css`](docs/assets/site.css). Brand assets (logo and product icons) are in [`docs/brand/`](docs/brand/).

## Status

Every Open Logix repo's workflows, by their latest daily run on `main` (the site, by its latest deploy): green is passing, red is broken. Daily runs catch a break from GitHub's runners or an upstream tool even when nothing changed.

| Repo | Workflows |
| --- | --- |
| [logix-engine](https://github.com/openlogix/logix-engine) | [![engine-test](https://img.shields.io/github/actions/workflow/status/openlogix/logix-engine/test.yaml?branch=main&event=schedule&label=engine-test)](https://github.com/openlogix/logix-engine/actions/workflows/test.yaml) [![engine-build](https://img.shields.io/github/actions/workflow/status/openlogix/logix-engine/build-pre-release.yaml?branch=main&event=schedule&label=engine-build)](https://github.com/openlogix/logix-engine/actions/workflows/build-pre-release.yaml) [![engine-docs](https://img.shields.io/github/actions/workflow/status/openlogix/logix-engine/publish-docs.yaml?branch=main&event=schedule&label=engine-docs)](https://github.com/openlogix/logix-engine/actions/workflows/publish-docs.yaml) |
| [logix-ide](https://github.com/openlogix/logix-ide) | [![ide-test](https://img.shields.io/github/actions/workflow/status/openlogix/logix-ide/test.yaml?branch=main&event=schedule&label=ide-test)](https://github.com/openlogix/logix-ide/actions/workflows/test.yaml) [![ide-build](https://img.shields.io/github/actions/workflow/status/openlogix/logix-ide/build-pre-release.yaml?branch=main&event=schedule&label=ide-build)](https://github.com/openlogix/logix-ide/actions/workflows/build-pre-release.yaml) [![ide-docs](https://img.shields.io/github/actions/workflow/status/openlogix/logix-ide/publish-docs.yaml?branch=main&event=schedule&label=ide-docs)](https://github.com/openlogix/logix-ide/actions/workflows/publish-docs.yaml) |
| [logix-catalog](https://github.com/openlogix/logix-catalog) | [![catalog-test](https://img.shields.io/github/actions/workflow/status/openlogix/logix-catalog/test.yaml?branch=main&event=schedule&label=catalog-test)](https://github.com/openlogix/logix-catalog/actions/workflows/test.yaml) [![catalog-build](https://img.shields.io/github/actions/workflow/status/openlogix/logix-catalog/build-pre-release.yaml?branch=main&event=schedule&label=catalog-build)](https://github.com/openlogix/logix-catalog/actions/workflows/build-pre-release.yaml) [![catalog-docs](https://img.shields.io/github/actions/workflow/status/openlogix/logix-catalog/publish-docs.yaml?branch=main&event=schedule&label=catalog-docs)](https://github.com/openlogix/logix-catalog/actions/workflows/publish-docs.yaml) |
| [logix-core](https://github.com/openlogix/logix-core) | [![core-build](https://img.shields.io/github/actions/workflow/status/openlogix/logix-core/build-pre-release.yaml?branch=main&event=schedule&label=core-build)](https://github.com/openlogix/logix-core/actions/workflows/build-pre-release.yaml) |
| [.github](https://github.com/openlogix/.github) | [![actions-test](https://img.shields.io/github/actions/workflow/status/openlogix/.github/actions-test.yaml?branch=main&event=schedule&label=actions-test)](https://github.com/openlogix/.github/actions/workflows/actions-test.yaml) |
| [openlogix.github.io](https://github.com/openlogix/openlogix.github.io) | [![site](https://img.shields.io/github/actions/workflow/status/openlogix/openlogix.github.io/pages%2Fpages-build-deployment?branch=main&label=site)](https://github.com/openlogix/openlogix.github.io/actions/workflows/pages/pages-build-deployment) |

To preview locally, run `./view.sh`. It serves the site at http://localhost:8000 and opens your browser.

Licensed under [MIT](LICENSE-MIT) or [Apache 2.0](LICENSE-APACHE), at your option.
