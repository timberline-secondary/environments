#!/bin/sh

# /etc/gdm3/PostSession/Default
# Remove the temporay home drive for the guest user
# https://unix.stackexchange.com/questions/258544/create-guest-account-in-gnome-3-x-on-arch-linux

guestuser="guest"

## Clear up the guest user session
if [ "$USER" = "$guestuser" ]; then
    rm -rf /tmp/"$guestuser"
fi

exit 0