# bash-script-pamac-clean-cache
Simple bash script for cleaning pamac cache.

Pamac is default package manager for Manjaro, when pamac installs packages, it keeps a copy of all the old packages you have downloaded. This cache can be very useful if you have to install older packages in an emergency. However, left unchecked, this cache will grow very large over time.


# Requirements
Due to create lock file you have to have superuser privileges.

# Variables
Name of lock file.
````bash
LOCK_FILE_NAME="pamac_clean_cache.lock"
````

Path of lock file.
```bash
LOCK_FILE_PATH="/var/lock/"
````

Full path of lock file.
````bash
LOCK_FILE="${LOCK_FILE_PATH}${LOCK_FILE_NAME}"
````

Number of latest packages versions you want to keep.
````bash
PACKAGES_NUMBER=3
````

# How to use it?
````bash
sudo ./pamac_clean_cache.sh
````





