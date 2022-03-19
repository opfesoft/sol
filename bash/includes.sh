CURRENT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
AC_PATH_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"
AC_PATH_CONF="$AC_PATH_ROOT/conf"
AC_PATH_MODULES="$AC_PATH_ROOT/modules"
AC_PATH_DEPS="$AC_PATH_ROOT/deps"

source "$AC_PATH_CONF/config.sh.dist" # add default configuration parameters

if [ -f "$AC_PATH_CONF/config.sh"  ]; then
    source "$AC_PATH_CONF/config.sh" # overwrite configuration parameters using a custom config file
fi

# load modules

for entry in "$AC_PATH_MODULES/"*/include.sh
do
    if [ -e $entry ]; then
        source $entry
    fi
done
