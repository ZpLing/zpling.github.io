# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an academic personal homepage (AcadHomepage) built with Jekyll, hosted on GitHub Pages. The site belongs to Zipeng Ling and features auto-syncing Google Scholar citation metrics via GitHub Actions.

## Development Commands

```bash
# Install Ruby dependencies
bundle install

# Start local dev server with live reload at http://127.0.0.1:4000
bash run_server.sh

# Run SEO diagnostics
bash check_seo.sh

# Install Python dependencies for Google Scholar crawler
pip3 install -r google_scholar_crawler/requirements.txt
```

There are no tests. The site is automatically built and deployed to GitHub Pages on push to main.

## Architecture

**Content:** `_pages/about.md` is the primary homepage content. Rendered through `_layouts/default.html`, which includes `_includes/author-profile.html` as the sidebar.

**Configuration:** `_config.yml` is the central config — site title, author info (name, avatar, email, social links, CV path), Google Scholar stats settings, and SEO verification codes all live here.

**Styling:** `_sass/` source files are compiled by Jekyll into `assets/css/`. Do not edit `assets/css/` directly.

**Google Scholar Integration:** A GitHub Actions workflow (`.github/workflows/google_scholar_crawler.yaml`) runs `google_scholar_crawler/main.py` daily, writing citation data as JSON to the `google-scholar-stats` branch. `_includes/fetch_google_scholar_stats.html` fetches this data at page load via CDN. Requires `GOOGLE_SCHOLAR_ID` secret set in GitHub repository settings.

**Navigation:** Configured in `_data/navigation.yml`.

**Static assets:** Images in `images/`, downloadable files (CV, etc.) in `files/`.
