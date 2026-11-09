# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

The main website for the Open Logix organization, a static GitHub Pages site served at `www.openlogix.org`.

## About Open Logix

Open Logix builds easy-to-use open source tools for FPGA design. Site content should present these projects as one ecosystem:

- **Logix Engine** is the core of the ecosystem. It is an MCP backend that gives frontends FPGA services: building, testing, simulation, verification, and board programming. Every other project runs on top of it.
- **Logix Catalog** (motto: "Every FPGA board, described once.") is the open catalog of FPGA boards: each board's FPGA, how to program it, and what its pins are wired to (clocks, LEDs, buttons, headers), one JSON file per board. Logix Engine builds a pinned catalog release in; other projects can use the data without the engine. Contributors add and fix boards in the `logix-catalog` repo, never in the engine repo. Its design is in progress (added 2026-11-08).
- Frontends, each serving a different level of design and implementation:
  - **Logix IDE**: an Arduino-like experience for FPGAs.
  - **Logix CLI**: a command-line tool, inspired by Apio.
  - **Logix VSCode**: an extension for VS Code.
  - **Logix Studio**: a graphical, schematic-based design tool.
  - **Logix Remote**: a network adapter for remote FPGA development.
  - **Logix AI**: a set of AI agents that design and test FPGA logic and program the board.

- **Each frontend owns its project model and examples.** The engine takes explicit inputs (folders, files, board) and has no project files or examples, so each frontend uses the project model and source format that fit it best (IceStudio's block diagrams have no `.v` sources, for example) and ships examples in that format. Frontends on the engine don't depend on Apio. Logix CLI is only inspired by Apio: not close to it and not compatible with it, in its project model or its commands (decided 2026-11-08).

- **Long-term goal: libraries** (raised 2026-11-08, not decided). Frontends should one day support libraries: reusable design code users add to their projects, the way Arduino has libraries. Open is where they live: possibly a new product, such as Logix Libs, that defines libraries once for every frontend (as Logix Catalog does for boards), if a shared format can serve frontends with different project models; otherwise each frontend defines its own. Nothing is built or promised yet: the overview deck lists it as a longer-term goal (Logix Lib), with remote development (Logix Remote), hardware-in-the-loop testing (Logix HIL) and training material and media; site pages don't mention Logix Lib or Logix HIL.
- **Diagnostic features, and a local engine (recommended for all frontends).** By default a frontend uses only the GitHub package of the engine release it pins. Diagnostic and debug features of the frontend or the engine, turned on at runtime, may change that. They aren't meant for normal use by end users: they're for Logix developers, for users a Logix developer guides through them, and for manual and automated testing of Logix components. The convention for running a frontend on another engine binary is the environment variable `LOGIX_DEV_ENGINE_BINARY`, the path to a `logix-engine` executable (such as one built from a local engine clone). A frontend that follows it honors it in every build, whether run from a local checkout or installed from a GitHub-built package (a stable release is a pre-release declared stable, the same binary, so a build-time switch can't tell them apart); gives that engine its own engine folder, so the regular engine's packages are never touched; shows that it's in use for the whole session, not only in a log; and treats a value that isn't an executable file as an error, never falling back silently. The engine doesn't read the variable and no one can enforce it, so it's a recommendation, followed so every frontend works the same way. Each frontend's repo says how to use it (Logix IDE: `scripts/run.sh --engine-repo-dir <engine clone>`, or the variable itself).
- **Environment variable names.** `LOGIX_<COMPONENT>_<PURPOSE>_<NAME>`: `LOGIX_` alone only for a convention several components follow (today only `LOGIX_DEV_ENGINE_BINARY`); otherwise the component that reads it (`LOGIX_ENGINE_`, `LOGIX_IDE_`, and so on for later products), then `BUILD_` (read only when building), `TEST_` (tests only), `DEV_` (development setups and scripts), or nothing for a setting the shipped program reads at runtime; then the name, saying what it holds (`FOLDER`, `BINARY`, `VERSION`). Examples: `LOGIX_ENGINE_BUILD_VERSION`, `LOGIX_IDE_TEST_ENGINE_FOLDER`, `LOGIX_IDE_HOME`. Each repo lists its own in its `CLAUDE.md`. Add one only when an argument or a script option won't do.

- **Logix IDE is the reference frontend.** Much of a frontend's logic, such as choosing boards and board variants, showing what's connected, choosing a device, Upload, build reports, problems and the console, is the same for every frontend, and frontends may come from anyone, inside or outside Open Logix. Two ways keep it from being rewritten each time:
  - **Engine first:** logic every frontend needs, that doesn't depend on a frontend's own model (its project files, examples or look), goes into Logix Engine, without breaking its abstraction (requests stay explicit and stateless). When a frontend repeats engine knowledge, such as FPGA family names or the toolchain's resource names, that's a gap to fill in the engine.
  - **An example to follow:** Logix IDE's AI spec (its `CLAUDE.md`), docs and code, public under MIT or Apache 2.0, show how to use the engine; the engine's tool API, which stands on its own for any frontend, links to the IDE files that implement each recipe. The IDE uses only what the tool API documents, so what works for it works for anyone.
  - **Easy to explore:** the IDE repo's content (code, docs, AI spec and the parts of it about the engine) is written for easy exploration by people and AI agents who develop hosts and frontends, inside and outside Open Logix: clear names and layout, each part's purpose and its engine calls explained where they are, and nothing that needs Open Logix's private context to understand.

- **Wording: program boards, not FPGAs.** Most users program an FPGA board, not a bare FPGA chip, so say "program the board" or "program FPGA boards", never "program FPGAs" or "program the FPGA". This applies everywhere: site pages, product descriptions, repo descriptions, READMEs, docs and release notes. Logix IDE's motto, "The Arduino experience, for FPGAs.", is not about programming and stays as it is.

## Org principles

Every Open Logix product follows these principles. Site content should reflect them consistently:

- **Easy:** products are intuitive and easy to install and use.
- **Self-contained:** products bundle everything they need, so users never have to install a toolchain separately.
- **Cross-platform:** products support macOS (ARM), Windows (x64), and Linux (x64).
- **Free and open:** every product is 100% free and open source, built by community members for the community, under the permissive MIT or Apache 2.0 license, the user's choice. Adapted versions just can't use the Logix name. The site stresses this on purpose (hero badge, "No catch" section) to answer "what's the catch?" doubts. Keep that message prominent, and don't add anything that suggests paid tiers or upsells.
- **Experienced team:** the team are experienced developers from the US and Europe, with more than 40 years of combined professional software development and a long track record in the open source movement. The site uses this to build trust, as the "40+ years" figure in the "No catch" section.
- **Spec-driven:** each product is built from a detailed AI specification. This makes changes, adaptations, and new features quick and low-effort.
- **Quality and trust:** products have extensive automated tests. All code is public, every release is built on GitHub, and builds are reproducible, so users can build it themselves. The site presents this positively ("Transparent and verifiable") to build trust. Don't use words like "malware" or "virus" on the site.
- **AI-native engine:** Logix Engine is MCP-compatible. Off-the-shelf AI systems can use it to generate code and testbenches, then lint, build, simulate, and program the board, with no other software needed.

## Layout

- `docs/` is the published site root. GitHub Pages is set to serve from the `docs/` folder on `main`, not the repo root. Put all site content here.
- `docs/CNAME` holds the custom domain (`www.openlogix.org`). It must stay inside `docs/`: a `CNAME` at the repo root is ignored by this Pages setup. Git history shows earlier attempts that put it at the root before it was moved. Changing or deleting this file changes or breaks the custom domain.
- `docs/index.html` is the org home page: plain HTML, no JavaScript. Its sections are hero, ecosystem (frontends sitting on the Engine, and Logix Catalog under the Engine as the board data it builds in), free/no-catch, principles, AI/MCP flow, and footer. In the ecosystem, every product card is a link to its page (`<a class="card">`, with the product's `--product`/`--product2` set inline) showing its availability (`.when`) and "Learn more →" (`.more`); the Logix Engine block links to `engine/` the same way, and the Logix Catalog block under it (`a.engine.catalog`, joined by a `.connector.single`) to `catalog/`.
- `docs/assets/site.css` is the one stylesheet for every page (home and product pages), so they share one look (the overview deck is the one exception): the tokens in `:root` (ink, muted, line, soft, `--brand` indigo, `--brand2` cyan, radius), the system font stack, header, hero, buttons, cards, sections, the dark "free" block, footer, and the product page classes. Pages link it relatively (`assets/site.css`, `../assets/site.css`) and have no inline `<style>` of their own. Change the look here, not per page.
- `docs/<product>/index.html` is a product's home page (marketing, not docs): `ide`, `engine`, `catalog`, `ai`, `cli`, `vscode`, `studio`, `remote`, e.g. `docs/ide/index.html` at `www.openlogix.org/ide/`. See "Product pages".
- `docs/schemas/` holds JSON Schemas that files outside the site name by URL, so they must stay at their addresses: `logix-boards-v1.json`, the Logix Engine boards schema (`https://www.openlogix.org/schemas/logix-boards-v1.json`, named by `"$schema"` in board files). The engine owns it: it is a copy of the engine repo's `schemas/logix-boards-v1.json`, generated from its code. Never edit it here; copy it again when the engine's changes. Until the first release it changes without a new version. Logix Catalog's schemas, `logix-board-v1.json` (one board's file; custom boards are folders of the same files) and `logix-fpgas-<architecture>-v1.json` (one FPGA family's file, `fpgas/<architecture>.json`), are copies of the `logix-catalog` repo's `schemas/` the same way; the engine moves from `logix-boards-v1.json` to it when it reads the catalog's format.
- `docs/overview/` is the overview deck (`www.openlogix.org/overview/`): slides about the whole project for people to open and read on their own, not for live presenting. Its content is being decided with the user, so add slides only when asked. It's the one page with its own look: `docs/overview/deck.css` (16:9 slides on a dark backdrop, text sized in `--u`, 1% of the slide width, so it scales with the slide), not `site.css`. Each slide is `<div class="frame" id="..."><section class="slide"><div class="body">...</div></section></div>`; `.slide.title` is the dark title slide. The page snaps from slide to slide, and on phones the slides grow to fit their text, with no JavaScript. Its one small script adds, to each slide, a share button that copies the slide's address (`#id`) and "‹ n / m ›" previous and next arrows in place of the plain number, plus the left and right arrow keys; the deck works without it, and new slides get both by having an `id`. Slides are numbered "n / m": `n` counts automatically, and `m` is `--slides` on `<main>`, which must be updated whenever a slide is added or removed. The page links `deck.css?v=N`: raise `N` whenever `deck.css` changes, or browsers that cached the old stylesheet (Pages lets them keep it 10 minutes) show the new slides with the old styles. Every page's footer links to it ("Overview slides").
- `docs/brand/` holds the identity as SVGs: `logo.svg` (org mark) and one icon per product (`engine`, `catalog`, `ide`, `cli`, `vscode`, `studio`, `remote`, `ai`). The page and favicon load them with `<img>`.

## Product pages

Each product gets a short page at `www.openlogix.org/<short>/`, where `<short>` is its brand icon name (`ide`, `engine`, `cli`, ...). Docs stay in the product's own repo.

- **Availability** (shown on the product pages, in the home page cards, on the Engine block and on the overview deck's product slides; update them all when it changes):
  - Logix IDE: previews available now, release Q4 2026.
  - Logix Engine, Logix Catalog and Logix AI: Q4 2026.
  - Logix CLI, Logix VSCode and Logix Studio: Q1 2027.
  - Logix Remote: Q2 2027.
- **Repos:** every product has one, named `logix-<short>` (`logix-ide`, `logix-engine`, `logix-catalog`, `logix-ai`, `logix-cli`, `logix-vscode`, `logix-studio`, `logix-remote`), and its GitHub "Website" field is its product page. The ones for products not started yet are public placeholders (the Logix license, topics, and a README with the description, "Coming <quarter>", and links to the product page and Open Logix). A product page's GitHub links (nav, hero button, Availability) go to its repo; the footer's goes to the org.
- **License (decided 2026-11-08):** every Logix repo, code, data, docs and examples alike, is licensed `MIT OR Apache-2.0`, the user's choice: `LICENSE-MIT` ("Copyright (c) 2026 The Open Logix contributors") and `LICENSE-APACHE` at its root, `license = "MIT OR Apache-2.0"` in package manifests, and "MIT or Apache 2.0" wherever it's named for people. Why: MIT lets GPL-2.0 projects (such as Apio) use Logix code and data, Apache 2.0 gives a patent grant; CC0 was considered for the board data and rejected for one uniform model. Material from elsewhere keeps its own license.
- **Shared repo:** `openlogix/.github` holds what several repos use the same way: the shared GitHub Actions (`openlogix/.github/actions/<name>@v1`) and the org page (`profile/README.md`, shown on github.com/openlogix) with a table of all repos for developers. When a repo is added, renamed or changes status, update that table in the same change. It isn't a product, so it has no `logix-` prefix and no product page. Product-owned things (such as the engine's schemas and catalog) stay in their product repo.

- **Path rule:** never use a repo name as a path. The custom domain also serves each repo's Pages site at `www.openlogix.org/<repo>/` (e.g. `/logix-ide/` is the Logix IDE docs), which would hide a folder of that name here.
- **Template** (follow `docs/ide/index.html`), in this order, using only the shared classes:
  - Head: title `<Product>: <tagline> | Open Logix`, description, `og:` tags (image = the product's main screenshot), favicon = the product's brand icon. `<body>` sets `--product` / `--product2` to the product's icon gradient.
  - Header: the same brand link (to `../`) as the home page; nav = the page's sections, Docs, and GitHub (class `gh`, the one kept on phones).
  - Hero (`hero product-hero`): `.product-name` (icon + name), `h1` with the tagline (second half in `.grad-text`), `.lead`, CTA (Download primary to `#download`, docs and GitHub as ghost buttons), then the main screenshot (`.shot`) full width.
  - "How it works" (`alt`): a `.flow` of three `.step`s, each with an inline icon that follows the brand icon recipe in the product's hue.
  - Features: the `.principles` grid, six short items.
  - Screenshots (`alt`): `.gallery` of `figure`s with captions.
  - Download (`free`, dark): the FREE badge, a link to the install guide, "Free. Open. No catch." linking to `../#free`, and `.platforms` (macOS Apple Silicon, Windows x64, Linux x64; a Download button where available, "Coming soon" otherwise). Download buttons go to the repo's Releases page, not `/releases/latest`, which skips pre-releases.
  - Footer: the home page footer, plus any notice the product needs as `.fine`.
  - Before Download: "Part of Open Logix" (`#family`), the `.apps` grid of the other products' cards, each linking to its page, with the home page's card text.
- **Upcoming products** (no release or screenshots yet; follow `docs/engine/index.html`): the same template with these changes. The hero uses the home page's two-column layout (`hero`, not `product-hero`) with the product icon large on the right (`.hero-icon`) instead of a screenshot, and `.when` ("Coming <quarter>") above the `h1`. CTA: Availability (primary, to `#availability`) and GitHub. There's no Screenshots section. The dark section is `#availability`: "Coming <quarter>.", a sentence that it's in development (Engine, AI) or planned (the rest) and will be free, self-contained and cross-platform, and `.platforms` with the quarter on each. Nav: Features, Ecosystem, Availability, GitHub. The flow's three steps are: the input (a tile drawn like a brand icon in the product's hue, with a simple glyph: document, chat bubble, pencil or laptop), the product's own icon with chips of what it does, and the home page's FPGA board drawing. Features stay general and true to the product descriptions above; don't promise specific features, commands or integrations that haven't been decided.
- Screenshots are loaded from the product's published docs (absolute `https://www.openlogix.org/<repo>/images/...` URLs, so they stay current and the local preview shows them). The product repo's spec lists which ones the page uses.
- Content comes from the product (its README and docs) and must stay true to it: say what ships today (e.g. platforms "Coming soon", what it's built on).
- **Logix Catalog** (`docs/catalog/`): an upcoming product page; the tagline is its motto, "Every FPGA board, described once." Being data, its Availability lists where it's used (Logix Engine, your own tools, board makers) instead of platforms, and its "Part of Open Logix" grid shows the Engine and all frontends. Every other product page's grid shows a Logix Catalog card after the Engine's.
- **Logix IDE** (`docs/ide/`): the tagline is the product's motto, written without quotes (decided 2026-11-08; it was quoted before): The Arduino experience, for FPGAs. Because of it, the footer carries "Logix is not affiliated with or endorsed by Arduino. Arduino is a trademark of Arduino SA." It runs on Logix Engine (the move from Apio shipped in the logix-ide repo); the page says so, crediting the open source tools Apio uses. Screenshots and links point to `www.openlogix.org/logix-ide/` (docs from the `logix-ide` repo).

## Brand identity

- **Wordmark:** "Open" in regular weight and muted color, followed by "Logix" in heavy weight, with no space between them (`OpenLogix`). It always sits next to the logo tile.
- **Org logo:** a 3x3 grid of logic cells (a nod to FPGA fabric). The cells forming an "L" are solid white and the rest are faint. The tile uses the brand gradient, indigo `#6366F1` to cyan `#06B6D4`, which is also the site's accent color.
- **Product icon recipe.** Every family icon follows this so they read as a set:
  - `viewBox="0 0 64 64"`, a `rect` with `rx="16"` as the tile, filled with a diagonal linear gradient (top-left to bottom-right) from a light shade to a deep shade of the product's own hue.
  - One simple white glyph, centered within roughly 14 to 50. Draw it with `stroke="#fff" stroke-width="4.5"`, round caps and joins, and no fill. Small solid white accents (dots, triangles, stars) are allowed.
  - Current hues: Engine violet, Catalog red, IDE green, CLI slate, VSCode blue, Studio orange, Remote cyan, AI pink to purple. A new product needs a hue that isn't taken yet.
- Glyphs: Engine = chip, Catalog = open book, IDE = window with a play button, CLI = `>_`, VSCode = `</>`, Studio = AND gate, Remote = wireless signal, AI = sparkle.

## Open decisions

- **How people contact the team, and which GitHub features each repo uses** (TODO, raised 2026-11-08). Decide the recommended ways to reach Open Logix (such as GitHub issues, Discussions, email, or a chat server) and which repos turn on issues, Discussions, wikis and Projects, if any; then say it on the site and in the repos' READMEs, and turn the rest off. Today (2026-11-08) every repo has issues on; Discussions are on only in `logix-ide`; wikis and Projects are on in every repo except `logix-ide` (GitHub's defaults, never decided); the site names no way to contact the team.

## Build / deploy

There is no build step, package manager, linter, or test suite. If shared header/footer markup across many product pages gets hard to keep identical, GitHub Pages' built-in Jekyll (`_includes`, layouts) is the planned next step; until then the template above is the rule. Pushing to `main` deploys the site. To preview locally, run `./view.sh [port]` (default port 8000). It serves `docs/` with Python's built-in HTTP server and opens the browser.

## License

MIT or Apache 2.0, at your option (see `LICENSE-MIT` and `LICENSE-APACHE`).
