# dotfiles

```bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
 
 find . -type d \( -path "*/node_modules" -o -path "*/.git" -o -path "*/dist" -o -path "*/public" \) -prune -o -type d -print0 | while IFS= read -r -d '' dir; do
   echo -e "${GREEN}Directory:${NC} ${YELLOW}$dir${NC}"

# Only list non-directory files in the current directory
echo -e "${RED}"
find "$dir" -maxdepth 1 -type f -exec ls -l {} +
echo -e "${NC}"
done
```

```bash
vim $(fzf)
```

```vim
:set completeopt-=popup
:set completeopt+=popup
```

```vim
:@: to run last command
```


Ack instead of grep for code search

ack -irl userfloorplan
vim $(find . -name “file.ending”)

let g:ycm_show_diagnostics_ui = 1

`“+y` to copy to clipboard

:lopen to open errors in current buffer
:ALEDetail


Control m comments out code
Control n selects the current word many times



@: to run last : command
@c to run last c command

Nerdfont https://webinstall.dev/nerdfont/
 
 In item2
