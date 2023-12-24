# Set aliases
alias vdown='yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" --write-sub --write-auto-sub --sub-lang en --merge-output-format mp4 --embed-thumbnail'
alias studio='/opt/android-studio/bin/studio.sh'
alias cpu="auto-cpufreq --stats"
alias mkxz='tar -cJf'
alias mkgz='tar -czf'
alias unxz='tar -xf'
alias ungz='tar -xzf'
alias mkdir="mkdir -p"
alias cp="cp -i"
alias ktheme="kitty +kitten themes --reload-in=all"
alias grtheme='cd ~/Grub-Themes/ && sudo ./install.sh'

# Helpful aliases
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code --disable-gpu' # gui code editor