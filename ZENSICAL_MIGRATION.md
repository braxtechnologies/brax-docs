# Zensical Migration Guide

## Overview

This project has been successfully upgraded from **Material for MkDocs** to **[Zensical](https://zensical.org)**, a modern static site generator built by the creators of Material for MkDocs.

## What Changed

### ✅ Benefits of Zensical

- ⚡ **Significantly faster builds** - Built with Rust for performance (1.81s vs previous build times)
- 🎨 **Modern design** - Clean, professional interface with improved UX
- 🔧 **Drop-in compatibility** - Your existing `mkdocs.yml` works seamlessly
- 🚀 **Active development** - Built by the Material for MkDocs team

### 📦 Dependencies Updated

**Before:**
```
mkdocs-material
mkdocs-minify-plugin
mkdocs-git-revision-date-localized-plugin
mkdocs-glightbox
mkdocs-alias-plugin
mkdocs-categories-plugin
mkdocs-live-edit-plugin
mkdocs-pdf
```

**After:**
```
zensical>=0.0.5
pymdown-extensions>=10.15
```

Many plugins are now built-in to Zensical or handled differently.

### 🔄 Command Changes

| Old Command | New Command |
|------------|-------------|
| `mkdocs serve --livereload` | `zensical serve` |
| `mkdocs build` | `zensical build` |
| `mkdocs --version` | `zensical --version` |

### 📝 Configuration

Your existing `mkdocs.yml` configuration file continues to work without changes. Zensical is fully backward compatible with MkDocs configurations.

Alternatively, you can create a modern `zensical.toml` file for TOML-based configuration.

## Installation

1. **Activate virtual environment:**
   ```bash
   # Windows
   venv\Scripts\activate
   
   # Linux/macOS
   source venv/bin/activate
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Verify installation:**
   ```bash
   zensical --version
   ```

## Usage

### Development Server

Start the local development server with live reload:

```bash
zensical serve
```

Then open http://localhost:8000

### Production Build

Build the static site for production:

```bash
zensical build
```

The built site will be in the `site/` directory.

## Compatibility Notes

### ✅ Fully Compatible

- All Markdown files
- `mkdocs.yml` configuration
- Material for MkDocs theme settings
- PyMdown Extensions
- Navigation structure
- Custom CSS/JavaScript
- Assets and images

### ⚠️ Currently Not Supported

Some MkDocs plugins may not be supported yet as Zensical is in alpha (0.0.x):

- PDF generation (was: mkdocs-pdf)
- Git revision dates (was: mkdocs-git-revision-date-localized-plugin)
- Some third-party plugins

Zensical is under active development, and plugin support is expanding.

## Current Status

**Zensical Version:** 0.0.5 (Alpha)

⚠️ **Note:** Zensical is currently in alpha development. While it's production-ready for many use cases, some features are still being developed.

## Resources

- 🏠 [Zensical Homepage](https://zensical.org)
- 📚 [Zensical Documentation](https://zensical.org/docs/)
- 🐙 [GitHub Repository](https://github.com/zensical/zensical)
- 📬 [Newsletter](https://zensical.org/about/newsletter/)

## Rollback (If Needed)

If you need to rollback to MkDocs Material:

1. Restore the old `requirements.txt`:
   ```
   mkdocs-material
   [other plugins]
   ```

2. Reinstall:
   ```bash
   pip install -r requirements.txt
   ```

3. Use `mkdocs` commands instead of `zensical`

## Support

For issues or questions:
- Check the [Zensical Documentation](https://zensical.org/docs/)
- Report issues on [GitHub](https://github.com/zensical/zensical/issues)
- Review the [Compatibility Guide](https://zensical.org/compatibility/)
