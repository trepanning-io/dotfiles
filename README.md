# Trepanning.io's dotfiles

## Requirements

None. Well, as little as possible for the initial bootstrap.

As much as possible an initial installation will require the user to add zero apps.

## Install on Mac

Run this command.

```bash
curl -fsSL https://raw.githubusercontent.com/trepanning-io/dotfiles/master/install.sh | bash
```

The install process takes care of the bootstrapping, installing all necessary tools needed to reliably install the user/dev tools.

It also cleans itself up removing the bootstrap tools if they are not system standard. A prime example is Ansible running on the system Python. While an installation of Ansible maybe performed the version of Ansible installed during the bootstrapping is removed.

## Generate Brewfile

To generate the [Brewfile](Brewfile) from an existing system use

```bash
brew bundle dump
```

This will create a `Brewfile` in that directory.

## zsh Configurations

Additional zsh configuration can go under the `~/dotfiles-local/zsh/configs` directory. This
has two special subdirectories: `pre` for files that must be loaded first, and
`post` for files that must be loaded last.

For example, `~/dotfiles-local/zsh/configs/pre/virtualenv` makes use of various shell
features which may be affected by your settings, so load it first:

    # Load the virtualenv wrapper
    . /usr/local/bin/virtualenvwrapper.sh

Setting a key binding can happen in `~/dotfiles-local/zsh/configs/keys`:

    # Grep anywhere with ^G
    bindkey -s '^G' ' | grep '

Some changes, like `chpwd`, must happen in `~/dotfiles-local/zsh/configs/post/chpwd`:

    # Show the entries in a directory whenever you cd in
    function chpwd {
      ls
    }

This directory is handy for combining dotfiles from multiple teams; one team
can add the `virtualenv` file, another `keys`, and a third `chpwd`.

The `~/dotfiles-local/zshrc.local` is loaded after `~/dotfiles-local/zsh/configs`.

## vim Configurations

Similarly to the zsh configuration directory as described above, vim
automatically loads all files in the `~/dotfiles-local/vim/plugin` directory. This does not
have the same `pre` or `post` subdirectory support that our `zshrc` has.

This is an example `~/dotfiles-local/vim/plugin/c.vim`. It is loaded every time vim starts,
regardless of the file name:

    # Indent C programs according to BSD style(9)
    set cinoptions=:0,t0,+4,(4
    autocmd BufNewFile,BufRead *.[ch] setlocal sw=0 ts=8 noet

## What's in it?

[vim](http://www.vim.org/) configuration:

* [Ctrl-P](https://github.com/ctrlpvim/ctrlp.vim) for fuzzy file/buffer/tag finding.
* [Rails.vim](https://github.com/tpope/vim-rails) for enhanced navigation of
  Rails file structure via `gf` and `:A` (alternate), `:Rextract` partials,
  `:Rinvert` migrations, etc.
* Run many kinds of tests [from vim]([https://github.com/janko-m/vim-test)
* Set `<leader>` to a single space.
* Switch between the last two files with space-space.
* Syntax highlighting for Markdown, HTML, JavaScript, Ruby, Go, Elixir, more.
* Use [Ag](https://github.com/ggreer/the_silver_searcher) instead of Grep when
  available.
* Map `<leader>ct` to re-index [Exuberant Ctags](http://ctags.sourceforge.net/).
* Use [vim-mkdir](https://github.com/pbrisbin/vim-mkdir) for automatically
  creating non-existing directories before writing the buffer.
* Use [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins.

[tmux](http://robots.thoughtbot.com/a-tmux-crash-course)
configuration:

* Improve color resolution.
* Remove administrative debris (session name, hostname, time) in status bar.
* Set prefix to `Ctrl+s`
* Soften status bar color from harsh green to light gray.

[git](http://git-scm.com/) configuration:

* Adds a `create-branch` alias to create feature branches.
* Adds a `delete-branch` alias to delete feature branches.
* Adds a `merge-branch` alias to merge feature branches into master.
* Adds an `up` alias to fetch and rebase `origin/master` into the feature
  branch. Use `git up -i` for interactive rebases.
* Adds `post-{checkout,commit,merge}` hooks to re-index your ctags.
* Adds `pre-commit` and `prepare-commit-msg` stubs that delegate to your local
  config.
* Adds `trust-bin` alias to append a project's `bin/` directory to `$PATH`.

[Ruby](https://www.ruby-lang.org/en/) configuration:

* Add trusted binstubs to the `PATH`.
* Load the ASDF version manager.

Shell aliases and scripts:

* `b` for `bundle`.
* `g` with no arguments is `git status` and with arguments acts like `git`.
* `migrate` for `rake db:migrate && rake db:rollback && rake db:migrate`.
* `mcd` to make a directory and change into it.
* `replace foo bar **/*.rb` to find and replace within a given list of files.
* `tat` to attach to tmux session named the same as the current directory.
* `v` for `$VISUAL`.

## Thanks

The origin of this repo is from thoughtbot. Many modifications have been made since then.

Thank you, [thoughtbot contributors](https://github.com/thoughtbot/dotfiles/contributors)!
Also, thank you to Corey Haines, Gary Bernhardt, and others for sharing your
dotfiles and other shell scripts from which we derived inspiration for items
in this project.
