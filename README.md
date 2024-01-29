# machine-migration

PC の移行に関する TODO など

> [!NOTE]
> 移行直前に現在の設定等を見直し、必要であれば追記などすること

## install

- [brew](https://brew.sh/ja/)

```sh
brew install git nvm goenv yarn peco jq docker rbenv mysql
brew install --cask warp graphql-playground google-chrome docker \
     clipy figma slack 1password visual-studio-code meetingbar \
     sequel-ace
```

## VS Code

まずは `code` コマンドを使えるようにする

https://code.visualstudio.com/docs/setup/mac

### 設定ファイル

- ~/Library/ApplicationSupport/Code/User/settings.json
- ~/Library/ApplicationSupport/Code/User/keybindings.json

### 拡張機能

一覧が `extensions.txt` にあるので以下コマンドでインポートする

```sh
cat extensions.txt | xargs -L 1 code --install-extension
```

## その他

- .env
  - AirDrop でやっちゃう
