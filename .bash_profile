# ====================
# Python
# ====================

# Link system python before miniconda root environment
PATH="$PATH:$HOME/miniconda3/bin"

# symlink env to miniconda
function linkenv {
	ln -s ~/miniconda3/envs/${PWD##*/} venv
}

# activate env when in working directory
function actenv {
	source activate ${PWD##*/}
}

# ====================
# Miscellaneous
# ====================

# Enable autocd by typing the folder name only
shopt -s autocd

# ls immediately after cd
function cd {
    builtin cd "$@" && ls -lah
}

# Fix invalid terminal locale issue
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Postgres PGDATA path
export PGDATA=/usr/local/var/postgres/
