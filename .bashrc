#source /Users/isen0011/.asr_chruby
source /Users/isen0011/.asr_aliases
source /Users/isen0011/.bash_aliases

source $HOME/git-pairing-session/git-pairing-session

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

for function in /Users/isen0011/.asr/functions/*; do
	source $function 
done
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
export GITHUB_HOST=github.umn.edu
export WFGEN_SERVER_PATH_CDEV=~/shares/wfg_cdev

export DRONE_SERVER=http://ci.asr.umn.edu
export DRONE_TOKEN=

