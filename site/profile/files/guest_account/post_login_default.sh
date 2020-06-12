#!/bin/sh

# /etc/gdm3/PostLogin/Default
# Create a temporay home drive for the guest user
# https://unix.stackexchange.com/questions/258544/create-guest-account-in-gnome-3-x-on-arch-linux

guestuser="guest"

## Set up guest user session
if [ "$USER" = "$guestuser" ]; then
    mkdir /tmp/"$guestuser"
    cp /etc/skel/.* /tmp/"$guestuser"
    chown -R "$guestuser":"$guestuser" /tmp/"$guestuser"
fi

exit 0