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
