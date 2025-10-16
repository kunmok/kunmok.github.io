#!/usr/bin/env bash
set -euo pipefail

# 1) basic structure
mkdir -p assets/css _pages .github/workflows

# 2) _config.yml
cat > _config.yml << 'YAML'
title: "Kunmo Kim"
description: "High-speed SerDes • ADC-based receivers • Equalization"
remote_theme: just-the-docs/just-the-docs
color_scheme: nil          # or "dark", "light", or a custom scheme
search_enabled: true
aux_links:
  "Google Scholar":
    - "https://scholar.google.com/"
  "LinkedIn":
    - "https://www.linkedin.com/"
  "GitHub":
    - "https://github.com/yourusername"
# Navigation order
nav_external_links_new_tab: true
permalink: pretty
just_the_docs:
  navigation_depth: 2
  show_navbar: true
  collections:
    pages:
      name: Pages
      nav_exclude: false
      permalink: "/:path/"
YAML

# 3) Home page
cat > index.md << 'MD'
---
layout: default
title: Home
nav_order: 1
---

# Kunmo Kim

Ph.D. (EECS, UC Berkeley). R&D Hardware Engineer @ Broadcom PLP (Irvine, CA).  
Focus: ADC-based SerDes, nonlinear equalization (SB-DFE/MLSE), 128 GS/s receivers.

<div class="note">
<strong>Now:</strong> Final chip bring-up & measurement; manuscript targeting JSSC.
</div>

## Highlights
- 128 GS/s ADC-based SerDes Rx with advanced equalization
- ILRO-based multi-phase clocking; 8-phase jitter ~48 fs<sub>rms</sub>
- Measurement infrastructure in Python (PyVISA, custom libs)

## Quick Links
- [Projects](/projects/)
- [Publications](/publications/)
- [CV](/cv/)
MD

# 4) Content pages
cat > _pages/projects.md << 'MD'
---
layout: default
title: Projects
nav_order: 2
permalink: /projects/
---

# Projects

## 128 GS/s ADC-Based SerDes Receiver
- **Role:** Architecture, equalization, bring-up
- **Notes:** 16-way TI ADC (8 GS/s/lane), cascaded SB-DFE/MLSE
- **Artifacts:** links to code, slides, posters

## Measurement Infrastructure
- Python tools for PRBS detection, FFT-based ENOB/SNDR/SFDR, phase alignment of sub-ADCs.
MD

cat > _pages/publications.md << 'MD'
---
layout: default
title: Publications
nav_order: 3
permalink: /publications/
---

# Publications

- **Precursor ISI Cancellation with Sliding-Block DFE for High-Speed Wireline Receivers**, Journal/Conf, Year.  
- **ADC-based SerDes with Advanced Nonlinear Equalizer for 128 Gbaud/s**, Journal/Conf, Year.

> Add DOI/links when available.
MD

cat > _pages/cv.md << 'MD'
---
layout: default
title: CV
nav_order: 4
permalink: /cv/
---

# CV

Download: [PDF](/assets/Kunmo_Kim_CV.pdf)

## Experience
- **Broadcom (PLP), Irvine, CA** — R&D Hardware Engineer  
- **Apple, Oracle, Marvell** — SerDes / FEC / DSP roles

## Education
- Ph.D., EECS, UC Berkeley, 2025
- M.S., Caltech • B.S., Texas A&M
MD

# 5) Minimal style overrides (optional)
cat > assets/css/custom.css << 'CSS'
/* Example tweak: slightly wider content */
.main-content { max-width: 980px; }
CSS

# 6) Gemfile for local preview (optional but recommended)
cat > Gemfile << 'RUBY'
source "https://rubygems.org"
gem "github-pages", group: :jekyll_plugins
RUBY

# 7) .gitignore
cat > .gitignore << 'IGN'
_site/
.sass-cache/
.jekyll-cache/
.bundle/
vendor/
IGN

# 8) Optional: GitHub Actions (build w/ Pages)
cat > .github/workflows/pages.yml << 'YAML'
name: Deploy GitHub Pages
on:
  push:
    branches: ["main"]
  workflow_dispatch:
permissions:
  contents: read
  pages: write
  id-token: write
concurrency:
  group: "pages"
  cancel-in-progress: true
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/configure-pages@v5
      - uses: ruby/setup-ruby@v1
        with:
          ruby-version: "3.3"
          bundler-cache: true
      - run: bundle install
      - run: bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"
        env:
          JEKYLL_ENV: production
      - uses: actions/upload-pages-artifact@v3
        with:
          path: _site
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - id: deployment
        uses: actions/deploy-pages@v4
YAML

echo "Done. Now git init / commit / push to GitHub."

