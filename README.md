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

### From Source
1. Clone this repository
2. Open your browser's extension management page:
   - Chrome: `chrome://extensions/`
   - Firefox: `about:addons`
   - Edge: `edge://extensions/`
3. Enable "Developer mode"
4. Click "Load unpacked" and select the extension directory

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
