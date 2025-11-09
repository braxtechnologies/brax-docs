# 🛡️ Brax Chat — Technical Specification & Protocol Document
**Version:** 1.0  
**License:** Open Source (GPL v3 or AGPL)  

---

## 1. Product Overview
**Name:** Brax Chat  
**Platform:** Android (only)  
**Type:** Open-source secure messaging and calling app  

**Purpose:**  
Brax Chat provides private, end-to-end encrypted chat, voice, and video using open communication protocols.  
It’s fully open source, uses no telemetry or tracking, and gives users complete control over their data.  

**Core Technologies:**  
- **XMPP (Openfire)** — Messaging and presence backend  
- **OMEMO** — End-to-end encrypted messaging  
- **SIP (Kamailio)** — Call signalling  
- **ZRTP (with RTP Engine)** — Secure media channel negotiation  
- **SQLCipher** — AES-256-encrypted local data storage  

---

## 2. Platform & Environment
- **OS:** Android 9 or higher  
- **Network:** Wi-Fi and mobile data  
- **Messaging backend:** Openfire XMPP server  
- **VoIP stack:** Kamailio + RTP Engine  
- **Database:** SQLCipher (AES-256 encrypted SQLite)  

---

## 3. Architecture Overview
### 3.1 Client Components
- **UI:** Android Material Design  
- **Crypto Layer:** OMEMO (Double Ratchet, Curve25519)  
- **Local Storage:** SQLCipher-encrypted database  
- **Messaging Stack:** XMPP over TLS 1.3  
- **VoIP Stack:** SIP over TLS with ZRTP key negotiation for media  

### 3.2 Server Components
| Layer | Component | Purpose |
|:--|:--|:--|
| Messaging | **Openfire** | XMPP message routing, presence, and OMEMO support |
| Signalling | **Kamailio** | SIP proxy and registration routing |
| Media | **RTP Engine** | NAT traversal and ZRTP negotiation proxy |
| Traversal | **STUN/TURN (optional)** | Helps peers connect behind NAT |

### 3.3 Data Flow
1. User connects securely to Openfire (TLS 1.3).  
2. XMPP handles authentication, presence, and contact exchange.  
3. Text messages encrypted via OMEMO (end-to-end).  
4. Voice/video calls initiated via Kamailio using SIP/TLS.  
5. Media streams established through RTP Engine, encrypted via **ZRTP**.  
6. All local data (messages, keys, media) stored with SQLCipher.  

---

## 4. Security & Encryption
### 4.1 Messaging (OMEMO / Double Ratchet)
- Curve25519 (X25519) for key exchange  
- Ed25519 for signing  
- AES-256-GCM for message encryption  
- SHA-256 for key derivation and integrity  
- Forward secrecy + post-compromise security  
- Group chat encryption via Sender Keys  

### 4.2 Voice & Video (ZRTP)
- Diffie–Hellman (Curve25519) key negotiation per session  
- Short Authentication String (SAS) for peer verification  
- Ephemeral session keys for each call  
- Media encryption handled entirely by ZRTP (no SRTP dependency)  
- Peer-to-peer connection preferred; RTP Engine used for NAT traversal if needed  

### 4.3 Data at Rest (SQLCipher)
- AES-256-CBC encryption with PBKDF2 key derivation  
- Encrypted local database and attachments  
- Optional biometric or PIN lock for access  

### 4.4 Key Management
- Persistent identity key (Ed25519)  
- Ephemeral ratchet keys per session (OMEMO)  
- Manual reset and key rotation supported  

### 4.5 Metadata Minimisation
- Servers store only minimal routing info (temporary).  
- No message or call content stored server-side in plaintext.  

---

## 5. Features
- End-to-end encrypted private and group messaging  
- File, image, and voice message attachments  
- Encrypted voice and video calls using ZRTP  
- Offline message delivery  
- Optional disappearing messages  
- Encrypted local backups  

---

## 6. Protocols & Data Flows
### 6.1 Messaging (XMPP + OMEMO)
```
Client A → Openfire → Client B
- XMPP over TLS 1.3
- OMEMO-encrypted XML stanzas
- No plaintext message storage on server
```

### 6.2 Calling (SIP + Kamailio + RTP Engine + ZRTP)
```
1. Client A sends SIP INVITE (TLS) → Kamailio
2. Kamailio routes request → Client B
3. Clients perform ZRTP handshake for media key agreement
4. Encrypted RTP stream established through RTP Engine (ZRTP tunnel)
5. SAS displayed to verify peer identity
```

### 6.3 Storage (SQLCipher)
- Full-database encryption (AES-256)  
- Password-derived key with PBKDF2  
- Database integrity validation on startup  

### 6.4 Authentication
- XMPP SASL over TLS for messaging  
- SIP digest authentication for calls  
- Session tokens expire after inactivity  

---

## 7. Security Practices
- Uses modern cryptography exclusively (AES-256, Curve25519, Ed25519)  
- No telemetry, ads, or analytics  
- Auto-lock after inactivity  
- Verified open-source builds  
- Community-led code auditing  

---

## 8. User Interface & Experience
- Clean Android Material UI  
- Encryption status visible in all chats and calls  
- SAS displayed during calls for verification  
- Dark mode  
- Minimal notifications (no message previews)  

---

## 9. Technical Requirements
- Android SDK 33+ (Java/Kotlin)  
- Libraries: libolm, libsodium, SQLCipher, Smack (XMPP), pjsip or Doubango (SIP), ZRTP4J  
- No Google Play Services required  
- Efficient CPU and bandwidth usage  

---

## 10. Versioning & Releases
- **v1.0:** OMEMO messaging, ZRTP audio calls  
- **v1.1:** Video calls and group chat refinements  
- **v2.0:** Federated servers, multi-device sync  
- Community-driven open development on GitHub  

---

## 11. Privacy & Transparency
- Zero telemetry or tracking  
- No third-party data sharing  
- Public, auditable source code  
- Users fully own their keys and data  

---

## 12. Threat Model & Protections
| Threat | Mitigation |
|:--|:--|
| Man-in-the-middle | TLS 1.3 + ZRTP SAS verification |
| Server compromise | E2E OMEMO encryption; ZRTP for calls |
| Device theft | SQLCipher encryption + lock screen |
| Key compromise | Ephemeral keys and ratchet resets |
| Network attack | ZRTP encryption on all media |

---

## 13. Glossary
**XMPP** – Extensible Messaging and Presence Protocol  
**Openfire** – Open-source XMPP server backend  
**OMEMO** – End-to-end encrypted messaging protocol  
**SIP** – Session Initiation Protocol for call signalling  
**Kamailio** – SIP proxy / router  
**RTP Engine** – Media proxy for RTP streams with ZRTP support  
**ZRTP** – Media encryption and key exchange protocol for VoIP  
**SQLCipher** – Encrypted SQLite database (AES-256)  

---

## 14. Summary
**Brax Chat** is a **fully open-source, Android-only secure communication app** built on **Openfire (XMPP)** for messaging, **Kamailio** for SIP call signalling, and **RTP Engine** for ZRTP-encrypted media transport.  
It uses **OMEMO** for messaging encryption and **SQLCipher** for data-at-rest protection.  
There’s no tracking, telemetry, or third-party dependence — Brax Chat is built for transparent, standards-based, private communication.
