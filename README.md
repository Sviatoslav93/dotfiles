```
oh-my-posh init pwsh --config "$HOME\.poshthemes\theme.omp.json" | Invoke-Expression

 # PSReadLine configuration
  Import-Module PSReadLine
  Set-PSReadLineOption -PredictionSource History
  Set-PSReadLineOption -PredictionViewStyle ListView
  Set-PSReadLineOption -EditMode Windows
  Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
  Set-PSReadLineOption -MaximumHistoryCount 5000


  # z (smart directory jumping)
  Import-Module z

  # posh-git (Git status in prompt)
  Import-Module posh-git

  # PSFzf - Fuzzy finder
  Import-Module PSFzf
  Set-PsFzfOption `
    -EnableAliasFuzzyHistory `
    -EnableAliasFuzzyZLocation `
    -EnableAliasFuzzyGitStatus `
    -EnableAliasFuzzySetLocation

  # Terminal Icons
  Import-Module Terminal-Icons

function hist {
    param([string]$Pattern)
    Get-Content (Get-PSReadLineOption).HistorySavePath | Select-String $Pattern
}

# fastfetch
```

```

{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "palette": {
        "pink": "#F5C2E7",
        "lavender": "#B4BEFE",
        "blue":  "#89B4FA"
  },
  "blocks": [
    {
      "alignment": "left",
      "segments": [
        {
          "foreground": "p:blue",
          "style": "plain",
          "template": "{{ .UserName }}@{{ .HostName }} ",
          "type": "session"
        },
        {
          "foreground": "p:pink",
          "properties": {
            "folder_icon": "..\ue5fe..",
            "home_icon": "~",
            "style": "agnoster_short"
          },
          "style": "plain",
          "template": "{{ .Path }} ",
          "type": "path"
        },
        {
          "foreground": "p:lavender",
          "properties": {
            "branch_icon": "\ue725 ",
            "cherry_pick_icon": "\ue29b ",
            "commit_icon": "\uf417 ",
            "fetch_status": false,
            "fetch_upstream_icon": false,
            "merge_icon": "\ue727 ",
            "no_commits_icon": "\uf0c3 ",
            "rebase_icon": "\ue728 ",
            "revert_icon": "\uf0e2 ",
            "tag_icon": "\uf412 "
          },
          "template": "{{ .HEAD }} ",
          "style": "plain",
          "type": "git"
        }
      ],
      "type": "prompt"
    },
     {
        "alignment": "left",
        "newline": true,
             "segments": [
        {
          "foreground": "p:pink",
          "style": "plain",
          "template": "{{if .Root }}\uf292{{ else }}\uf155{{ end }} ",
          "type": "text"
        }
      ],
        "type": "prompt"
      }
  ],
  "final_space": true,
  "version": 3
}

```


```
Install-Module posh-git -Scope CurrentUser -Force
Install-Module PSFzf -Scope CurrentUser -Force
Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser -Force
Install-Module z -Scope CurrentUser -Force
```



```
    " .vsvimrc - VsVim configuration file

" Basic settings
set ignorecase
set smartcase
set incsearch
set hlsearch

" Leader key
let mapleader=" "

" go to normal mode
inoremap jk <Esc>
inoremap jj <Esc>

" keep search results in the center of the screen
nnoremap n nzz
nnoremap N Nzz

" fast moving
nnoremap J 8j
nnoremap K 8k
nnoremap <leader>j J

" comments
nnoremap <leader>/ :vscmd Edit.ToggleLineComment<CR>
xnoremap <leader>/ :vscmd Edit.ToggleLineComment<CR>

" Basic mappings
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" navigation mappings
nnoremap gd :vsc Edit.GoToDefinition<CR>
nnoremap gi :vsc Edit.GoToImplementation<CR>
nnoremap pd :vsc Edit.PeekDefinition<CR>
nnoremap fr :vsc Edit.FindAllReferences<CR>

"nnoremap <C-p> :vsc View.NavigateBackward<CR>
"nnoremap <C-n> :vsc View.NavigateForward<CR>

" refactoring
nnoremap <Leader>r :vscmd Refactor.Rename<CR>
nnoremap <Leader>a :vsc Refactor.QuickActions<CR>
nnoremap <Leader>f :vsc Edit.FormatDocument<CR>
nnoremap <Leader>fr :vsc Edit.FindAllReferences<CR>

" debugging
map <Leader>b :vsc Debug.ToggleBreakpoint<CR>

" others
map <Leader>k :vsc Window.PinTab<CR>
map <Leader>ot :vsc Window.KeepTabOpen<CR>

" Show parameter and quick info
map <Leader>sp :vsc Edit.ParameterInfo<CR>
map <Leader>p :vsc Edit.ParameterInfo<CR>
map <Leader>si :vsc Edit.QuickInfo<CR>
map <Leader>i :vsc Edit.QuickInfo<CR>

" add empty lines with no insert mode
nmap <S-enter> O<Esc>
nmap <enter> o<Esc>

" H/L is more natural than 0/$
map H ^
map L $

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Multi-cursor (VS)
nnoremap <leader>d :vscmd Edit.AddNextOccurrence<CR>
nnoremap <leader>D :vscmd Edit.AddPreviousOccurrence<CR>
nnoremap <leader>A :vscmd Edit.SelectAllOccurrences<CR>

nnoremap s :vsc Tools.InvokePeasyMotion<CR>

nnoremap <leader>m :vscmd Edit.ToggleBookmark<CR>
nnoremap ]m :vscmd Edit.NextBookmark<CR>
nnoremap [m :vscmd Edit.PreviousBookmark<CR>
nnoremap <leader>M :vscmd View.BookmarkWindow<CR>

" substitude
nnoremap <leader>s :%s/\<<C-r><C-w>\>/new/gc

```
