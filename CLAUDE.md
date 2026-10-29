# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

The main website for the Open Logix organization, a static GitHub Pages site served at `www.openlogix.org`. Right now it is only a placeholder.

## About Open Logix

Open Logix builds easy-to-use open source tools for FPGA design. Site content should present these projects as one ecosystem:

- **Logix Engine** is the core of the ecosystem. It is an MCP backend that gives frontends FPGA services: building, testing, simulation, verification, and programming. Every other project runs on top of it.
- Frontends, each serving a different level of design and implementation:
  - **Logix IDE**: an Arduino-like experience for FPGAs.
  - **Logix CLI**: a command-line tool, similar to Apio.
  - **Logix VSCode**: an extension for VS Code.
  - **Logix Studio**: a graphical, schematic-based design tool.
  - **Logix Remote**: a network adapter for remote FPGA development.
  - **Logix AI**: a set of AI agents that design, program, and test FPGAs.

## Org principles

Every Open Logix product follows these principles. Site content should reflect them consistently:

- **Easy:** products are intuitive and easy to install and use.
- **Self-contained:** products bundle everything they need, so users never have to install a toolchain separately.
- **Cross-platform:** products support macOS (ARM), Windows (x64), and Linux (x64).
- **Generous license:** the license allows a wide range of adaptations, provided adapted versions don't use the Logix name.
- **Spec-driven:** each product is built from a detailed AI specification. This makes changes, adaptations, and new features quick and low-effort.
- **Quality:** products have extensive automated tests and automated builds on GitHub.
- **AI-native engine:** Logix Engine is MCP-compatible. Off-the-shelf AI systems can use it to generate code and testbenches, then lint, build, simulate, and program the FPGA, with no other software needed.

## Layout

- `docs/` is the published site root. GitHub Pages is set to serve from the `docs/` folder on `main`, not the repo root. Put all site content here.
- `docs/CNAME` holds the custom domain (`www.openlogix.org`). It must stay inside `docs/`: a `CNAME` at the repo root is ignored by this Pages setup. Git history shows earlier attempts that put it at the root before it was moved. Changing or deleting this file changes or breaks the custom domain.
- `docs/index.html` is the landing page. It currently holds only placeholder text.

## Build / deploy

There is no build step, package manager, linter, or test suite. Pushing to `main` deploys the site. To preview locally, serve `docs/` with any static file server, for example:

```
python3 -m http.server -d docs 8000
```

## License

Apache 2.0 (see `LICENSE`).
