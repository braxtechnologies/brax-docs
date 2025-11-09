# ☁️ Deployment

| Mode | Description | Example |
|------|-------------|---------|
| Self-Hosted | Run your own Brax node | `docker run brax/network` |
| Edge Node | Local gateway for IoT | ARM binary on router/hub |
| Cloud Relay | Shared public instance | `api.brax.network` |

**Best Practices**
- Enable TLS 1.3 only; prefer modern ciphers.
- Pin certificates in clients.
- Use container isolation and read-only filesystems.
- Prefer DoH/DoT for all name resolution.
