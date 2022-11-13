# second-brain-scripts

Shell scripts for managing a second brain

## Usage

### Import markdown notes from Android

Pull all markdown files from a specific folder on your Android device. For each file we create a new file or append to existing file in the destination folder. Lastly delete the remote markdown files, but keep any other file types.

```bash
# Usage
./import_markdown_from_android.sh <remote-folder> <destination-folder>
```

```bash
# Example
# Append all of my daily obsidian vault files to my logseq vault
./import_markdown_from_android.sh /sdcard/documents/obsidian_vault /users/trey/logseq_vault/journals
```
