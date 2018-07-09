# ====================
# Python
# ====================

# Link system python before miniconda root environment
PATH="$PATH:$HOME/miniconda3/bin"

# make env with directory name
function mkenv {
	local env_name=`basename $PWD`
	python_vers=${1:-3}
	conda create -y -n $env_name python=$python_vers
}

# symlink env to miniconda
function linkenv {
	ln -s ~/miniconda3/envs/${PWD##*/} venv
}

# activate env when in working directory
function actenv {
	source activate ${PWD##*/}
}

# remove env with directory name
function rmenv {
	local env_name=`basename $PWD`
	python_vers=${1:-3}
	conda remove -y -n ${PWD##*/} --all
}

# ====================
# Miscellaneous
# ====================

# Enable autocd by typing the folder name only
shopt -s autocd

# ls immediately after cd
function cd {
    builtin cd "$@" && ls
}

# Fix invalid terminal locale issue
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Postgres PGDATA path
export PGDATA=/usr/local/var/postgres/

# Reclaim ctrl-s hotkey for i-search
stty -ixon
