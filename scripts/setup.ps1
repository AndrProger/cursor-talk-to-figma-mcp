# Create .cursor directory if it doesn't exist
New-Item -ItemType Directory -Force -Path .cursor

# Install dependencies
bun install

# Create mcp.json with the current directory path
$mcpConfig = @"
{
  "mcpServers": {
    "TalkToFigma": {
      "command": "bunx",
      "args": [
        "cursor-talk-to-figma-mcp"
      ]
    }
  }
}
"@

$mcpConfig | Out-File -FilePath .cursor/mcp.json -Encoding UTF8 