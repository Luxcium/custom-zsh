echo "${BEGIN_LOADING} ${0} ${END_LOADING}"
function load_oh_my_zsh() {
	echo "${BEGIN_FUNCTION} 'load_oh_my_zsh()' ${END_FUNCTION}"

	# echo '\u001b[0m\u001b[34m# function load_oh_my_zsh() ...'
	# echo -n "${normal}$CLRLN$LDSCLR$(tput setaf 1) \uf085 ${bold} LOADING!.. load_oh_my_zsh()${normal}"
	# Uncomment the following line to disable bi-weekly auto-update checks.
	DISABLE_AUTO_UPDATE="true"

	# Uncomment the following line to disable auto-setting terminal title.
	DISABLE_AUTO_TITLE="true"

	# Uncomment the following line to enable command auto-correction.
	# ENABLE_CORRECTION="true"

	# Uncomment the following line to display red dots whilst waiting for completion.
	COMPLETION_WAITING_DOTS="true"

	# Uncomment the following line if you want to disable marking untracked files
	# under VCS as dirty. This makes repository status check for large repositories
	# much, much faster.
	# DISABLE_UNTRACKED_FILES_DIRTY="true"
	plugins=(git vscode)
	source $ZSH/oh-my-zsh.sh
	unalias ll
	# echo -n "${normal}$CLRLN$LDLCLR$(tput setaf 2) \uf013 ${bold} DONE! load_oh_my_zsh()${normal}"

}

function source_options() {
	echo "${BEGIN_FUNCTION} 'source_options()' ${END_FUNCTION}"

	bindkey -e

	HISTFILE="${HOME}/.zsh_history"
	HISTSIZE=1000000
	SAVEHIST=1000000

	unsetopt PROMPT_SP

	setopt appendhistory
	setopt autocd
	setopt beep
	setopt BANG_HIST              # Treat the '!' character specially during expansion.
	setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
	setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
	setopt SHARE_HISTORY          # Share history between all sessions.
	setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
	setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
	setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
	setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
	setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
	setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
	setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
	setopt HIST_VERIFY            # Don't execute immediately upon history expansion.
	setopt HIST_BEEP

	{ #& START FROM : {/etc/zshrc}
		# Correctly display UTF-8 with combining characters.
		if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
			setopt combiningchars
		fi
		# disable log

		[ -r "/etc/zshrc_$TERM_PROGRAM" ] && . "/etc/zshrc_$TERM_PROGRAM"
	} #& END {/etc/zshrc}

}

function source_env() {
	echo "${BEGIN_FUNCTION} 'source_env()' ${END_FUNCTION}"

	source "${ZSH_SOURCES}/.compute_path.sh"
	source "${ZSH_SOURCES}/.compute_p9k.sh"
	source "${ZSH_FLAGS}/flg-shortcuts.sh"
	source "${POWERLEVEL10K}/powerlevel10k.zsh-theme"
	source "${PWRLN_ZSH_CONF}"
	source "${TMUX_BIN}/tmux-functions.zsh"
	source "${ZSH_COMPLETION}/node_bash_completion.sh"
	source "${ZSH_COMPLETION}/npm.completion.sh"
	source "${ZSH_SOURCES}/.autocomplete.sh"
	source '/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh'

	source_options

	if [ "$LOAD_LATER" != 'true' ]; then

		{
			export NODE_DEPLOYEMENT_ENV='false'
			export NODE_ENV='development'
			export NODE_LOCAL_ENV='true'
			export NODE_NO_READLINE=1
			export NODE_REMOTE_ENV='true'
			export NODE_REPL_HISTORY_SIZE=10000
			export NODE_REPL_HISTORY="${HOME}/.node_repl_history"
			export NODE_REPL_MODE='sloppy'
			export NODE_TEST_ENV='false'
			export NPM_CHECK_INSTALLER='pnpm'
		}
		{
			export GITHUB_TOKEN="${MAC_BOOK_PRO_ENV_REPO_GIST_HOOK_NOTIFICATIONS}"
			export GITHUB_PASSWORD="${GITHUB_TOKEN}"
			export GITHUB_USER='Luxcium'
		}
		{
			export LOCALPORT=80
			export PORT=80
			export SERVER='dev-server'
		}

		{
			export TERM="xterm-256color"
			export CLICOLOR='1'
			export LSCOLORS='GxFxCxDxBxDgedabagacad'
			export GPG_TT=(tty)
		}
	fi
}

function source_zshenv() {
	# if [ "$LOAD_LATER" != 'true' ]; then
	. "${MY_ALIASES}"
	{
		load_aliases
	}
	# fi
	source_env
}

function source_zprofile() {
	if [ "$LOAD_LATER" != 'true' ]; then
		load_paths
	fi

}

function source_zshrc() {
	load_oh_my_zsh
	load_later
}

function source_zlogin() {
	source_options

}

function source_zlogout() {
	say -v 'tom' '[[volm 0.1]] [[rate 225]] GOOD  BYE!'
	hardcls
}
function precmd() {
	# echo 'precmd()'
	if [ "$ENV_LOADED" != 'true' ]; then
		p9k_load
		hardcls
		compute_path

		ENV_LOADED='true'
		if [ "$LOAD_LATER" != 'true' ]; then
			export LOAD_LATER='true'
			local ZSH_X=$(echo $0)
			local ZSH_V=$($(echo "${ZSH_X/'-'/}" --version))
			export MY_ZSH_VERSION=" ${TERM_ICO}  ${ZSH_V%%' (x86'*}"
			echo "${normal}$CLRLN$BYL9K_TERM$(tput setaf 2)${MY_ZSH_VERSION} ${BKBK}${normal}"
		fi
	fi
	if [ "$NODE_VERSION" != "$(cut -d 'v' -f 2 <<<$(node -v))" ]; then
		compute_p9k
	fi
	# exit
}

function load_later() {

	load_tmux_functions
	autocomplete

	if [ "$LOAD_LATER" != 'true' ]; then
		export PYTHONSTARTUP="${HOME}/.pythonrc"
		if [ -x /usr/libexec/path_helper ]; then
			eval $(/usr/libexec/path_helper -s)
		fi
		{
			{ #& >>> conda initialize >>>
				# !! Contents within this block are managed by 'conda init' !!
				__conda_setup="$('/Users/neb_401/anaconda3/tungsten/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
				if [ $? -eq 0 ]; then
					eval "$__conda_setup"
				else
					if [ -f "${HOME}/anaconda3/tungsten/etc/profile.d/conda.sh" ]; then
						. "${HOME}/anaconda3/tungsten/etc/profile.d/conda.sh"
					else
						export PATH="${HOME}/anaconda3/tungsten/bin:$PATH"
					fi
				fi
				unset __conda_setup
			} #& <<< conda initialize <<<

		}

		function eslint_global() {
			yarn global add install-peerdeps@latest eslint@latest
			install-peerdeps -Y -g eslint-config-airbnb-base@latest
			install-peerdeps -Y -g eslint@latest
			install-peerdeps -Y -g eslint-config-prettier@latest
			install-peerdeps -Y -g eslint-plugin-import@latest
			install-peerdeps -Y -g eslint-plugin-unicorn@latest
			install-peerdeps -Y -g @typescript-eslint/parser@latest
			install-peerdeps -Y -g @typescript-eslint/eslint-plugin
		}
	fi
}
# # alias renew='resource_all'

# # function source_all() {
# # 	echo "${BEGIN_FUNCTION} 'source_all()' ${END_FUNCTION}"
# # echo '\u001b[0m\u001b[34m# FUNCTION.. >source_all() \u001b[31;1m'

# # function resource_all() {
# # 	. "${ZSH_LUXCIUM}/.source_all.sh"
# # 	source_all
# # 	. "${MY_ALIASES}"
# # 	load_aliases
# # }

# # }

# # Error: Cannot install macvim because conflicting formulae are installed.
# #   vim: because vim and macvim both install vi* binaries

# # Please `brew unlink vim` before continuing.

# # Unlinking removes a formula's symlinks from /usr/local. You can
# # link the formula again after the install finishes. You can --force this
# # install, but the build may fail or cause obscure side effects in the
# # resulting software.
# # >     Remove old symlinks  . . .
# # Pruned 0 symbolic links and 4 directories from /usr/local
# # >     If nothing is returned to the terminal you're up-to-date  . . .
# # schniz/tap/fnm (1.15.0) < 1.18.1
# # git (2.23.0_1) < 2.25.0
# # git-lfs (2.8.0) < 2.10.0
# # gnu-sed (4.7) < 4.8
# # gnupg (2.2.17) < 2.2.19
# # gnutls (3.6.10) < 3.6.11.1
# # hub (2.12.8) < 2.14.1
# # libheif (1.5.1_1) < 1.6.1
# # libtasn1 (4.14) < 4.15.0
# # libvterm (0.1.1) < 0.1.3
# # macvim (8.1-159) < 8.1-161
# # make (4.2.1_1) < 4.3
# # neovim (0.4.2) < 0.4.3
# # p11-kit (0.23.18.1) < 0.23.19
# # pcre2 (10.33) < 10.34
# # pyenv (1.2.14_1) < 1.2.16
# # subversion (1.12.2_1) < 1.13.0_1
# # unbound (1.9.4) < 1.9.6
# # unrar (5.8.2) < 5.8.5
# # vim (8.1.2150) < 8.2.0100
# # watch (3.3.15) < 3.3.16
# # x265 (3.2) < 3.2.1
# # >     List forumlas that can be cleaned up  . . .
# # Warning: Skipping schniz/tap/fnm: most recent version 1.18.1 not installed
# # Warning: Skipping git: most recent version 2.25.0 not installed
# # Warning: Skipping git-lfs: most recent version 2.10.0 not installed
# # Warning: Skipping gnu-sed: most recent version 4.8 not installed
# # Warning: Skipping gnupg: most recent version 2.2.19 not installed
# # Warning: Skipping gnutls: most recent version 3.6.11.1 not installed
# # Would remove: /usr/local/Cellar/heroku-node/11.14.0 (3 files, 40MB)
# # Warning: Skipping hub: most recent version 2.14.1 not installed
# # Would remove: /usr/local/Cellar/jpeg/9c (21 files, 733.4KB)
# # Warning: Skipping libheif: most recent version 1.6.1 not installed
# # Warning: Skipping libtasn1: most recent version 4.15.0 not installed
# # Would remove: /Users/neb_401/Library/Caches/Homebrew/libtermkey--0.22.mojave.bottle.tar.gz (53.6KB)
# # Would remove: /usr/local/Cellar/libtiff/4.0.10_1 (246 files, 3.5MB)
# # Warning: Skipping libvterm: most recent version 0.1.3 not installed
# # Would remove: /Users/neb_401/Library/Caches/Homebrew/libvterm--0.1.1.mojave.bottle.tar.gz (67.1KB)
# # Warning: Skipping macvim: most recent version 8.1-161 not installed
# # Warning: Skipping make: most recent version 4.3 not installed
# # Warning: Skipping neovim: most recent version 0.4.3 not installed
# # Warning: Skipping p11-kit: most recent version 0.23.19 not installed
# # Would remove: /Users/neb_401/Library/Caches/Homebrew/p11-kit--0.23.18.1.mojave.bottle.tar.gz (698.9KB)
# # Warning: Skipping pcre2: most recent version 10.34 not installed
# # Warning: Skipping pyenv: most recent version 1.2.16 not installed
# # Warning: Skipping subversion: most recent version 1.13.0_1 not installed
# # Warning: Skipping unbound: most recent version 1.9.6 not installed
# # Would remove: /Users/neb_401/Library/Caches/Homebrew/unibilium--2.0.0.mojave.bottle.tar.gz (136.8KB)
# # Warning: Skipping unrar: most recent version 5.8.5 not installed
# # Warning: Skipping vim: most recent version 8.2.0100 not installed
# # Warning: Skipping watch: most recent version 3.3.16 not installed
# # Warning: Skipping x265: most recent version 3.2.1 not installed
# # Would remove (empty directory): /usr/local/share/Library/Caches/Yarn/v6/.tmp
# # ==> This operation would free approximately 45.3MB of disk space.
# # >     Remove all old formulae from brew and cask  . . .
# # Warning: Skipping schniz/tap/fnm: most recent version 1.18.1 not installed
# # Warning: Skipping git: most recent version 2.25.0 not installed
# # Warning: Skipping git-lfs: most recent version 2.10.0 not installed
# # Warning: Skipping gnu-sed: most recent version 4.8 not installed
# # Warning: Skipping gnupg: most recent version 2.2.19 not installed
# # Warning: Skipping gnutls: most recent version 3.6.11.1 not installed
# # Removing: /usr/local/Cellar/heroku-node/11.14.0... (3 files, 40MB)
# # Warning: Skipping hub: most recent version 2.14.1 not installed
# # Removing: /usr/local/Cellar/jpeg/9c... (21 files, 733.4KB)
# # Warning: Skipping libheif: most recent version 1.6.1 not installed
# # Warning: Skipping libtasn1: most recent version 4.15.0 not installed
# # Removing: /Users/neb_401/Library/Caches/Homebrew/libtermkey--0.22.mojave.bottle.tar.gz... (53.6KB)
# # Removing: /usr/local/Cellar/libtiff/4.0.10_1... (246 files, 3.5MB)
# # Warning: Skipping libvterm: most recent version 0.1.3 not installed
# # Removing: /Users/neb_401/Library/Caches/Homebrew/libvterm--0.1.1.mojave.bottle.tar.gz... (67.1KB)
# # Warning: Skipping macvim: most recent version 8.1-161 not installed
# # Warning: Skipping make: most recent version 4.3 not installed
# # Warning: Skipping neovim: most recent version 0.4.3 not installed
# # Warning: Skipping p11-kit: most recent version 0.23.19 not installed
# # Removing: /Users/neb_401/Library/Caches/Homebrew/p11-kit--0.23.18.1.mojave.bottle.tar.gz... (698.9KB)
# # Warning: Skipping pcre2: most recent version 10.34 not installed
# # Warning: Skipping pyenv: most recent version 1.2.16 not installed
# # Warning: Skipping subversion: most recent version 1.13.0_1 not installed
# # Warning: Skipping unbound: most recent version 1.9.6 not installed
# # Removing: /Users/neb_401/Library/Caches/Homebrew/unibilium--2.0.0.mojave.bottle.tar.gz... (136.8KB)
# # Warning: Skipping unrar: most recent version 5.8.5 not installed
# # Warning: Skipping vim: most recent version 8.2.0100 not installed
# # Warning: Skipping watch: most recent version 3.3.16 not installed
# # Warning: Skipping x265: most recent version 3.2.1 not installed
# # >     Show the individual packages installed  . . .
# # adns			findutils		gnutls			libgcrypt		lrzsz			openssl			rlwrap			watch
# # apr			fnm			go			libgpg-error		lua			openssl@1.1		rsync			webp
# # apr-util		freetype		gpatch			libheif			luajit			p11-kit			ruby			wget
# # autoconf		gawk			grep			libidn2			lz4			pcre			ruby-build		x265
# # automake		gdbm			gzip			libksba			m4			pcre2			scons			xz
# # azure-cli		geoip			heroku			libmagic		macvim			perl			screen			zeromq
# # bash			gettext			heroku-node		libomp			make			pinentry		shared-mime-info	zsh
# # binutils		git			htop			libpng			mpfr			pkg-config		shfmt			zsh-autosuggestions
# # brew-pip		git-flow		hub			libtasn1		msgpack			powerlevel9k		socat			zsh-completions
# # cask			git-lfs			icu4c			libtermkey		nano			pyenv			sqlite			zsh-syntax-highlighting
# # cmake			glib			ilmbase			libtiff			ncdu			python			subversion		zssh
# # coreutils		gmp			jpeg			libtool			ncurses			python@2		tmux
# # cscope			gnu-getopt		ldns			libunistring		neovim			python@3.8		unbound
# # diffutils		gnu-indent		less			libusb			nettle			qt			unibilium
# # docker			gnu-sed			libassuan		libuv			npth			rbenv			unrar
# # ed			gnu-tar			libde265		libvterm		openexr			readline		unzip
# # emacs			gnu-which		libevent		libyaml			openjpeg		redis			utf8proc
# # file-formula		gnupg			libffi			little-cms2		openssh			rename			vim
# # >     Looking if everything is working correctly  . . .
# # Please note that these warnings are just used to help the Homebrew maintainers
# # with debugging if you file an issue. If everything you use Homebrew for is
# # working fine: please don't worry or file an issue; just ignore this. Thanks!

# # Warning: "config" scripts exist outside your system or Homebrew directories.
# # `./configure` scripts often look for *-config scripts to determine if
# # software packages are installed, and which additional flags to use when
# # compiling and linking.

# # Having additional scripts in your path can confuse software installed via
# # Homebrew if the config script overrides a system or Homebrew-provided
# # script of the same name. We found the following "config" scripts:
# #   /Users/neb_401/anaconda3/tungsten/bin/icu-config
# #   /Users/neb_401/anaconda3/tungsten/bin/krb5-config
# #   /Users/neb_401/anaconda3/tungsten/bin/freetype-config
# #   /Users/neb_401/anaconda3/tungsten/bin/xslt-config
# #   /Users/neb_401/anaconda3/tungsten/bin/libpng16-config
# #   /Users/neb_401/anaconda3/tungsten/bin/python3.7-config
# #   /Users/neb_401/anaconda3/tungsten/bin/libpng-config
# #   /Users/neb_401/anaconda3/tungsten/bin/xml2-config
# #   /Users/neb_401/anaconda3/tungsten/bin/python3.7m-config
# #   /Users/neb_401/anaconda3/tungsten/bin/python3-config
# #   /Users/neb_401/anaconda3/tungsten/bin/curl-config
# #   /Users/neb_401/anaconda3/tungsten/bin/ncursesw6-config
# #   /Users/neb_401/anaconda3/tungsten/bin/pcre-config

# # Warning: Putting non-prefixed coreutils in your path can cause gmp builds to fail.

# # Warning: Putting non-prefixed findutils in your path can cause python builds to fail.

# # Warning: You have unlinked kegs in your Cellar.
# # Leaving kegs unlinked can lead to build-trouble and cause brews that depend on
# # those kegs to fail to run properly once built. Run `brew link` on these:
# #   macvim
# #      100%    12.14.1    6.13.4  ﯤ                                                                                                                               10:22    6.76G    64%    
# #    neb_401   ~ 
# #    3.7.6 (tungsten)      2.6.2    3.18  ↵ 1  ﯤ  ` on these:
# #   macvim
# #      100%    12.14.1    6.13.4  ﯤ                                                                                                                                          6.82G    64%    
# #    neb_401   ~ 
# #    3.7.6 (tungsten)      2.6.2    3.01  ↵ SIGINT(2)  ﯤ  brew link
# # Usage: brew link, ln [options] formula

# # Symlink all of formula's installed files into Homebrew's prefix. This is done
# # automatically when you install formulae but can be useful for DIY installations.

# #         --overwrite                  Delete files that already exist in the
# #                                      prefix while linking.
# #     -n, --dry-run                    List files which would be linked or deleted
# #                                      by brew link --overwrite without actually
# #                                      linking or deleting any files.
# #     -f, --force                      Allow keg-only formulae to be linked.
# #     -v, --verbose                    Make some output more verbose.
# #     -d, --debug                      Display any debugging information.
# #     -h, --help                       Show this message.

# # Error: Invalid usage: This command requires a keg argument
# #      100%    12.14.1    6.13.4  ﯤ                                                                                                                             1.1055s    6.90G    64%    
# #    neb_401   ~ 
# #    3.7.6 (tungsten)      2.6.2    3.01  ↵ 1  ﯤ  brew link macvim
# # Linking /usr/local/Cellar/macvim/8.1-159...
# # Error: Could not symlink bin/vi
# # Target /usr/local/bin/vi
# # is a symlink belonging to vim. You can unlink it:
# #   brew unlink vim

# # To force the link and overwrite all conflicting files:
# #   brew link --overwrite macvim

# # To list all files that would be deleted:
# #   brew link --overwrite --dry-run macvim
# #      100%    12.14.1    6.13.4  ﯤ                                                                                                                             1.3252s    6.87G    64%    
# #    neb_401   ~ 
# #    3.7.6 (tungsten)      2.6.2    2.93 
