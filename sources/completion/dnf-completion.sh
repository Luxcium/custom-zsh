#compdef dnf

# Main dispatcher
_dnf()
{
	local curcontext="$curcontext" state lstate line

	_arguments -s \
	   '(- *)'{-h,--help}'[show the help message]' \
	   '(-t --tolerant)'{-t,--tolerant}'[be tolerant of errors]' \
	   '(-C --cacheonly)'{-C,--cacheonly}'[run entirely from cache]' \
	   '(-c --config)'{-c,--config=}'[config file location]:Yum conf file:_files' \
	   '(-R --randomwait)'{-R,--randomwait=}'[maximum command wait time (in minutes)]:max wait time' \
	   '(-d --debuglevel)'{-d,--debuglevel=}'[debug level (0-10)]:debug level' \
	   '(-e --errorlevel)'{-e,--errorlevel=}'[error level (0-10)]:error level' \
	   '(-y --assumeyes)'{-y,--assumeyes}'[answer yes for all questions]' \
	   '--installroot=[set install root]:install root:_files -/' \
	   '*--enablerepo=[enable or or more repositories]:repos to enable:_dnf_disabled_repos_list' \
	   '*--disablerepo=[disable one or more repositories]:disable repos:_dnf_enabled_repos_list' \
	   {*-x,*--exclude=}'[exclude package(s) by name or glob]:exclude packages' \
	   '--version[show dnf version]' \
	   '--obsoletes[enable obsoletes processing during updates]' \
	   '--nogpgcheck[disable gpg signature checking]' \
	   '--noplugins[disable dnf plugins]' \
	   '--disablepresto[disable Presto plugin and don''''t download any deltarpms]' \
	   '*::dnf command:_dnf_command'
}

(( $+functions[_dnf_command] )) || _dnf_command()
{
  	local -a _dnf_cmds
  	_dnf_cmds=(
		"install:install the latest version of a package or group of packages"
		"erase:remove an installed package (with its dependencies)"
		"remove:remove an installed package (with its dependencies)"
		"clean:clean local dnf cache"
		"deplist:gives a list of all dependencies for a package"
		"check-update:check if any updates are available"
		"info:get description of available packages"
		"list:is used to list various information about packages"
		"groupinfo:get info on package groups"
		"groupinstall:install a package group or groups"
		"groupremove:remove a package group or groups"
		"grouplist:list package groups"
		"groupupdate:update a package group or groups"
		"localinstall:install packages with local rpm files"
		"localupdate:update packages with local rpm files"
		"makecache:makes a local dnf cache"
		"provides:find out which package provides some feature or file"
		"whatprovides:find out which package provides some feature or file"
		"resolvedep:list packages providing the specified dependencies"
		"search:find any packages matching pattern"
		"shell:enter the 'dnf shell'"
		"update:update one or more packages"
		"upgrade:upgrade one or more packages"
  	)

  	if (( CURRENT == 1 )); then
		_describe -t commands 'dnf command' _dnf_cmds || compadd "$@"
  	else
    	local curcontext="$curcontext"

	    cmd="${${_dnf_cmds[(r)$words[1]:*]%%:*}}"

		# Deal with any aliases
		case $cmd in
			remove) cmd="erase";;
			whatprovides) cmd="provides";;
			upgrade) cmd="update";;
		esac

    	if (( $#cmd )); then
    		curcontext="${curcontext%:*:*}:dnf-${cmd}:"

	      	local update_policy
		  	zstyle -s ":completion:${curcontext}:" cache-policy update_policy
		  	if [[ -z "$update_policy" ]]; then
				zstyle ":completion:${curcontext}:" cache-policy _dnf_caching_policy
	  		fi

      		_call_function ret _dnf_$cmd || _message 'no more arguments'
    	else
      		_message "unknown dnf command: $words[1]"
    	fi
    	return ret
  	fi
}

# Fills the installed pkg cache
_dnf_all_pkgs()
{
	if ( [[ ${+_all_pkgs} -eq 0 ]] || _cache_invalid ALL ) &&
		! _retrieve_cache ALL;
	then
		local prog="dnf -C list all | sed 's/\s.*//' | grep '\.'"
		_all_pkgs=( $(kages $prog 2>/dev/null) )
		_store_cache ALL _all_pkg
	fi
}

# Fills the installed pkg cache
_dnf_installed_pkgs()
{
	if ( [[ ${+_installed_pkgs} -eq 0 ]] || _cache_invalid INSTALLED ) &&
		! _retrieve_cache INSTALLED;
	then
		_installed_pkgs=( $(dnf -C list installed | sed 's/\s.*//' | grep '\.' 2>/dev/null) )
		_store_cache INSTALLED _installed_pkgs
	fi
}

# Fills the available pkg cache
_dnf_available_pkgs()
{
	if ( [[ ${+_available_pkgs} -eq 0 ]] || _cache_invalid AVAILABLE ) &&
		! _retrieve_cache AVAILABLE;
	then
		_available_pkgs=( $(dnf -C list available | sed 's/\s.*//' | grep '\.' 2>/dev/null) )
		_store_cache AVAILABLE _available_pkgs
	fi
}

# Fills the upgrade pkg cache
_dnf_upgrade_pkgs()
{
	if ( [[ ${+_upgrade_pkgs} -eq 0 ]] || _cache_invalid UPGRADE ) &&
		! _retrieve_cache UPGRADE;
	then
		_upgrade_pkgs=( $(dnf -C list upgrade | sed 's/\s.*//' | grep '\.' 2>/dev/null) )
		_store_cache UPGRADE _upgrade_pkgs
	fi
}

# Gets the list of defined repos
dnf_repos() {
    local trepo
    local -a tarray
    tarray=( $(egrep -h '(^\[.*\]|^enabled.*=)' /etc/dnf.repos.d/*.repo /etc/dnf.conf | sed -e 's/ //g' | sed -e 's/\[//g' | sed -e 's/\].*$//g' 2>/dev/null) )
    local -i eindex=0
    local -i dindex=0
    for line in $tarray; do
        if [[ "$line" = "enabled=1" ]]; then
            enabled_dnf_repos=($enabled_dnf_repos $trepo)
        elif [[ "$line" = "enabled=0" ]]; then
            disabled_dnf_repos=($disabled_dnf_repos $trepo)
        elif [[ "$line" != "main" ]]; then
            trepo=$line
        fi
    done
}

(( $+functions[_dnf_disabled_repos_list] )) || _dnf_disabled_repos_list()
{
	compset -P '*,'
	compset -S ',*'
	dnf_repos
	compadd "$@" -a -- disabled_dnf_repos
}

(( $+functions[_dnf_enabled_repos_list] )) || _dnf_enabled_repos_list()
{
	compset -P '*,'
	compset -S ',*'
	dnf_repos
	compadd "$@" -a -- enabled_dnf_repos
}

# Completion function for erase|remove
(( $+functions[_dnf_erase] )) || _dnf_erase()
{
	_dnf_installed_pkgs
	compadd "$@" -a -- _installed_pkgs
}

# Completion function for install
(( $+functions[_dnf_install] )) || _dnf_install()
{
	_dnf_available_pkgs
	compadd "$@" -a -- _available_pkgs
}

# Completion function for localinstall
(( $+functions[_dnf_localinstall] )) || _dnf_localinstall()
{
	_files -g '(#i)*.rpm(-.)'
}

# Completion function for localupdate
(( $+functions[_dnf_localupdate] )) || _dnf_localupdate()
{
	_files -g '(#i)*.rpm(-.)'
}

# Completion function for update/upgrade
(( $+functions[_dnf_update] )) || _dnf_update()
{
	_dnf_upgrade_pkgs
	compadd "$@" -a -- _upgrade_pkgs
}

# Completion function for deplist
(( $+functions[_dnf_deplist] )) || _dnf_deplist()
{
	_dnf_available_pkgs
	compadd "$@" -a -- _available_pkgs
}

_dnf_all()
{
	_dnf_all_pkgs
	compadd "$@" -a -- _all_pkgs
}
_dnf_list_or_info()
{
	local -a listlist
	listlist=(
		"all:all packages in repositories"
		"available:packages available in repositories"
		"updates:packages with updates available"
		"installed:installed packages"
		"extras:packages installed that are not available in any dnf repository"
		"obsoletes:packages installed that are obsoleted"
		"recent:packages recently added to repositories"
	)

  	if (( CURRENT == 2 )); then
		_describe -t dnf-list-subcmds "Yum info/list sub-commands" listlist || _dnf_all
	else
	    local subcmd
		subcmd="${${listlist[(r)$words[2]:*]%%:*}}"
		# Deal with any aliases
		case $subcmd in
			installed) _dnf_erase;;
			available) _dnf_install;;
			updates) _dnf_update;;
		esac
	fi
}

# Completion function for list
(( $+functions[_dnf_list] )) || _dnf_list()
{
	_dnf_list_or_info
}

# Completion function for info
(( $+functions[_dnf_info] )) || _dnf_info()
{
	_dnf_list_or_info
}

# Completion function for provides|whatprovides
(( $+functions[_dnf_provides] )) || _dnf_provides()
{
	_files
}

# Completion function for resolvedep
(( $+functions[_dnf_resolvedep] )) || _dnf_resolvedep()
{
	_files
}

# Completion function for clean
(( $+functions[_dnf_clean] )) || _dnf_clean()
{
	local -a cleanlist
	cleanlist=(
		"all:all cache"
		"cache:all cache"
		"dbcache:DB cache"
		"headers:cache headers"
		"packages:cache packages"
		"metadata:cache meta-data"
	)

  	if (( CURRENT == 2 )); then
		_describe -t dnf-clean-subcmds "Yum clean sub-commands" cleanlist
	fi
}

_dnf_caching_policy()
{
  local _dnfrepomds
  local -a oldp

  # rebuild if cache is more than a week old
  oldp=( "$1"(mw+1) )
  (( $#oldp )) && return 0

  _dnfrepomds=( /var/cache/dnf/**/repomd.xml )

  if (( $#_dnfrepomds )); then
    for repo in $_dnfrepomds; do
      [[ "$repo" -nt "$1" ]] && return 0
    done
  fi

  return 1
}

_dnf "$@"
