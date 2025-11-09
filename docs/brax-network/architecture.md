# Architecture

```
+---------------------------------------------------+
|                   BRAx SDK                        |
|  (Android, Linux, IoT - privacy aware clients)    |
+---------------------------------------------------+
        |                    |                |
        v                    v                v
+-------------+    +----------------+   +----------------+
|  Data APIs  |    |  Network APIs  |   |   Utility APIs |
| (APK, Geo)  |    | (DNS, NTP...)  |   |  (Weather, SUPL)|
+-------------+    +----------------+   +----------------+
             ↓
     Stateless, Encrypted, Auditable Core
```

## Design Principles
- **Zero Data Retention:** No personal data or metadata stored.
- **Security Without Surveillance:** TLS 1.3, no analytics or telemetry.
- **Stateless:** Independent, ephemeral requests; local caching for offline.
- **Auditable:** Open-source, reproducible builds.
