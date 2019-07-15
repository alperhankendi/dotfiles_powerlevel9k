module.exports = {
  brew: [
    // alternative to `cat`: https://github.com/sharkdp/bat
    'bat',
    // Install GNU core utilities (those that come with macOS are outdated)
    // Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    'coreutils',
    // upgrade grep so we can get things like inverted match (-v)
    'grep --with-default-names',
    'vim --with-client-server --with-override-system-vi',

    //https://github.com/Peltoche/lsd
    'lsd',
    //https://github.com/wting/autojump
    'autojump',
    //https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
    'zsh-autosuggestions',
    //https://github.com/jesseduffield/lazydocker
    'lazydocker' 
  ],
  cask: [
    'docker', // docker for mac
    'evernote',
    'iterm2',
    'slack',
    'visual-studio-code',
  ],
  gem: [
  ],
  npm: [
    'prettyjson',
    'buzzphrase',
    'vtop',
  ]
};
