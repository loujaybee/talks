# Presentation Server

This repository contains a simple web server setup to serve markdown presentations as HTML using reveal.js.

## Setup

The project uses a Docker container with all necessary dependencies. To rebuild the Gitpod environment with the required packages:

1. Commit and push any changes to your repository
2. Restart your Gitpod workspace to rebuild the container

## Usage

To serve your presentation:

1. Make sure your presentation is located at `dx-day-2025/presentation.md`
2. Run the server script:

```bash
./serve.sh
```

3. Open your browser to `http://localhost:8080` or use the Gitpod preview

The server will:
- Convert your markdown to HTML using pandoc with reveal.js
- Serve the HTML on port 8080
- Watch for changes to the presentation.md file
- Automatically rebuild and refresh the browser when changes are detected

## Troubleshooting

If you encounter issues with the pandoc template, make sure:
1. The Docker container has been rebuilt with the latest changes
2. The reveal.js template is properly installed in `/usr/share/pandoc/data/templates/`
3. The reveal.js library is correctly copied to the output directory

## Dependencies

The server uses:
- pandoc - for markdown to HTML conversion
- reveal.js - for presentation styling
- live-server - for serving with auto-refresh
- inotify-tools - for file change detection

These are all installed in the Docker container. 