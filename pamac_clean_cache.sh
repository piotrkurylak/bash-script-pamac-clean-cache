#!/bin/bash

#
# Script for cleaning pamac cache.
#

# If case of any error or unused variable, exit immediately.
set -eu

# Variables
LOCK_FILE_NAME="pamac_clean_cache.lock"
LOCK_FILE_PATH="/var/lock/"
LOCK_FILE="${LOCK_FILE_PATH}${LOCK_FILE_NAME}"
PACKAGES_NUMBER=3


# Functions

# 1. Check if lock file exists.
function is_running() {
    if [[ -e "${LOCK_FILE}" ]]; then
    printf "Lock file exists, exiting.\n" >&2
    exit 1
    fi
}

# 2. Create lock file.
function create_lock_file() {
    touch "${LOCK_FILE}" || {
        printf "Cannot create lock file, exiting.\n" >&2
        exit 2
    }
}

# 3. Delete lock file.
function delete_lock_file() {
    rm -rf "${LOCK_FILE}" || {
        printf "Cannot delete lock file, exiting.\n" >&2
        exit 3
    }
}

# 4. Clean pamac cache, keep latest 3 packages versions.
function clean_cache() {
    pamac clean --keep "${PACKAGES_NUMBER}" || {
        printf "Cannot clear cache, exiting.\n"
        exit 4
    }
}

trap delete_lock_file SIGINT SIGTERM

is_running
create_lock_file
clean_cache
delete_lock_file


