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
    background: linear-gradient(135deg, #1E1E1E 0%, #1E1E1E 100%);
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
      <h2>Brax Technologies Documentation</h2>
      <p>
        Start here to explore everything related to Brax products and services. This site brings together step-by-step guides, reference docs, and learning resources in one place.
      </p>
      <p>
        Browse device setup and maintenance guides, supported operating systems and install instructions, network and service documentation, video tutorials, events, governance and community guidelines, and deep-dive technical articles for builders and power users.
      </p>
    </div>
    <div class="community-hero">
      <img src="../assets/images/1.jpg" alt="BraX3: Privacy, done better - Secure & private mobile technology from Brax Technologies" />
    </div>
  </div>
</div>

## Newest Guides

<div class="event-grid">
  <div class="card">
    <h3>How to troubleshoot your Brax device</h3>
    <p>Systematically diagnose issues on any Brax device using recovery mode, built in test menus, and logs so you can separate software problems from true hardware faults before requesting repair.</p>
    <a class="cta secondary" href="guide/posts/troubleshooting/">Read more</a>
  </div>
  <div class="card">
    <h3>How to change the IMEI</h3>
    <p>Advanced walk through of restoring or changing IMEI values on Brax devices with MediaTek SN Writer, including legal considerations, required files, and fixes for common tool errors.</p>
    <a class="cta secondary" href="guide/posts/imei-change/">Read more</a>
  </div>
  <div class="card">
    <h3>How to Unlock the Bootloader of Your Brax Device</h3>
    <p>Step by step instructions for unlocking the bootloader on Brax devices using ADB and fastboot, plus guidance on relocking and troubleshooting connection or driver issues.</p>
    <a class="cta secondary" href="guide/posts/unlock-bootloader/">Read more</a>
  </div>
</div>

## Video Tutorials

<div class="video-container">
  <iframe src='https://widgets.sociablekit.com/youtube-playlist-videos/iframe/25619455' frameborder='0' width='100%' height='270'></iframe>
</div>

## Learn More

<div class="resource-grid">
  <div class="card">
    <h3>Devices</h3>
    <p>Explore the full Brax device lineup, the principles behind our hardware design, and documentation for setup, configuration, repair, and supported operating systems.</p>
    <a class="cta secondary" href="/devices/">Browse device docs</a>
  </div>
  <div class="card">
    <h3>Manifesto</h3>
    <p>Understand why Brax Technologies operates as a Public Benefit Corporation and how our mission, core beliefs, and commitments shape every product decision.</p>
    <a class="cta secondary" href="/manifesto/">Read the manifesto</a>
  </div>
  <div class="card">
    <h3>Governance</h3>
    <p>Review how Brax is governed, what our founders stand for, and the long term commitments we make to user freedom, privacy, sustainability, and environmental impact.</p>
    <a class="cta secondary" href="/governance/">View governance overview</a>
  </div>
</div>

## Join the Discussion

Join the [our community](https://community.braxtech.net/) to connect with users, developers, and privacy advocates. Get support, share ideas, participate in discussions, and stay informed about releases, events, and project updates.
