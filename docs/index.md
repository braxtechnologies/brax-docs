---

hide:
  - navigation
  - toc
---

# Welcome

<style>
  .hero-container {
    position: relative;
    margin-bottom: 3rem;
    background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
    border-radius: 1rem;
    overflow: hidden;
  }
  .hero-content {
    display: grid;
    gap: 2rem;
    align-items: center;
    padding: 3rem 2rem;
  }
  @media (min-width: 768px) {
    .hero-content {
      grid-template-columns: 1fr 1fr;
      padding: 4rem 3rem;
    }
  }
  .project-intro {
    color: white;
  }
  .project-intro h2 {
    margin-top: 0;
    color: #ffffff;
    font-size: 2rem;
    font-weight: 700;
  }
  .project-intro p {
    font-size: 1.05rem;
    line-height: 1.7;
    color: rgba(255, 255, 255, 0.9);
    margin-bottom: 1rem;
  }
  .community-hero {
    border-radius: 0.5rem;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    display: flex;
    align-items: center;
    min-height: 100%;
  }
  .community-hero img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
    min-height: 400px;
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
  .video-container {
    margin: 2rem 0;
    border-radius: 1rem;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  }
  .video-container iframe {
    display: block;
    width: 100%;
    border: none;
  }
  .event-logo {
    max-width: 150px;
    margin-bottom: 1rem;
    display: block;
  }
</style>

<div class="hero-container">
  <div class="hero-content">
    <div class="project-intro">
      <h2>Brax Open Source Community</h2>
      <p>
        We are an international community with a mission to bring free software to the widest possible audience. Our name "Brax" means "humanity towards others". Join us and share in our mission to bring open-source mobile technology to the entire world!
      </p>
      <p>
        Welcome to the Brax Open Source Documentation Hub—a comprehensive resource for developers, contributors, and enthusiasts working with Brax Technologies devices and operating systems. From detailed device guides to in-depth technical articles on Android development, security, and firmware.
      </p>
    </div>
    <div class="community-hero">
      <img src="../assets/images/community-hero.svg" alt="BraX3: Privacy, done better - Secure & private mobile technology from Brax Technologies" />
    </div>
  </div>
</div>

## Highlighted Event

<div class="event-grid highlighted">
  <div class="card">
    <img src="../assets/images/opensource-experience-logo.png" alt="Open Source Experience" class="event-logo" />
    <h3>Open Source Experience 2025</h3>
    <span class="meta">Paris, France · November 2025</span>
    <p>Join the leading European open source event bringing together developers, decision-makers, and innovators. Discover the latest in open source technologies, cloud computing, digital sovereignty, and sustainable IT solutions.</p>
    <a class="cta secondary" href="https://www.opensource-experience.com/" target="_blank" rel="noopener">Learn more</a>
  </div>
  <div class="card list-card">
    <h3>Why attend?</h3>
    <ul>
      <li><strong>Hands-on labs</strong><span> Learn how to flash and get to see the latest Brax Hardware.</span></li>
      <li><strong>Meet the builders</strong><span> Chat with the engineers and maintainers behind BraX3.</span></li>
      <li><strong>Community showcase</strong><span> Discover partner ROMs and privacy projects in the expo space.</span></li>
    </ul>
  </div>
</div>

## Guide

<div class="event-grid">
  <div class="card">
    <h3>Android Debugging Crash Course</h3>
    <span class="meta">06 January 2025</span>
    <p>A comprehensive guide to debugging Android systems, from basic logging to advanced kernel debugging techniques. Learn ADB, logcat, and kernel-level debugging.</p>
    <a class="cta secondary" href="blog/2025-01-06-android-debugging-crash-course/">Read more</a>
  </div>
  <div class="card">
    <h3>Working with SELinux on Android</h3>
    <span class="meta">07 January 2025</span>
    <p>Understanding and working with Security-Enhanced Linux in Android development - from basics to advanced policy writing.</p>
    <a class="cta secondary" href="blog/2025-01-07-working-with-selinux-android/">Read more</a>
  </div>
  <div class="card">
    <h3>Qualcomm's Chain of Trust</h3>
    <span class="meta">08 January 2025</span>
    <p>Understanding Qualcomm's boot sequence, security mechanisms, and how bootloaders work together to secure modern Android devices.</p>
    <a class="cta secondary" href="blog/2025-01-08-qualcomm-chain-of-trust/">Read more</a>
  </div>
</div>

## Video Tutorials

<div class="video-container">
  <iframe src='https://widgets.sociablekit.com/youtube-playlist-videos/iframe/25619455' frameborder='0' width='100%' height='250'></iframe>
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

> "We build, learn, and ship together—because privacy, openness, and user choice thrive in community."
