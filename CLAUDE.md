# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

The main website for the Open Logix organization, a static GitHub Pages site served at `www.openlogix.org`.

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
- **Free and open:** every product is 100% free and open source, built by community members for the community, under the permissive Apache 2.0 license. Adapted versions just can't use the Logix name. The site stresses this on purpose (hero badge, "No catch" section) to answer "what's the catch?" doubts. Keep that message prominent, and don't add anything that suggests paid tiers or upsells.
- **Experienced team:** the team are experienced developers from the US and Europe, with more than 40 years of combined professional software development and a long track record in the open source movement. The site uses this to build trust, as the "40+ years" figure in the "No catch" section.
- **Spec-driven:** each product is built from a detailed AI specification. This makes changes, adaptations, and new features quick and low-effort.
- **Quality and trust:** products have extensive automated tests. All code is public, every release is built on GitHub, and builds are reproducible, so users can build it themselves. The site presents this positively ("Transparent and verifiable") to build trust. Don't use words like "malware" or "virus" on the site.
- **AI-native engine:** Logix Engine is MCP-compatible. Off-the-shelf AI systems can use it to generate code and testbenches, then lint, build, simulate, and program the FPGA, with no other software needed.

## Layout

- `docs/` is the published site root. GitHub Pages is set to serve from the `docs/` folder on `main`, not the repo root. Put all site content here.
- `docs/CNAME` holds the custom domain (`www.openlogix.org`). It must stay inside `docs/`: a `CNAME` at the repo root is ignored by this Pages setup. Git history shows earlier attempts that put it at the root before it was moved. Changing or deleting this file changes or breaks the custom domain.
- `docs/index.html` is the whole site: a single page with inline CSS, no JavaScript, and no external dependencies. Its sections are hero, ecosystem (frontends sitting on the Engine), free/no-catch, principles, AI/MCP flow, and footer.
- `docs/brand/` holds the identity as SVGs: `logo.svg` (org mark) and one icon per product (`engine`, `ide`, `cli`, `vscode`, `studio`, `remote`, `ai`). The page and favicon load them with `<img>`.

## Brand identity

- **Wordmark:** "Open" in regular weight and muted color, followed by "Logix" in heavy weight, with no space between them (`OpenLogix`). It always sits next to the logo tile.
- **Org logo:** a 3x3 grid of logic cells (a nod to FPGA fabric). The cells forming an "L" are solid white and the rest are faint. The tile uses the brand gradient, indigo `#6366F1` to cyan `#06B6D4`, which is also the site's accent color.
- **Product icon recipe.** Every family icon follows this so they read as a set:
  - `viewBox="0 0 64 64"`, a `rect` with `rx="16"` as the tile, filled with a diagonal linear gradient (top-left to bottom-right) from a light shade to a deep shade of the product's own hue.
  - One simple white glyph, centered within roughly 14 to 50. Draw it with `stroke="#fff" stroke-width="4.5"`, round caps and joins, and no fill. Small solid white accents (dots, triangles, stars) are allowed.
  - Current hues: Engine violet, IDE green, CLI slate, VSCode blue, Studio orange, Remote cyan, AI pink to purple. A new product needs a hue that isn't taken yet.
- Glyphs: Engine = chip, IDE = window with a play button, CLI = `>_`, VSCode = `</>`, Studio = AND gate, Remote = wireless signal, AI = sparkle.

## Build / deploy

There is no build step, package manager, linter, or test suite. Pushing to `main` deploys the site. To preview locally, serve `docs/` with any static file server, for example:

```
python3 -m http.server -d docs 8000
```

## License

Apache 2.0 (see `LICENSE`).
