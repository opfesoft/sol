[[ ${GUARDYVAR:-} -eq 1 ]] && return || readonly GUARDYVAR=1 # include this file only once

# force default language for applications
LC_ALL=C 

AC_PATH_APPS="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"

unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
   AC_PATH_ROOT=$(greadlink -f "$AC_PATH_APPS/../")
else
   AC_PATH_ROOT=$(readlink -f "$AC_PATH_APPS/../")
fi

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
