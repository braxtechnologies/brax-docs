# 🧰 Tool Stack Selection Guide

<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 2rem; border-radius: 8px; margin-bottom: 2rem; color: white;">
  <h2 style="color: white; margin-top: 0;">Balancing Openness, Privacy, and Competitiveness</h2>
  <p style="font-size: 1.1rem; line-height: 1.6; margin-bottom: 0;">
    We choose tools that enhance our ability to build privacy-first products — without compromising on quality, velocity, or innovation.
  </p>
</div>

---

## 🎯 Purpose

<div style="background: #f8f9fa; padding: 1.5rem; border-left: 4px solid #667eea; border-radius: 6px; margin-bottom: 2rem;">
  <p style="line-height: 1.6; margin: 0;">
    This guide defines how Brax Technologies selects, evaluates, and approves its engineering and operations tools. Our mission is to <strong>use technology that enhances our ability to build privacy-first products</strong> — without compromising on quality, velocity, or innovation.
  </p>
  <p style="line-height: 1.6; margin: 1rem 0 0 0;">
    We acknowledge that not every domain has the same privacy expectations: our <strong>core systems</strong> (engineering, devices, users) demand full sovereignty, while <strong>business operations</strong> sometimes rely on external, cloud-based ecosystems.
  </p>
</div>

---

## 📍 Guiding Principles

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; margin-bottom: 2rem;">

<div style="background: #f8f9fa; padding: 1.5rem; border-radius: 8px; border-top: 4px solid #667eea;">
  <h3 style="color: #667eea; margin-top: 0;">🔒 Privacy and Control First</h3>
  <ul style="line-height: 1.6; margin-bottom: 0;">
    <li>We prefer tools that let us <strong>own our data</strong> and <strong>control our environment</strong>.</li>
    <li>Open-source and self-hosted tools are the <strong>default choice</strong> whenever feasible.</li>
    <li>The key question: <em>"Who controls the data, and what is its potential exposure risk?"</em></li>
  </ul>
</div>

<div style="background: #f8f9fa; padding: 1.5rem; border-radius: 8px; border-top: 4px solid #764ba2;">
  <h3 style="color: #764ba2; margin-top: 0;">⚖️ Pragmatism and Efficiency</h3>
  <ul style="line-height: 1.6; margin-bottom: 0;">
    <li>We make <strong>data-driven, context-aware</strong> decisions.</li>
    <li>Some workflows (marketing, recruiting) operate in the public domain — cloud tools acceptable <strong>when managed with care</strong>.</li>
    <li>We minimize data sharing and retain the right to exit or migrate if vendors’ privacy practices change.</li>
  </ul>
</div>

<div style="background: #f8f9fa; padding: 1.5rem; border-radius: 8px; border-top: 4px solid #667eea;">
  <h3 style="color: #667eea; margin-top: 0;">📝 Transparency and Review</h3>
  <ul style="line-height: 1.6; margin-bottom: 0;">
    <li>Every major tool adoption undergoes a <strong>lightweight internal review</strong> covering technical, privacy, and sustainability considerations.</li>
    <li>Decisions are <strong>documented</strong> with rationale, risk level, and mitigation steps.</li>
    <li>We maintain a living inventory of our stack and re-evaluate dependencies regularly.</li>
  </ul>
</div>

</div>

---

## ✅ Tool Selection Criteria

<p style="font-size: 1.05rem; color: #555; margin-bottom: 1.5rem;">
  When evaluating a new tool or platform, we consider:
</p>

| Category | Key Questions | Preferred Approach |
|----------|---------------|--------------------|
| 📦 **Data Ownership** | Who stores and processes the data? | Self-hosted or private cloud preferred |
| 🔒 **Privacy Impact** | What data is collected and retained? | Minimal, anonymized, auditable |
| 🔐 **Security** | Does it support encryption, MFA, SSO, access controls? | Mandatory for sensitive systems |
| 📜 **Open Source** | Is it auditable? What’s the license? | Prefer open-source with active community |
| 🔓 **Vendor Lock-In** | How easily can we migrate away? | Open standards and exportable data |
| 🚀 **Performance & Scale** | Does it fit our growth model? | Scalable, maintainable |
| 🤖 **AI Integration** | Does it expose internal data? | Only if privacy-respecting or self-hosted |
| 🏢 **Business Context** | Is the data already public or non-sensitive? | Cloud acceptable under control policies |

---

## 🌐 Open Source vs. Cloud Tools

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-bottom: 2rem;">

<div style="background: #e8f5e9; padding: 1.5rem; border-radius: 8px; border-top: 4px solid #4caf50;">
  <h3 style="color: #2e7d32; margin-top: 0;">✅ Open Source (Default)</h3>
  <ul style="line-height: 1.6; margin-bottom: 1rem;">
    <li>Full transparency into code and data flows.</li>
    <li>Customizable and aligned with our mission.</li>
    <li>Ideal for core engineering systems: CI/CD, firmware builds, device management, analytics, and AI pipelines.</li>
  </ul>
  <p style="margin: 0; font-size: .95rem; color: #555;"><strong>Examples:</strong> GitLab (self-hosted), Matrix/Element, Nextcloud, Grafana, Hugging Face local inference servers.</p>
</div>

<div style="background: #fff8e1; padding: 1.5rem; border-radius: 8px; border-top: 4px solid #ff9800;">
  <h3 style="color: #e65100; margin-top: 0;">⚠️ Cloud Tools (Controlled Use)</h3>
  <p style="line-height: 1.6; margin-bottom: 1rem;">
    Some business operations benefit from managed cloud platforms — provided we manage exposure and contractual controls.
  </p>
  <p style="margin: 0 0 .5rem 0; font-weight: 600;">We adopt cloud tools when they:</p>
  <ul style="line-height: 1.6; margin: 0;">
    <li><strong>Do not process user or device data</strong>, or</li>
    <li>Handle <strong>already public or non-sensitive information</strong> (e.g., marketing content, candidate CVs, CRM data), and</li>
    <li>Offer <strong>data export and deletion</strong> capabilities.</li>
  </ul>
</div>

</div>

---

## ⚖️ Pragmatic Compromises for Business Operations

<div style="background: #f8f9fa; padding: 1.5rem; border-left: 4px solid #764ba2; border-radius: 6px; margin-bottom: 1.5rem;">
  <p style="line-height: 1.6; margin: 0;">
    At Brax, <strong>compromise never means carelessness</strong> — it means we understand the data’s context and sensitivity. We may use trusted cloud tools for specific business areas where privacy risk is <strong>inherent but manageable</strong>.
  </p>
</div>

| Domain | Typical Data | Acceptable Cloud Use | Controls |
|--------|--------------|----------------------|----------|
| 📢 **Marketing & Advertising** | Website traffic, campaign metrics, lead data | Analytics, SEO tools, ad networks | Use privacy filters, anonymization, consent-based tracking |
| 💼 **Sales & CRM** | Contact info, business communication | HubSpot, Pipedrive, Salesforce | Limit personal data; enforce GDPR compliance |
| 💳 **Payment Processing** | Billing, transaction metadata | Stripe, PayPal | Tokenized; Brax does not store card data |
| 📝 **Recruiting & HR** | Applicant resumes, job posts | Greenhouse, Lever | Store only necessary personal data; delete post-hire cycle |
| 📱 **Social Media & PR** | Public-facing content | LinkedIn, X, YouTube | No internal or customer data sharing |
| ✉️ **Email & Collaboration** | Internal discussions, outreach | ProtonMail, Google Workspace (restricted) | Segregate sensitive communication via secure channels |

<div style="background: #e3f2fd; border-left: 4px solid #1976d2; padding: 1rem; border-radius: 6px; margin-top: 1.5rem;">
  <p style="margin: 0; line-height: 1.6;">
    <strong>Key Rule:</strong> Cloud tools may be used <strong>only where the data is already exposed by nature</strong> or is <strong>non-sensitive</strong>. Internal product telemetry, user data, and system logs remain strictly under Brax’s control.
  </p>
</div>

---

## 🤖 Artificial Intelligence and Privacy

<div style="background: #f3e5f5; padding: 1.5rem; border-radius: 8px; border-top: 4px solid #9c27b0; margin-bottom: 1.5rem;">
  <p style="line-height: 1.6; margin: 0;">
    AI adds tremendous capability — but also privacy risk. Our stance remains: <strong>use AI, but guard the data</strong>.
  </p>
</div>

### 📜 AI Usage Principles

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: .75rem; margin-bottom: 1.5rem;">
  <div style="background: #e8eaf6; padding: .75rem 1rem; border-radius: 6px;">❌ <strong>No user data to public models</strong></div>
  <div style="background: #f3e5f5; padding: .75rem 1rem; border-radius: 6px;">🛡️ <strong>Prefer open-weight or private-hosted models</strong></div>
  <div style="background: #e8eaf6; padding: .75rem 1rem; border-radius: 6px;">🎭 <strong>Anonymize before inference</strong></div>
  <div style="background: #f3e5f5; padding: .75rem 1rem; border-radius: 6px;">📝 <strong>Transparency in data handling</strong></div>
  <div style="background: #e8eaf6; padding: .75rem 1rem; border-radius: 6px;">🚀 <strong>Leverage AI for productivity, not surveillance</strong></div>
</div>

### ✅ Acceptable AI Uses

<ul style="line-height: 1.7;">
  <li>💻 Local AI coding assistants</li>
  <li>📊 Internal analytics on anonymized telemetry</li>
  <li>✍️ Marketing content generation (with non-user data)</li>
  <li>🤖 Automated documentation and testing tools</li>
</ul>

---

## 🔄 Decision Process

<div style="text-align: center; margin: 2rem 0;">
  <img src="/assets/images/tool-stack-flowchart.png" alt="Tool Stack Decision Flowchart" style="max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
</div>

<div style="background: #f8f9fa; padding: 1.5rem; border-radius: 8px; border-left: 4px solid #667eea; margin-bottom: 2rem;">
  <ol style="line-height: 1.8; margin: 0; padding-left: 1.5rem;">
    <li><strong>Propose:</strong> Engineer or team identifies a need.</li>
    <li><strong>Evaluate:</strong> Assess open-source and cloud alternatives using the criteria above.</li>
    <li><strong>Classify Data Sensitivity:</strong>
      <ul style="margin: .5rem 0;">
        <li><strong>Level 1:</strong> User or device data → <span style="background: #ffebee; padding: .25rem .5rem; border-radius: 4px;">Self-host only</span></li>
        <li><strong>Level 2:</strong> Internal but non-sensitive → <span style="background: #fff8e1; padding: .25rem .5rem; border-radius: 4px;">Cloud with contract controls</span></li>
        <li><strong>Level 3:</strong> Public/business data → <span style="background: #e8f5e9; padding: .25rem .5rem; border-radius: 4px;">Cloud acceptable</span></li>
      </ul>
    </li>
    <li><strong>Review:</strong> Privacy and security teams approve or reject.</li>
    <li><strong>Trial:</strong> Deploy small-scale pilot.</li>
    <li><strong>Document:</strong> Record decision and rationale.</li>
    <li><strong>Reassess:</strong> Reevaluate every 6–12 months.</li>
  </ol>
</div>

---

## 🎯 Conclusion

<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 1.75rem; border-radius: 8px; color: white; text-align: center;">
  <p style="font-size: 1.15rem; line-height: 1.6; margin: 0;">
    Brax Technologies operates in the real world — where privacy, performance, and business needs must coexist. We protect user trust at all costs while staying agile and competitive through smart tool choices.
  </p>
  <p style="font-size: 1.25rem; font-weight: 600; margin: 1rem 0 0 0;">
    🔒 Privacy is our principle. ⚖️ Pragmatism is our practice. 🤝 Trust is our advantage.
  </p>
</div>
