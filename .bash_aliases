alias mnt_cdev="mount -t smbfs smb://wfgen-cdev.oit.umn.edu/web$ ~/shares/wfg_cdev"
alias mnt_cdev_root="mount -t smbfs smb://wfgen-cdev.oit.umn.edu/D$ ~/shares/wfg_cdev_root"
alias mnt_tst="mount -t smbfs smb://wfgen-tst.oit.umn.edu/d$ ~/shares/wfg_tst"
alias mnt_prd="mount -t smbfs smb://oit-wfgen-prd01.oit.umn.edu/web$ ~/shares/wfg_prd"
alias mnt_prd_root="mount -t smbfs smb://oit-wfgen-prd01.oit.umn.edu/d$ ~/shares/wfg_prd_root"
alias mnt_dev="mount -t smbfs smb://oit-wfgen-dev02.oit.umn.edu/d$ ~/shares/wfg_dev"
alias mnt_gpack="mount -t smbfs smb://apps.grad.umn.edu/d$ ~/shares/grad_pack"
alias mnt_sd='mount -t smbfs "smb://files.umn.edu/asr/asr%20public/asr%20shared/" ~/shares/s_drive'

alias oc='gem install overcommit; overcommit --install'

# git aliases
alias git=hub
alias g=git
alias gs='g status'
alias gss='g status -sb'
alias ga='g add -p'
alias gc='g commit -v'
alias gp='g pull'
alias gps='g push'
alias gb='g checkout -b'
alias gu='g checkout master && g pull origin master'
alias gl='g log'
alias glog="g log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gx='g branch --merged | grep -v master | xargs git branch -d'
alias grst='g reset-hard'
alias vacation="echo 'umn.edu_gjh72idh4stdgi3q2173d5e6jo@group.calendar.google.com' | pbcopy"

alias docker_clean='docker stop $(docker ps -a -q) ; docker rm $(docker ps -a -q); docker rmi $(docker images -a -q) ; docker volume prune'

function cds(){
  cd $1
  ls
}

