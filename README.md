
I will update your MacOS machine with Better™ system defaults, preferences, software configuration and even auto-install some handy development tools and apps that my developer friends find helpful.

You don't need to install or configure anything upfront! This works with a brand-new machine from the factory as well as an existing machine that you've been working with for years.


- [Forget About Manual Configuration!](#forget-about-manual-configuration)
- [Watch me run!](#watch-me-run)
- [Installation](#installation)
  - [Restoring Dotfiles](#restoring-dotfiles)

# Forget About Manual Configuration!

Don't you hate getting a new laptop or joining a new team and then spending a whole day setting up your system preferences and tools? Me too. That's why we automate; we did it once and we don't want to do have to do it again.

When I finish with your machine, you will be able to look at your command-line in full-screen mode like this (running iTerm):

![iTerm Screenshot](https://raw.githubusercontent.com/alperhankendi/dotfiles//term.png)

Check out how your shell prompt includes the full path, node.js version & the working git branch along with a lot of other info!
We use powerlevel9k for command prompt, so customization of what you want is easily changable in `./.zshrc`
The top terminal is using vim as a full replacement IDE.
The bottom left two are git terminals.
The bottom right is running `vtop`

To launch fullscreen, hit `Command + Enter` in iTerm, then use `Command + d` and `Command + D` to create split panes.


\\[._.]/ - I'm so excited I just binaried in my pants!

# Watch me run!
![Running](http://media.giphy.com/)

# Installation

> Note: I recommend forking this repo in case you don't like anything I do and want to set your own preferences (and pull request them!)

```bash
git clone --recurse-submodules https://github.com/alperhankendi/dotfiles ~/.dotfiles
cd ~/.dotfiles;
# run this using terminal (not iTerm, lest iTerm settings get discarded on exit)
./install.sh
```
* When it finishes, open iTerm and press `Command + ,` to open preferences. Under Profiles > Colors, select "Load Presets" and choose the `Solarized Dark Patch` scheme. If it isn't there for some reason, import it from `~/.dotfiles/configs` -- you may also need to select the `Hack` font and check the box for non-ascii font and set to `Roboto Mono For Powerline` (I've had mixed results for automating these settings--love a pull request that improves this)
* I've also found that you need to reboot before fast key repeat will be enabled

> Note: running install.sh is idempotent. You can run it again and again as you add new features or software to the scripts! I'll regularly add new configurations so keep an eye on this repo as it grows and optimizes.

## Restoring Dotfiles

If you have existing dotfiles for configuring git, zsh, vim, etc, these will be backed-up into `~/.dotfiles_backup/$(date +"%Y.%m.%d.%H.%M.%S")` and replaced with the files from this project. You can restore your original dotfiles by using `./restore.sh $RESTOREDATE` where `$RESTOREDATE` is the date folder name you want to restore.

> The restore script does not currently restore system settings--only your original dotfiles. To restore system settings, you'll need to manually undo what you don't like (so don't forget to fork, review, tweak)




[submodule "oh-my-zsh"]
path = oh-my-zsh
url = git://github.com/robbyrussell/oh-my-zsh.git
[submodule "z-zsh"]
path = z-zsh
url = git://github.com/sjl/z-zsh.git
[submodule "homedir/.vim/bundle/Vundle.vim"]
path = homedir/.vim/bundle/Vundle.vim
url = git://github.com/VundleVim/Vundle.vim.git
