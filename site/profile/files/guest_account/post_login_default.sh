#!/bin/sh

# /etc/gdm3/PostLogin/Default
# Create a temporay home drive for the guest user
# https://unix.stackexchange.com/questions/258544/create-guest-account-in-gnome-3-x-on-arch-linux

guestuser="guest"

## Set up guest user session
if [ "$USER" = "$guestuser" ]; then
    # create home drive
    mkdir /tmp/"$guestuser"
    cp /etc/skel/.* /tmp/"$guestuser"
    chown -R "$guestuser":"$guestuser" /tmp/"$guestuser"

    # show temp message
    notify-send 'Temporary Guest Session' 'All data created during this guest session will be deleted when you log out, and settings will be reset to defaults.  Please save files on an external device like a USB stick, or in the cloud like Google Drive or Teams, or email the files to yourself, if you want to access them later.'
fi

exit 0