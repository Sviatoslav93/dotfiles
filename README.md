# dotfiles
configuration files


idea vim

```
"" .ideavimrc - Matt Chapman


"" Base Settings
"" ========================================================

set scrolloff=10
set linenumber
set showmode
set showcmd

set smartcase
set incsearch
set hlsearch

set visualbell

" Use system clipboard
set clipboard+=unnamed   

let mapleader = " "

"" Plugin Settings
"" ========================================================

set surround
set highlightedyank
set sneak
set nerdtree

" Easymotion settings
set easymotion
set notimeout

" Which-key settings
set which-key
let g:WhichKey_FontSize = 16
let g:WhichKey_CommandColor = "#41ead4"
let g:WhichKey_PrefixColor = "#f335b2"
let g:WhichKey_SortOrder = "by_key_prefix_first"

let g:WhichKeyDesc_leader = "<leader> Leader key"

let g:WhichKeyDesc_leader = "<leader>x Open file explorer"

let g:WhichKeyDesc_easymotion = "<leader>j Jump with Easymotion"
let g:WhichKeyDesc_easymotion_prefix = "<leader><leader>"

let g:WhichKeyDesc_comment = "<leader>c Comment line"

let g:WhichKeyDesc_fold = "<leader>z Folding"
let g:WhichKeyDesc_fold_all = "<leader>zc Fold all regions"
let g:WhichKeyDesc_unfold_all = "<leader>zo Unfold all regions"

let g:WhichKeyDesc_window = "<leader>w Window splits"
let g:WhichKeyDesc_window_split_vertically = "<leader>wv Split vertically"
let g:WhichKeyDesc_window_split_horizontally = "<leader>wh Split horizontally"
let g:WhichKeyDesc_window_split_unsplit = "<leader>wu Unsplit"
let g:WhichKeyDesc_window_split_move_editor = "<leader>wm Move editor to opposite tab group"


let g:WhichKeyDesc_display = "<leader>d Display options"
let g:WhichKeyDesc_zen_mode = "<leader>dz Toggle Zen mode"
let g:WhichKeyDesc_df_mode = "<leader>dd Toggle Distraction-Free mode"
let g:WhichKeyDesc_fullscreen = "<leader>df Toggle full screen"

let g:WhichKeyDesc_action= "<leader>a Actions"
let g:WhichKeyDesc_action_context_menu = "<leader>am Open context menu"
let g:WhichKeyDesc_action_search = "<leader>as Open command modal"

let g:WhichKeyDesc_file_quickLook = "<leader><leader> Recent files"

let g:WhichKeyDesc_file_nav = "<leader>f File navigation"
let g:WhichKeyDesc_file_nav_goto_file = "<leader>ff Go to file"
let g:WhichKeyDesc_file_nav_goto_content = "<leader>fc Search for file content"
let g:WhichKeyDesc_file_nav_show_recent_files = "<leader>fr Show recent files"
let g:WhichKeyDesc_file_nav_show_recent_locations = "<leader>fl Show recent locations"

let g:WhichKeyDesc_close_tab = "<leader>q Close active tab"

let g:WhichKeyDesc_refactoring = "<leader>r Refactoring menu"
let g:WhichKeyDesc_refactoring_rename = "<leader>rn Rename element"
let g:WhichKeyDesc_refactoring_method = "<leader>rm Extract method"
let g:WhichKeyDesc_refactoring_variable = "<leader>rv Introduce variable"
let g:WhichKeyDesc_refactoring_field = "<leader>rf Introduce field"
let g:WhichKeyDesc_refactoring_signature = "<leader>rs Change signature"
let g:WhichKeyDesc_refactoring_all = "<leader>rr Open refactorings list"

let g:WhichKeyDesc_goto = "<leader>g Go to X"
let g:WhichKeyDesc_goto_declaration = "<leader>gd Go to Definition"
let g:WhichKeyDesc_goto_type_declaration = "<leader>gy Go to Type Definition"
let g:WhichKeyDesc_goto_implementation = "<leader>gi Go to Implementation"
let g:WhichKeyDesc_goto_usages = "<leader>gu Go to Usages"
let g:WhichKeyDesc_goto_test = "<leader>gt Go to Test"
let g:WhichKeyDesc_goto_back = "<leader>gb Go Back"
let g:WhichKeyDesc_goto_forward = "<leader>gf Go Forward"

let g:WhichKeyDesc_git = "<leader>g Git operations"
let g:WhichKeyDesc_git_commit = "<leader>gc Open Git commit dialog"
let g:WhichKeyDesc_git_status = "<leader>gs Open Git status dialog"
let g:WhichKeyDesc_git_branches = "<leader>gb Open Git branches list"

let g:WhichKeyDesc_errors = "<leader>e Error navigation"
let g:WhichKeyDesc_errors_next = "<leader>en Go to next error in solution"
let g:WhichKeyDesc_errors_prev = "<leader>ep Go to previous error in solution"


"" Key mappings
"" ========================================================

inoremap jk <Esc>

" Tab navigation
nnoremap <A-n> :tabnext<CR>
nnoremap <A-p> :tabprev<CR>

" Pane navigation
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
nnoremap <A-k> <C-w>k
nnoremap <A-j> <C-w>j

" Jump between methods
nnoremap [[ <Action>(MethodUp)
nnoremap ]] <Action>(MethodDown)

" Easy visual indentation
vnoremap < <gv
vnoremap > >gv

" Execute macro saved in 'q' register
nnoremap qj @q

" Popup navigation
inoremap <C-j> <Action>(PopupMenu-selectNext)
inoremap <C-k> <Action>(PopupMenu-selectPrev)


"" Leader commands
"" ========================================================

" Comment lines
map <leader>c <action>(CommentByLineComment)

" Jump around with easymotion
map <leader>j <Plug>(easymotion-s)

" Open NERDTree (use q to exit)
map <leader>x :NERDTreeToggle<CR>

" Folding
map <leader>zc :action CollapseAllRegions<CR>
map <leader>zo :action ExpandAllRegions<CR>

" Window splits
map <leader>wv <Action>(SplitVertically)
map <leader>ws <Action>(SplitHorizontally)
map <leader>wu <Action>(Unsplit)
map <leader>wm <Action>(MoveEditorToOppositeTabGroup)

" Display options
map <leader>dd <action>(ToggleDistractionFreeMode)
map <leader>dz <action>(ToggleZenMode)
map <leader>df <action>(ToggleFullScreen)

" Actions
map <leader>am <action>(ShowIntentionActions)
map <leader>as <action>(SearchEverywhere)

" File navigation
map <leader>ff <action>(GotoFile)
map <leader>fr <action>(RecentFiles)
map <leader>fc <action>(FindInPath)
map <leader><leader> <Action>(RecentFiles)
map <leader>fl <action>(RecentLocations)
map <leader>fs <action>(NewScratchFile)

" Close active tab
map <leader>q <action>(CloseContent)

" Refactoring
map <leader>rn <Action>(RenameElement)
map <leader>rm <Action>(ExtractMethod)
map <leader>rv <Action>(IntroduceVariable)
map <leader>rf <Action>(IntroduceField)
map <leader>rs <Action>(ChangeSignature)
map <leader>rr <Action>(Refactorings.QuickListPopupAction)

" Go to code
nmap <leader>gd <Action>(GotoDeclaration)
nmap <leader>gy <Action>(GotoTypeDeclaration)
nmap <leader>gi <Action>(GotoImplementation)
nmap <leader>gu <Action>(ShowUsages)
nmap <leader>gt <Action>(GotoTest)
nmap <leader>gf <Action>(Back)
nmap <leader>gb <Action>(Forward)

" Git windows
map <leader>gc <Action>(CheckinProject)
map <leader>gs <Action>(ActivateVersionControlToolWindow)
map <leader>gb <Action>(Git.Branches)

" Errors
map <leader>en <Action>(ReSharperGotoNextErrorInSolution)
map <leader>ep <Action>(ReSharperGotoPrevErrorInSolution)

" Move faster in normal mode (Ctrl + J/K to move 10 lines)
nnoremap <C-j> 10j
nnoremap <C-k> 10k

```

```
#!/bin/bash

# Оновлення системи
echo "Оновлення системи..."
sudo dnf update -y

# Встановлення базових утиліт
echo "Встановлення основних утиліт..."
sudo dnf install -y git curl wget unzip htop neofetch nano vim

# Встановлення GNOME Tweaks та редактора конфігурацій
echo "Встановлення GNOME Tweaks..."
sudo dnf install -y gnome-tweaks dconf-editor gparted

# Встановлення RPM Fusion (для кодеків, драйверів NVIDIA)
echo "Додавання репозиторіїв RPM Fusion..."
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Встановлення Flathub
echo "Додавання репозиторію Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Встановлення браузерів
echo "Встановлення Firefox і Google Chrome..."
sudo dnf install -y firefox
flatpak install flathub com.google.Chrome

# Встановлення інструментів для розробки
echo "Встановлення інструментів для розробки..."
sudo dnf install -y gcc g++ make cmake clang binutils
sudo dnf install -y dotnet-sdk-8.0
sudo dnf module install -y nodejs:20
sudo dnf install -y python3 python3-pip
sudo dnf install -y java-17-openjdk-devel
sudo dnf install -y podman podman-docker

# Встановлення VS Code
echo "Встановлення Visual Studio Code..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y code

# Встановлення Python Virtualenv
echo "Встановлення Python Virtualenv..."
sudo dnf install -y python3-virtualenv

# Встановлення Tmux, zsh
echo "Встановлення Tmux і zsh..."
sudo dnf install -y zsh tmux

# Встановлення Flatpak-додатків
echo "Встановлення Flatpak-додатків..."
flatpak install flathub com.slack.Slack
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client
flatpak install flathub com.getpostman.Postman
flatpak install flathub org.gnome.Boxes

echo "Інсталяція завершена! Не забудьте перезавантажити систему!"

```
