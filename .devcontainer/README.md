# Dev Container Configuration

This directory contains the dev container configuration for the BRAX Management Model documentation project.

## What's Included

- **Python 3.12** environment
- **Git** and **GitHub CLI** pre-installed
- **MkDocs** and all project dependencies
- Pre-configured VS Code extensions for Markdown editing:
  - Markdown All in One
  - Markdown Lint
  - Code Spell Checker
  - Python support
  - YAML support
  - Prettier formatter

## How to Use

### Prerequisites

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
2. Install [VS Code](https://code.visualstudio.com/)
3. Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Getting Started

1. Open this project in VS Code
2. When prompted, click **Reopen in Container** (or press `F1` and select **Dev Containers: Reopen in Container**)
3. Wait for the container to build and start (first time may take a few minutes)
4. Once ready, you'll have a fully configured development environment!

### Running MkDocs

Once inside the container, you can run MkDocs commands:

```bash
# Start the development server
mkdocs serve

# Build the documentation
mkdocs build
```

The MkDocs development server will be available at `http://localhost:8000` and will automatically reload when you make changes.

## Port Forwarding

Port `8000` is automatically forwarded, so you can access the MkDocs dev server from your browser at `http://localhost:8000`.

## Troubleshooting

If you encounter issues:

1. Make sure Docker Desktop is running
2. Try rebuilding the container: `F1` → **Dev Containers: Rebuild Container**
3. Check Docker context: `docker context list` (should show 'default' as active)

## Learn More

- [Dev Containers Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
- [Dev Containers Tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial)
