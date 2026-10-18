# dotfiles

chezmoi で管理している設定ファイル。この README は `.chezmoiignore` で除外しているのでホームには展開されない。

## 新しいマシンでのセットアップ

1. Homebrew、chezmoi、mise を入れる
2. `brew install tree-sitter-cli`（nvim-treesitter がパーサーをビルドするのに必要）
3. mise で Node.js を入れる（`~/.config/mise/config.toml` は chezmoi 管理外なので、別途用意する）
4. `chezmoi init --apply <リポジトリ>`
   - `~/.config/textlint` の `npm ci` は chezmoi のスクリプトが実行する。Node.js がないとこのスクリプトは失敗するが、Node.js を入れてから `chezmoi apply` をやり直せば再実行される
5. nvim を起動すると、lazy.nvim がプラグインを、nvim-treesitter が設定に書いたパーサーを入れる

## textlint

共通環境とプロジェクトごとの環境を組み合わせて使う。

```
~/.config/textlint/
├── package.json        textlint 本体とルール（chezmoi 管理）
├── package-lock.json   バージョンの固定（chezmoi 管理）
├── .textlintrc.json    共通のルール設定（chezmoi 管理）
└── node_modules/       npm ci で作る（管理しない）
```

nvim（none-ls）とターミナルの `textlint` コマンド（`~/.local/bin/textlint` のラッパー）は、どちらも次の規則で選ぶ。

| 対象 | プロジェクトにあれば | なければ |
|---|---|---|
| textlint 本体 | `node_modules/.bin/textlint` | `~/.config/textlint` のもの |
| 設定 | 上のディレクトリにある `.textlintrc*` | `~/.config/textlint/.textlintrc.json` |
| ルール | プロジェクトの `node_modules` | `~/.config/textlint/node_modules` |

ふだんの文章は共通環境でチェックされる。書籍原稿など専用のルールが要るプロジェクトでは、そこに `package.json` と `.textlintrc.json` を置いて `npm install -D textlint <ルール>` する。

### ルールを追加・更新したとき

```sh
cd ~/.config/textlint
npm install -D <ルール>   # 追加。更新なら npm update
# 使うなら .textlintrc.json の rules にも書く
chezmoi add ~/.config/textlint/package.json ~/.config/textlint/package-lock.json ~/.config/textlint/.textlintrc.json
```

`package-lock.json` が変わると、ほかのマシンでは次の `chezmoi apply` で `npm ci` が自動で走る（`.chezmoiscripts/run_onchange_after_install-textlint.sh.tmpl`）。

### 注意

- textlint を mise の `npm:` で入れてはいけない。mise はパッケージごとに別ディレクトリへ入れるので、textlint 本体からルールが見えず「No rules found」になる
- `npm audit` で `sprintf-js` の脆弱性（moderate、修正版なし）が出るが、`preset-ja-technical-writing` の依存で、手元の文章を検査する用途なら実害はない

## Neovim

### nvim-treesitter

- `main` ブランチを使う。旧 `master` は Neovim 0.12 に対応していない
- パーサーは自動では入らない。`dot_config/nvim/lua/plugins/nvim-treesitter.lua` の `install({ ... })` に書いた言語が入る。試すだけなら `:TSInstall <lang>`
- パーサーがあるファイルタイプでは FileType の autocmd で tree-sitter ハイライトを有効にする。ないものは従来の syntax のまま
- LaTeX は vimtex の syntax を使うので `latex` パーサーは入れない
- 状態の確認は `:checkhealth nvim-treesitter`

### vimdoc-ja

lazy.nvim が更新後に実行する `:helptags` が `doc/tags-ja` を書き換え、次の更新が「local changes」で失敗する。`dot_config/nvim/lua/plugins/vimdoc-ja.lua` の `build` で元に戻している。

## chezmoi の注意

- `~/.local` のパーミッションは 700 なので、ソース側は `private_dot_local` にしている（`dot_local` だと 755 に変えられる）
- ルートに置いたファイルはホームに展開されるので、README のような説明用ファイルは `.chezmoiignore` に書く
