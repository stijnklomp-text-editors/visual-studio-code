# Visual Studio Code config

## Setup

1. Install [VSCode](https://code.visualstudio.com/download)
2. Clone this repo, rename it to `Code` and copy it into `~/.config/Code`
```sh
git clone git@github.com:stijnklomp-text-editors/visual-studio-code.git
mv visual-studio-code Code
mkdir -p ~/.config
cp -r ./Code ~/.config/Code
```

## Install

Take the contents of `./repoInstructions/User/globalStorage/storage.json` and
put it in `./User/globalStorage/storage.json`. (Create that file if it doesn't
exist already) You should append the array elements if there is already an array
value present for key "userDataProfiles".
