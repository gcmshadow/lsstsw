#
# Config file with environment variables used by ~lsstsw builder
#

# top-level products
PRODUCTS=${PRODUCTS:-"lsst_sims lsst_distrib qserv_distrib git anaconda webserv"}

# set it to nonempty to prevent versiondb from being pushed upstream
# unless you're the automated LSST software account
if [[ $USER != 'lsstsw' || $(hostname) != 'lsst-dev.ncsa.illinois.edu' ]]; then
    NOPUSH=1
fi

#
# the settings below should rarely need changing
#

# where are we? default to $HOME if $LSSTSW hasn't been defined
LSSTSW=${LSSTSW:-$HOME/lsstsw}

# the location of source repositories
REPOSFILE=${LSSTSW}/etc/repos.yaml

# location of the build directory
BUILD_DIR=${BUILD_DIR:-${LSSTSW}/build}

# location of the version repository (it should be a clone of git@git.lsstcorp.org/LSST/DMS/devenv/versiondb.git)
VERSIONDB=$LSSTSW/versiondb

# location of exclusions.txt file for 'lsst-build prepare' command
EXCLUSIONS=$LSSTSW/etc/exclusions.txt

#
# exported variables
#

# repository path for 'eups distrib create'
export EUPSPKG_REPOSITORY_PATH="$BUILD_DIR"/'$PRODUCT'

# location of the EUPS stack
export EUPS_PATH=$LSSTSW/stack

# use 'package' for public releases, use 'git' for development releases
export EUPSPKG_SOURCE=${EUPSPKG_SOURCE:-git}

# the location of the distribution server
export EUPS_PKGROOT=$LSSTSW/distserver/production
