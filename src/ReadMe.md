
### Install xclip if necessary.

    sudo apt-get install xclip xdotool

### To use, extract and move the folder .quicksnips to your home directory.
### The .quicksnips will be hidden when first extracted. ctrl+h toshow hidden.

### Make the scripts executable...
    chmod +x src/quicksnips.sh src/snip2clip.sh

### run
    ./src/quicksnips.sh

### Open the dash and search for "quicksnips" and drag and drop to the launcher
### or
### open the file browser and and drag and drop  ~/.local/share/applications/quicksnips.desktop.

### Right clicking the quicksnips icon shows the quicklist.

### Left clicking on the launcher icon opens src/snippets.txt
### where you can add your snippets.
### A snippet can be a phrase or single word.
### Use one snippet per line remembering that 
### the length of the snippet will determine the width of the quicklist window.
### The snippets will be sorted alphabetically.
### Save.

### Right click on launcher and select Update Launcher.
### Right click again to see your newly added snippets.

### You can use the quicklist item "Add Clipboard Content" to add content from the   
### clipboard copy/paste buffer and update the launcher.

### The snippets are sent to the "-selection clipboard" and parse it into the current window
