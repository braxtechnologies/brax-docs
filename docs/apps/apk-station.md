# 📦 APK Station

!!! success "Project Status"
    **Status**: Active Development  
    **GitHub**: [braxtechnologies/Apk-Station](https://github.com/braxtechnologies/Apk-Station)  
    **Language**: Kotlin  
    **Contributors**: 2 active contributors
    
    ![GitHub stars](https://img.shields.io/github/stars/braxtechnologies/Apk-Station?style=social)
    ![GitHub forks](https://img.shields.io/github/forks/braxtechnologies/Apk-Station?style=social)
    ![GitHub watchers](https://img.shields.io/github/watchers/braxtechnologies/Apk-Station?style=social)
    ![GitHub commit activity](https://img.shields.io/github/commit-activity/m/braxtechnologies/Apk-Station)
    ![GitHub last commit](https://img.shields.io/github/last-commit/braxtechnologies/Apk-Station)
    ![GitHub issues](https://img.shields.io/github/issues/braxtechnologies/Apk-Station)
    ![GitHub pull requests](https://img.shields.io/github/issues-pr/braxtechnologies/Apk-Station)
    ![GitHub branch](https://img.shields.io/github/branches/all/braxtechnologies/Apk-Station)

| Screenshot | Description |
|:--:|:--|
| [<img src="/assets/images/apkstation1.png" alt="Homepage" width="600"/>](../assets/images/apkstation1.png) | **Personalized Homepage** — Browse curated app recommendations and featured collections. Discover new apps with tailored suggestions based on categories and popularity. |
| [<img src="/assets/images/apkstation2.png" alt="Search" width="600"/>](../assets/images/apkstation2.png) | **Advanced Search** — Find exactly what you need with powerful search and category browsing. Filter by app type, ratings, and privacy features. |
| [<img src="/assets/images/apkstation3.png" alt="App Details" width="600"/>](../assets/images/apkstation3.png) | **Detailed App Pages** — Complete information including permissions, privacy details, and user reviews. Make informed decisions before installing any app. |
| [<img src="/assets/images/apkstation4.png" alt="Settings" width="600"/>](../assets/images/apkstation4.png) | **Rob Braxman Choice Apps** — Curated selection of privacy-focused applications personally recommended by Rob Braxman. Discover trusted apps featured in his videos and privacy guides. |

**APK Station** is an open-source, privacy-first alternative app store for Android.

- 🔐 Zero tracking or telemetry
- 📱 Millions of free apps available
- 🔄 Automatic updates
- 🎯 Rob Braxman curated selections
- 🌐 Powered by Lunar Network
- 🛡️ Signature verification

---

## Overview

APK Station provides a complete app store experience without compromising your privacy. Discover and install millions of **free applications** without tracking, data collection, or telemetry.

!!! note "100% Free Apps"
    APK Station exclusively offers free applications. We do not host or distribute paid apps.

## Key Features

**Core Features:**

- **Personalized Homepage** — Discover new apps with tailored recommendations
- **Advanced Search** — Find exactly what you need with powerful search and category browsing
- **Detailed App Pages** — Complete information including privacy details for every app
- **Offline Mode** — Browse previously synced apps without an internet connection
- **FOSS Priority** — Open source focus with verified free and open source software
- **Rob Braxman Selections** — Curated privacy-focused apps featured in his videos

---

## 🛠️ Technical Stack

| Component | Technology |
|:--|:--|
| Platform | Native Android (Kotlin) |
| Backend | Lunar Network (decentralized distribution) |
| Database | SQLite (local app metadata) |
| Verification | Signature verification |
| Updates | Background service |
| Build System | Gradle with Kotlin DSL |

---

## 🚀 Getting Started

**Download APK Station:**
- [Official Website](https://braxtech.net)
- [GitHub Releases](https://github.com/braxtechnologies/apk-station/releases)
- [F-Droid](https://f-droid.org/en/)

**Quick Setup:**

- **Step 1**: Download and install the APK
- **Step 2**: Grant permissions when prompted
- **Step 3**: Wait for initial repository sync
- **Step 4**: Start browsing and installing apps
- **Step 5**: Configure automatic updates in settings

---

## 📋 Featured Categories

| Category | Description |
|:--|:--|
| **Communication** | Messaging, email, and VoIP apps |
| **Security & Privacy** | VPNs, password managers, and encryption tools |
| **Productivity** | Office suites, note-taking, and organization |
| **Multimedia** | Media players, photo editors, and streaming |
| **Development** | IDEs, terminal emulators, and dev tools |
| **System Tools** | File managers, backup tools, and utilities |

---

## 👨‍💻 For Developers

**Building from Source:**

```bash
git clone https://github.com/braxtechnologies/apk-station.git
cd apk-station
./gradlew assembleRelease
```

---

## 🔒 Privacy

APK Station follows a **zero-knowledge, privacy-first** approach:

- No account required (use anonymously)
- No analytics or telemetry
- No ads or tracking
- No data collection on app usage
- All data stays local on your device

---

## 🗯️ Roadmap

**Coming soon:**

### 🔗 Multi-Repository Support

Add custom repositories from multiple platforms:

- **GitHub** — Direct integration with GitHub releases
- **GitLab** — Support for GitLab package registries
- **Forgejo (Codeberg)** — Decentralized Git hosting support
- **F-Droid** — Official F-Droid repository support
- **Third Party F-Droid Repos** — Add community F-Droid repositories
- **IzzyOnDroid** — Popular third-party Android app repository
- **SourceHut** — Support for sr.ht hosted projects

### ✔️ App Signing Certificate Verifier

Easily verify that your apps are genuine! AppVerifier compares app signatures against provided or internal database hashes.

**Features:**
- Share verification info with others
- Receive and validate verification info from trusted sources
- Automatic verification status checking
- Simple, user-friendly verification process

### 🛡️ Privacy Score

Comprehensive privacy scoring system to help you make informed decisions about which apps to install.

---

## 🤝 Contributing

We welcome contributions!

- **Code** — Submit bug fixes and new features
- **App Reviews** — Help review submitted applications
- **Documentation** — Improve our documentation
- **Translation** — Translate APK Station to your language
- **Testing** — Test beta releases and report bugs

See our [Contributing Guidelines](https://github.com/braxtechnologies/apk-station/blob/main/CONTRIBUTING.md) for details.

---

## 📞 Support

- **Community Forum**: [community.braxtech.net](https://community.braxtech.net)
- **Issue Tracker**: [GitHub Issues](https://github.com/braxtechnologies/apk-station/issues)

---

## 📜 License

APK Station is released under the [GNU Affero General Public License v3.0 (AGPL-3.0)](https://www.gnu.org/licenses/agpl-3.0.en.html) with a **Non-Commercial clause**.

You are free to:
- **Fork and modify** the code for your own projects
- **Distribute** your modifications
- **Use** the software for personal and non-commercial purposes

You must:
- **Attribute** the original project and maintain copyright notices
- **Keep it open source** — all modifications must be released under the same license
- **Share source code** — if you run a modified version on a server, you must make the source code available
- **Not use commercially** — commercial use requires a separate license from Brax Technologies
