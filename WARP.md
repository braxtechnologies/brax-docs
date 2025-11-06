# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

This is the BRAX Tech open source documentation site built with **MkDocs Material**. The documentation covers BRAX's management model, vision, processes, and employee handbook. The site is deployed automatically to `https://opensource.braxtetch.net` via GitHub Actions on push to main.

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
mkdocs serve
```
- Access at `http://localhost:8000`
- Hot reloading enabled - changes to docs automatically refresh
- Port 8000 is auto-forwarded in dev containers

### Building

Build the static site for production:
```bash
mkdocs build
```
- Output directory: `site/`
- Use `mkdocs build --clean` to remove stale files before building

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
│   ├── assets/                        # Images, icons, and static assets
│   ├── vision-mission-focus/          # Company vision and mission docs
│   ├── decision-making/               # Leadership and strategy docs
│   ├── building-processes-product/    # Operations and engineering culture
│   ├── people-growth/                 # Performance, compensation, growth
│   └── policies/                      # Rules, glossary, license, sources
├── mkdocs.yml                         # MkDocs configuration and nav structure
├── requirements.txt                   # Python dependencies
└── .github/workflows/ci.yml           # CI/CD pipeline for deployment
```

### MkDocs Configuration

The `mkdocs.yml` file controls:
- **Navigation structure**: Hierarchical nav menu defined in the `nav` section
- **Theme customization**: Material theme with dark/light mode, colors, fonts
- **Markdown extensions**: Admonitions, code blocks, tabs, emoji, syntax highlighting
- **Plugins**: Search, tags, git revision dates, lightbox images, HTML minification
- **Social links**: GitHub, LinkedIn, Twitter, community site

### Content Organization

Documentation follows a **section-based structure** with each major topic in its own directory:
- Each section has an `index.md` as the landing page
- Related docs grouped together (e.g., all people-growth topics in one folder)
- Navigation hierarchy matches directory structure
- Assets centralized in `docs/assets/`

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
1. Triggers on push to `main` branch
2. Sets up Python 3.12 environment
3. Installs dependencies from `requirements.txt`
4. Runs `mkdocs build --clean`
5. Verifies `site/` directory exists
6. Deploys via FTP to production server (uses secrets for credentials)

## Development Guidelines

### Adding New Pages

1. Create the Markdown file in the appropriate `docs/` subdirectory
2. Add an entry to the `nav` section in `mkdocs.yml` (pages not in nav won't appear in menu)
3. Test locally with `mkdocs serve`

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
- **Port forwarding**: Port 8000 auto-forwarded for MkDocs server
- **Linting**: Markdown linting with MD013 (line length) and MD033 (HTML) disabled

The devcontainer runs `./setup.sh` on creation and activates the venv in bash sessions.

## Important Notes

- **Never commit** the `site/` directory (it's in `.gitignore`)
- **Never commit** virtual environments (`venv/`, `.venv/`)
- The live site deploys automatically from `main` branch - test changes thoroughly
- FTP deployment requires secrets: `FTP_USERNAME`, `FTP_PASSWORD` and vars: `FTP_HOST`, `FTP_PORT`
- When editing `mkdocs.yml`, ensure YAML syntax is valid (use 2-space indentation)
- Markdown files use CRLF line endings (Windows-style) - preserve them for consistency
