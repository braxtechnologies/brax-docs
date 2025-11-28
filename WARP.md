# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

This is the **BRAX Technologies open source documentation site** built with **Zensical** (a modern Rust-based static site generator by the creators of Material for MkDocs, fully compatible with MkDocs configurations).

The documentation covers:
- **Device documentation** for BRAX hardware (BraX3 smartphone, BraxTab, 00Phone, Granite, Vigile, WallUp)
- **Operating system guides** (AOSP, BraxOS, LineageOS, Ubuntu Touch, iodéOS, LunarOS, CypherOS)
- **Repair guides** (screen, battery, charging port, buttons)
- **Company governance** (code of conduct, management model, organizational structure, social/environmental impact)
- **Employee handbook** (performance paths, compensation frameworks, knowledge management)
- **Manifesto** and community resources

The site is deployed to **two environments**:
- `https://opensource.braxtech.net` (production - `main` branch)
- `https://opensource-dev.braxtech.net` (development - `dev` branch)

## Common Commands

### Development Setup

**Windows (PowerShell):**
```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

**Unix/Linux/macOS:**
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Or use the provided setup script (Unix-like systems only):
```bash
./setup.sh
```

### Development Server

Start the local development server with live reload:
```bash
zensical serve
```
- Access at `http://localhost:8000`
- Hot reloading enabled - changes to docs automatically refresh
- Port 8000 is auto-forwarded in dev containers
- **Much faster than MkDocs** (Rust-based, typically 1-2s builds vs 10-30s)

### Building

Build the static site for production:
```bash
zensical build
```
- Output directory: `site/`
- Use `zensical build --clean` to remove stale files before building

### Validation

Check for broken links:
```bash
linkchecker http://localhost:8000
```
(Requires dev server to be running)

## Architecture

### Project Structure

```
brax-docs/
├── docs/                              # All documentation content
│   ├── index.md                       # Homepage/landing page
│   ├── assets/images/                 # Images, icons, and static assets
│   ├── devices/                       # Device documentation
│   │   ├── BraX3/                     # BraX3 smartphone (primary device)
│   │   ├── 00Phone/, BraxTab/, Granite/, Vigile/, WallUp/  # Other devices
│   ├── governance/                    # Company governance
│   │   ├── code-of-conduct/, Corporate Structure/, Project Governance/
│   │   └── Social and Environmental Impact/
│   ├── Management Model/              # Employee handbook (deprecated location)
│   ├── Employee Handbook/             # Employee handbook (new location)
│   │   ├── about-us/, how-we-make-decisions/, how-we-build-processes-and-a-great-product/
│   │   └── how-we-ensure-peoples-growth/, policies/
│   ├── manifesto/, bounties/, careers/, partners/, events/, apps/
│   ├── guide/posts/                   # Technical blog posts
│   └── lunar-network/                 # Brax Network documentation
├── zensical.toml                      # Primary Zensical configuration (TOML)
├── requirements.txt                   # Python dependencies (zensical>=0.0.5)
└── .github/workflows/ci.yml           # CI/CD pipeline for deployment
```

### Zensical Configuration

The `zensical.toml` file controls all site configuration:
- **Navigation structure**: Hierarchical nav menu defined in `[nav]` sections (TOML format)
- **Theme customization**: Material theme with dark/light mode toggle, colors (black primary, deep orange accent), fonts (Inter text, JetBrains Mono code)
- **Markdown extensions**: PyMdown Extensions for admonitions, code blocks, tabs, emoji, syntax highlighting
- **Plugins**: Search, tags, typeset, git-revision-date-localized, glightbox (image lightbox), live-edit, mkdocs-pdf
- **Social links**: GitHub, LinkedIn, Twitter/X, community site
- **Features**: Navigation tabs (sticky), instant navigation with prefetch, tracking, footer, edit/view page actions

**Note**: Zensical is fully compatible with MkDocs `mkdocs.yml` files but uses TOML format (`zensical.toml`) for better performance and modern config syntax.

### Content Organization

Documentation follows a **section-based structure** with each major topic in its own directory:
- Each section has an `index.md` as the landing page
- Related docs grouped together (e.g., all BraX3 repair guides in one folder)
- Navigation hierarchy matches directory structure
- Assets centralized in `docs/assets/`

**Device documentation structure** (e.g., BraX3):
- **Overview**: General device info, bootloader unlocking, OS installation
- **RepairGuide**: Hardware repair instructions (screen, battery, charging port, buttons)
- **SupportedOS**: Per-OS subdirectories (AOSP, BraxOS, LineageOS, Ubuntu Touch, iodéOS, LunarOS, CypherOS)
  - Each OS has: Overview, About, Download, Repositories, Build, Test, Contribute, Issue Board
  - Some OSes (LineageOS, CypherOS) only have Overview pages

### Markdown Extensions

This project uses **PyMdown Extensions** for enhanced Markdown features:
- **Admonitions** (`!!! note`, `!!! warning`) for callouts
- **Code blocks** with syntax highlighting and line numbers
- **Tabbed content** for multi-option documentation
- **Task lists** with custom checkboxes
- **Footnotes, definition lists, tables**
- **Emoji** via `:emoji_name:` syntax

### Deployment Pipeline

The `.github/workflows/ci.yml` workflow:
1. Triggers on push to `main` or `dev` branches (also on PRs)
2. Sets up Python 3.12 environment
3. Installs Zensical and dependencies from `requirements.txt`
4. Runs `zensical build --clean`
5. Verifies `site/` directory exists
6. Deploys via FTP:
   - `dev` branch → Development server (uses `FTP_HOST_DEV`, `FTP_USERNAME_DEV`, `FTP_PASSWORD_DEV`)
   - `main` branch → Production server (uses `FTP_HOST`, `FTP_USERNAME`, `FTP_PASSWORD`)

**Environment variables required**:
- Secrets: `FTP_USERNAME`, `FTP_PASSWORD`, `FTP_USERNAME_DEV`, `FTP_PASSWORD_DEV`
- Vars: `FTP_HOST`, `FTP_PORT`, `FTP_DIR`, `FTP_HOST_DEV`, `FTP_PORT_DEV`, `FTP_DIR_DEV`

## Development Guidelines

### Adding New Pages

1. Create the Markdown file in the appropriate `docs/` subdirectory
2. Add an entry to the `[nav]` section in `zensical.toml` using TOML syntax (pages not in nav won't appear in menu)
   - Example: `"Page Title" = "path/to/page.md"` under the appropriate nav section
3. Test locally with `zensical serve`

### Content Standards

- Use **relative links** for internal documentation links (e.g., `[link](../section/page.md)`)
- Include a **descriptive title** at the top of each page (`# Title`)
- Use **admonitions** for warnings, tips, and important notes
- Keep line lengths reasonable (80-120 chars recommended by VSCode settings)
- Preserve trailing newlines and trim trailing whitespace (enforced in devcontainer)

### VSCode/Dev Container Setup

The `.devcontainer/` configuration provides:
- **Python 3.12** with automatic venv setup
- **Pre-installed extensions**: Markdown All in One, Markdown Lint, spell checker
- **Auto-formatting**: Prettier for Markdown, Black for Python
- **Port forwarding**: Port 8000 auto-forwarded for Zensical dev server
- **Linting**: Markdown linting with MD013 (line length) and MD033 (HTML) disabled

The devcontainer runs `./setup.sh` on creation and activates the venv in bash sessions.

**Note**: The setup script is Unix/Linux/macOS only. Windows users should manually create the venv (see "Development Setup" section).

## Important Notes

- **Never commit** the `site/` directory (it's in `.gitignore`)
- **Never commit** virtual environments (`venv/`, `.venv/`)
- The live site deploys automatically from `main` branch (production) and `dev` branch (development) - test changes thoroughly before pushing
- When editing `zensical.toml`, ensure TOML syntax is valid (use proper quoting for strings with special chars)
- Markdown files use CRLF line endings (Windows-style) - preserve them for consistency
- **Zensical vs MkDocs**: This project uses Zensical (faster, Rust-based) but remains fully compatible with MkDocs configurations

## Architecture Notes

### Dual Documentation Locations
Employee handbook content exists in **two locations** due to migration:
- **Legacy**: `docs/Management Model/` (still referenced in some places)
- **Current**: `docs/Employee Handbook/` (actively maintained)

The navigation structure reflects this duality. When editing, prioritize the `Employee Handbook/` location.

### Navigation Structure
The nav hierarchy in `zensical.toml` uses nested TOML tables:
- Top-level sections: `[nav."Section Name"]`
- Subsections: `[nav."Section"."Subsection"]`
- Nested subsections: `[nav."Section"."Subsection"."Nested"]`
- Empty string key `""` = section landing page with no title override
