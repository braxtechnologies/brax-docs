# Security & Privacy

| Layer | Security Feature | Description |
|------|-------------------|-------------|
| Transport | TLS 1.3 + PFS | All communications encrypted |
| Auth | Ephemeral Keys | No reusable sessions |
| Data | No Logging | Requests deleted post-response |
| DNS | DoH / DoT | Prevents ISP/MITM leakage |
| Privacy | Differential Privacy | Optional coordinate obfuscation |

- No IPs, MACs, IMEI/IMSI stored.
- Optional mutual TLS for private meshes.
- Reproducible builds and signed releases.
