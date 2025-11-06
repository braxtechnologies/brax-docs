---
# markdownlint-disable-file MD041 MD007 MD032
hide:
  - navigation
---

# Brax Open Source Community Hub and Developers Ressources

<style>
  .community-hero {
    border-radius: 1.5rem;
    overflow: hidden;
    box-shadow: 0 40px 80px rgba(8, 10, 20, 0.45);
  }
  .community-hero img {
    display: block;
    width: 100%;
    height: auto;
  }
  .section-heading {
    margin-top: 3rem;
    margin-bottom: 1rem;
    font-size: 2.25rem;
  }
  .event-grid,
  .community-grid,
  .resource-grid {
    display: grid;
    gap: 1.5rem;
  }
  @media (min-width: 768px) {
    .event-grid,
    .community-grid,
    .resource-grid {
      grid-template-columns: repeat(3, minmax(0, 1fr));
    }
    .event-grid.highlighted {
      grid-template-columns: 2fr 1fr;
    }
  }
  .card {
    background: rgba(255, 255, 255, 0.75);
    border-radius: 1rem;
    padding: 2rem;
    box-shadow: 0 24px 48px rgba(20, 25, 55, 0.12);
    border: 1px solid rgba(45, 50, 90, 0.08);
    backdrop-filter: blur(12px);
  }
  .card h3 {
    margin-top: 0;
    margin-bottom: 0.75rem;
    font-size: 1.35rem;
  }
  .card p {
    margin-bottom: 0.75rem;
    color: #3b4167;
  }
  .card .meta {
    display: block;
    font-size: 0.95rem;
    font-weight: 600;
    color: #5a62a3;
  }
  .list-card ul {
    list-style: none;
    padding-left: 0;
    margin: 0;
  }
  .list-card li {
    padding: 0.6rem 0;
    border-bottom: 1px solid rgba(45, 50, 90, 0.08);
  }
  .list-card li:last-child {
    border-bottom: none;
  }
  .list-card strong {
    display: block;
    font-size: 1.05rem;
  }
  .list-card span {
    color: #5a62a3;
    font-size: 0.95rem;
  }
  .resource-grid .card a {
    font-weight: 600;
    color: #352f87;
    text-decoration: none;
  }
  .resource-grid .card a:hover {
    text-decoration: underline;
  }
</style>

<div class="community-hero">
  <img src="../assets/images/community-hero.svg" alt="Join the Brax Community: connect with builders, privacy advocates, and open tech creators." />
</div>

## Highlighted Event

<div class="event-grid highlighted">
  <div class="card">
    <h3>Brax Summit 2025</h3>
    <span class="meta">12–13 December 2025 · Montréal, QC + livestream</span>
    <p>Two days of deep dives into privacy-first hardware, ethical supply chains, and community-led operating systems. Expect hardware labs, open ROM workshops, and roadmap roundtables with our product teams.</p>
    <a class="cta secondary" href="/community/events/brax-summit-2025/">Reserve your spot</a>
  </div>
  <div class="card list-card">
    <h3>Why attend?</h3>
    <ul>
      <li><strong>Hands-on labs</strong><span> Learn how to flash and harden the latest Brax firmware.</span></li>
      <li><strong>Meet the builders</strong><span> Chat with the engineers and maintainers behind BraX3.</span></li>
      <li><strong>Community showcase</strong><span> Discover partner ROMs and privacy projects in the expo space.</span></li>
    </ul>
  </div>
</div>

<<<<<<< HEAD
## Engineering Blog

<div class="Engineering Blog">
  <div class="card">
    <h3>Android Debugging Crash Course</h3>
    <span class="meta">Every Tuesday · 18:00 UTC · Virtual</span>
    <p>Bring your Brax device and we’ll walk through installing custom ROMs, verifying builds, and tuning privacy settings.</p>
    <a class="cta secondary" href="/community/events/privacy-rom-clinic/">Learn more</a>
  </div>
  <div class="card">
    <h3>Working with SELinux on Android</h3>
    <span class="meta">07 Nov 2025 · 15:00 UTC · Discord</span>
    <p>Product engineering AMA focused on repairability, spare parts sourcing, and community hardware mods.</p>
    <a class="cta secondary" href="/community/events/hardware-office-hours/">Save your seat</a>
  </div>
  <div class="card">
    <h3>Qualcomm’s Chain of Trust</h3>
    <span class="meta">14 Nov 2025 · 19:00 UTC · Hybrid</span>
    <p>Share findings, coordinate responsible disclosure, and co-design mitigations with our security response team.</p>
    <a class="cta secondary" href="/community/events/security-roundtable/">Join the session</a>
  </div>
</div>

## Video Tutorials

<div class="Video Tutorials">
  <div class="card list-card">
    <div style="left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.25%;"><iframe src="https://www.youtube.com/embed/NCA0xJ9kL4c?rel=0" style="top: 0; left: 0; width: 100%; height: 100%; position: absolute; border: 0;" allowfullscreen scrolling="no" allow="accelerometer *; clipboard-write *; encrypted-media *; gyroscope *; picture-in-picture *; web-share *;" referrerpolicy="strict-origin"></iframe></div>
  </div>
  <div class="card list-card">
    <h3>Europe</h3>
    <ul>
      <li><strong>Brax Berlin</strong><span> Open hardware co-working every first Saturday.</span></li>
      <li><strong>Brax Balkans</strong><span> Collaborative device repair clinics.</span></li>
      <li><strong>Brax Nordic</strong><span> Community translations and documentation sprints.</span></li>
    </ul>
  </div>
  <div class="card list-card">
    <h3>Asia-Pacific</h3>
    <ul>
      <li><strong>Brax Manila</strong><span> Youth-focused privacy education events.</span></li>
      <li><strong>Brax Bengaluru</strong><span> Kernel hacking and firmware hardening sessions.</span></li>
      <li><strong>Brax Aotearoa</strong><span> Sustainable hardware builds with repair cafés.</span></li>
    </ul>
  </div>
</div>

## Learn More

<div class="resource-grid">
  <div class="card">
    <h3>Community Code of Conduct</h3>
    <p>We align on shared values—respect, transparency, and security-conscious collaboration—so everyone can contribute safely.</p>
    <a href="/community/code-of-conduct/">Read the guidelines</a>
  </div>
  <div class="card">
    <h3>Mission & Principles</h3>
    <p>Explore how our commitments to openness, privacy, and sustainability shape every Brax product and program.</p>
    <a href="/manifesto/">Review the manifesto</a>
  </div>
  <div class="card">
    <h3>Project Governance</h3>
    <p>Understand how working groups, maintainers, and community councils collaborate to steer the roadmap.</p>
    <a href="/community/governance/">See the framework</a>
  </div>
</div>

## Stay Updated

- Subscribe to the Brax Community Dispatch for release notes, event recaps, and contributor spotlights.
- Join the weekly community call for Q&A with product, hardware, and security leads.
- Follow us on Matrix, Mastodon, and Brax Community forums for daily discussions.

> “We build, learn, and ship together—because privacy, openness, and user choice thrive in community.”
=======
Are you looking for our other open sourcing efforts?
>>>>>>> b525d649259cbb9d627ee00702f8350ef7a1e45d
