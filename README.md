# second-brain-scripts

Shell scripts for managing a second brain

## Usage

### Import markdown notes from Android

Pulls all markdown files `*.md` from a specific folder on a Android device and then merges these files into a destination folder. After merging, the remote markdown files are deleted.

I use this script to pull daily notes from my Obsidian.md vault on my Android phone and merge them into my logseq journals folder.

```bash
# Usage
./import_markdown_from_android.sh <remote-folder> <destination-folder>
```

```bash
# Example
# Append all of my daily obsidian vault files to my logseq vault
./import_markdown_from_android.sh /sdcard/documents/obsidian_vault /users/trey/logseq_vault/journals
```
