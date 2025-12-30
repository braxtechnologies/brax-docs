# Devices

<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 1.75rem; border-radius: 10px; margin-bottom: 1.5rem; color: white;">
  <h2 style="color: white; margin: 0 0 .5rem 0;">Devices for visibility and control</h2>
  <p style="margin: 0; opacity: .95;">We build devices for people who want more visibility and control over their technology. This section documents how our hardware works, how to configure it, and how to maintain it, so the community can use, review, and improve it over time.</p>
</div>

---

## Why We Build Devices This Way

<div style="background: #f8f9fa; padding: 1.5rem; border-left: 4px solid #667eea; border-radius: 6px; margin-bottom: 2rem;">
  <p style="line-height: 1.6; margin: 0;">
Modern mobile devices collect and process a significant amount of information in the background, often without clear visibility into how or why that data is used. As a community, we wanted hardware that behaves differently - something we can inspect, configure, and trust.
  </p>
</div>

Our approach focuses on reducing unnecessary data collection and giving people practical control over the systems that affect their privacy and security. This documentation explains how our devices are designed, what the limitations are, and how we work together with contributors to keep improving the platform.

---

## What Guides Our Hardware Design

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1rem; margin-bottom: 2rem;">

<div style="background: #e8f5e9; padding: 1.25rem; border-radius: 8px; border-left: 4px solid #4caf50;">
  <h4 style="color: #2e7d32; margin-top: 0;">🛡️ Reduced Data Exposure</h4>
  <p style="line-height: 1.6; margin: 0;">
We avoid telemetry and tracking wherever possible. This doesn’t guarantee perfect privacy - no system can - but it allows the community to understand how the device behaves and what data stays local.
  </p>
</div>

<div style="background: #e3f2fd; padding: 1.25rem; border-radius: 8px; border-left: 4px solid #2196f3;">
  <h4 style="color: #1565c0; margin-top: 0;">🔓 Open & Transparent</h4>
  <p style="line-height: 1.6; margin: 0;">
    Whenever possible, our software is open-source and auditable. Some components remain proprietary due to industry constraints (for example, modem firmware), and we document those cases clearly.
  </p>
</div>

<div style="background: #f3e5f5; padding: 1.25rem; border-radius: 8px; border-left: 4px solid #9c27b0;">
  <h4 style="color: #6a1b9a; margin-top: 0;">⚡ Practical Performance</h4>
  <p style="line-height: 1.6; margin: 0;">
    We aim for a balance between performance, security, and privacy. Some design choices involve trade-offs, and we document these so people can make informed decisions based on their needs.
  </p>
</div>

<div style="background: #fff3e0; padding: 1.25rem; border-radius: 8px; border-left: 4px solid #ff9800;">
  <h4 style="color: #e65100; margin-top: 0;">🔧 Repair-Friendly</h4>
  <p style="line-height: 1.6; margin: 0;">
    We support device longevity by providing repair information, replacement parts, and maintenance guidance when available. Keeping hardware functional for longer benefits the entire community.
  </p>
</div>

</div>

---

## What This Documentation Covers

### Setup & Configuration

- Initial device setup
- Advanced configuration options
- Operating system installation guides
- Software commonly used by the community

### Repair & Maintenance

- Repair guides
- Compatible components
- Known hardware issues
- Warranty and support details

### Supported Operating Systems

We document operating systems that run reliably on our hardware. Community ports and experimental builds are included when available.

---

## Device Lineup Overview

<div style="background: #e8f5e9; padding: 1.5rem; border-left: 4px solid #4caf50; border-radius: 6px; margin-bottom: 2rem;">
  <p style="line-height: 1.6; margin: 0;">
    We maintain documentation for each device model, including hardware specifications, compatibility notes, supported and experimental operating systems, kernel and driver details, and behavior of hardware switches (if applicable). New device documentation will be added as models are released.
  </p>
</div>

### Device clusters

Devices are organized into different clusters based on the primary purpose they were designed for.

#### Privacy cluster

Objective: devices that protect users from surveillance and data exploitation.

- [BraX3](./privacy/BraX3/Overview/)
- [Open Slate](./privacy/BraxTab/Overview/)
- [Granite](./privacy/Granite/Overview/)
- [Vigile](./privacy/Vigile/Overview/)

#### Home automation cluster

Objective: single-purpose devices that integrate seamlessly with Home Assistant and prioritize local control.

- [WallUp](./home-automation/WallUp/Overview/)

---

## Community & Support

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 1rem; margin-bottom: 2rem;">

<div style="background: #f8f9fa; padding: 1.25rem; border-radius: 8px; border-left: 4px solid #667eea;">
  <h4 style="color: #667eea; margin-top: 0;">💬 Community Forums</h4>
  <p style="line-height: 1.6; margin: 0; font-size: .9rem;">
    A space to exchange ideas, report issues, and share solutions. Many improvements originate from community discussions.
  </p>
</div>

<div style="background: #f8f9fa; padding: 1.25rem; border-radius: 8px; border-left: 4px solid #764ba2;">
  <h4 style="color: #764ba2; margin-top: 0;">👨‍💻 Technical Support</h4>
  <p style="line-height: 1.6; margin: 0; font-size: .9rem;">
    Support is available for setup, troubleshooting, and repairs. We document as much as possible so common issues can be solved collaboratively.
  </p>
</div>

<div style="background: #f8f9fa; padding: 1.25rem; border-radius: 8px; border-left: 4px solid #667eea;">
  <h4 style="color: #667eea; margin-top: 0;">📚 Contributing to Documentation</h4>
  <p style="line-height: 1.6; margin: 0; font-size: .9rem;">
    If something is unclear or incomplete, contributions are welcome. Documentation improves when more people participate.
  </p>
</div>

</div>

---

## Getting Started

If you're new to the ecosystem, a typical workflow is:

1. Select a device based on hardware capabilities
2. Choose an operating system that fits your needs
3. Follow the setup guides to configure it
4. Join the community to learn, share, or contribute

---

## Our Approach

<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 1.75rem; border-radius: 8px; color: white; margin-bottom: 2rem;">
  <p style="font-size: 1.05rem; line-height: 1.7; margin: 0;">
We treat privacy as something that improves when hardware, software, and community align. Our documentation aims to be straightforward and honest - not to make absolute claims but to explain how the devices work and how we try to improve them.
  </p>
  <p style="font-size: 1.05rem; line-height: 1.7; margin: 1rem 0 0 0;">
    We appreciate every improvement, report, and contribution. This project grows because of the community supporting it.
  </p>
</div>
