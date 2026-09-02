# Jira Snippet

<p align="center">
  <img src="./icons/logo_banner.png" alt="Jira Snippet Logo">
</p>

<p align="center">
  <strong>Quick copy browser extension for customizable Jira issue data</strong>
</p>

## Overview

Jira Snippet is a browser extension that streamlines your Jira workflow by allowing you to quickly copy issue information in a customizable format with one click. Whether you need the issue ID, title, status, or other fields, this extension makes it easy to capture exactly what you need.

## Features

- **One-Click Copy**: Copy Jira issue data directly from any Jira page
- **Customizable Format**: Define your own output format using placeholders
- **Link Generation**: Optionally create clickable links to Jira tickets
- **Context Menu Integration**: Right-click support for quick access
- **Multiple Data Fields**: Access key, title, description, type, priority, status, reporter, assignee, and URL

## Supported Platforms

- **Browsers**: Chrome, Firefox, Edge, Opera
- **Jira**: Jira Cloud (atlassian.net, atlassian.com)

## Installation

### From a release zip (recommended for most people)

1. Download `jira-snippet-<version>.zip` from the [Releases page](https://github.com/StoneyWu/Jira-Snippet/releases)
2. Unzip it into a folder you intend to keep — Chrome loads the extension from
   this folder every time it starts, so don't delete it afterwards
3. Open `chrome://extensions/` (Edge: `edge://extensions/`)
4. Turn on **Developer mode** (toggle in the top-right corner)
5. Click **Load unpacked** and select the unzipped folder

To update later, download the new zip, replace the folder contents, and click
the refresh icon on the extension card.

> Chrome and Edge only allow one-click `.crx` installs for extensions hosted in
> their web stores, so the unpacked-folder route above is the way to sideload
> this one. See [Publishing](#publishing-to-a-store) for the one-click option.

### From source

1. Clone this repository
2. Open `chrome://extensions/`, enable **Developer mode**
3. Click **Load unpacked** and select the repository directory

## Building

`build.sh` produces a clean, store-ready zip containing only the files the
browser loads (no `.git`, `.DS_Store`, README, or CI config):

```bash
./build.sh
# -> dist/jira-snippet-2.4.zip
```

The name and version in the filename both come from `manifest.json`, so
bumping the version there is all a release needs.

Pushing a `v*` tag builds the same zip in CI and attaches it to a GitHub
Release automatically:

```bash
git tag v2.4 && git push origin v2.4
```

> This repository is a fork, and GitHub disables Actions on forks by default.
> Enable it once under **Settings → Actions → General** before the tag will
> build anything.

### Reusing this setup in another extension

Both files are written to be portable. Copy `build.sh` and
`.github/workflows/release.yml` into another Manifest V3 extension and edit
one line: the `FILES` array at the top of `build.sh`, listing the paths that
extension actually ships.

The workflow needs no edits at all — its only assumption is that `./build.sh`
exists and writes to `dist/*.zip`.

`FILES` is an explicit allowlist rather than a set of exclusions on purpose: a
forgotten entry breaks the extension immediately and visibly, while a
forgotten exclusion quietly publishes private files to a public store.

## Publishing to a store

Publishing gives users a real one-click install plus automatic updates. The zip
from `build.sh` is what each store wants:

| Store | Cost | Notes |
| --- | --- | --- |
| [Chrome Web Store](https://chrome.google.com/webstore/devconsole) | one-time $5 developer fee | Review typically takes a few days; also covers Chrome-based browsers via manual install |
| [Edge Add-ons](https://partner.microsoft.com/dashboard/microsoftedge) | free | Accepts the same Chrome MV3 zip |
| [Firefox Add-ons (AMO)](https://addons.mozilla.org/developers/) | free | Requires signing; add a `browser_specific_settings.gecko.id` to `manifest.json` first |

Each store also needs a listing: an icon, at least one screenshot, a short
description, and a privacy justification for the `storage` and `contextMenus`
permissions.

## Usage

### Configure Output Format

1. Click the Jira Snippet icon in your browser toolbar
2. Click the settings button (⚙️)
3. Customize your output format using placeholders:
   - `{key}` - Issue key (e.g., ABC-123)
   - `{title}` - Issue title/summary
   - `{description}` - Issue description
   - `{type}` - Issue type (e.g., Bug, Task, Story)
   - `{priority}` - Issue priority
   - `{status}` - Issue status
   - `{reporter}` - Reporter's display name
   - `{assignee}` - Assignee's display name
   - `{url}` - Issue URL
4. Enable "Create a link to the Jira ticket" if you want clickable links
5. Click "Save"

### Copy Issue Data

1. Navigate to any Jira issue page
2. Click the copy button that appears on the page
3. The formatted issue data is now in your clipboard

## Example Formats

- Default: `[{key}] {title}`
- With URL: `{key}: {title} - {url}`
- Detailed: `[{key}] {title} | Status: {status} | Assignee: {assignee}`

## Version

Current version: **2.4**

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Repository

[https://github.com/daemonLibra/JiraIssueCopyData](https://github.com/daemonLibra/JiraIssueCopyData)

## Author

Created by [@daemonLibra](https://github.com/daemonLibra)

## License

See the repository for license information.
