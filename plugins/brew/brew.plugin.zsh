alias brewp='brew pin'
alias brews='brew list -1'
alias brewsp='brew list --pinned'
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'
alias bcubo='brew update && brew cask outdated'
alias bcubc='brew cask reinstall $(brew cask outdated) && brew cleanup'
alias brewsp='brew_space'

function brew_space () {
	for pkg in `brew list -f1 | egrep -v '\.|\.\.'`
		do echo $pkg `brew info $pkg | egrep '[0-9]* files, ' | sed 's/^.*[0-9]* files, \(.*\)).*$/\1/' | awk '{print $1;}/[0-9]$/{s+=$1};/[mM][bB]$/{s+=$1*(1024*1024);next};/[kK][bB]$/{s+=$1*1024;next} END { suffix=" KMGT"; for(i=1; s>1024 && i < length(suffix); i++) s/=1024; printf "\t(all versions: %0.1f%s)",s,substr(suffix, i, 1), $3; }'`
	done
}

if command mkdir "$ZSH_CACHE_DIR/.brew-completion-message" 2>/dev/null; then
	print -P '%F{yellow}'Oh My Zsh brew plugin:
	cat <<-'EOF'

		  With the advent of their 1.0 release, Homebrew has decided to bundle
		  the zsh completion as part of the brew installation, so we no longer
		  ship it with the brew plugin; now it only has brew aliases.

		  If you find that brew completion no longer works, make sure you have
		  your Homebrew installation fully up to date.

		  You will only see this message once.
	EOF
	print -P '%f'
fi
