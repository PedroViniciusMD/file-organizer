# Automated File Organizer

A lightweight, Bash script designed to clean my up messy directories (like Downloads folder) by automatically sorting files into categorized folders based on their extensions. It runs seamlessly on both macOS and Linux.

## Features

- **Smart Categorization:** Groups files into `images`, `videos`, `musics`, `docs`, `slides`, and `others`.
- **Case-Insensitive Matching:** Correctly handles extensions regardless of casing (e.g., `.JPG`, `.png`, `.Pdf`).
- **Session Logging:** Generates execution reports with execution runtime metrics, machine hostname, and user info.
- **Isolated History:** Reports are saved inside a prioritized `_reports/` folder using unique timestamps to prevent overwriting.

## Folder Structure After Execution

```text
Target Directory/
├── _reports/
│   ├── report.txt                 # Stored GitHub Template
│   └── report_00000000_000000.log   # Unique execution logs (git-ignored)
├── docs/
├── images/
├── musics/
├── slides/
├── videos/
└── others/
