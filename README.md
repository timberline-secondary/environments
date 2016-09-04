# hs-puppet-environments
Puppet Environments for Timberline's Hackerspace

`/etc/puppetlabs/code/environments/`



Request puppet update from client:
`sudo /opt/puppetlabs/bin/puppet agent -t`

Modules location:
`/opt/puppetlabs/puppet/modules/`

Environments and Manifests:
`/etc/puppetlabs/code/environments/`

Confdir
`/etc/puppetlabs/puppet`

## Certificates
List all signed certs:
`sudo /opt/puppetlabs/bin/puppet cert --list`

Remove from client:
`sudo find /etc/puppetlabs/puppet/ssl -name hostname.hackerspace.tbl.pem -delete`

Revoke a cert (via puppet server):
if problems, `sudo su` and then don't need puppet path
`sudo /opt/puppetlabs/bin/puppet cert clean hostname.hackerspace.tbl`


##New Module
```
mkdir -p hs_new_module/manifests
# if files 
mkdir hs_new_module/files
sudo nano hs_new_module/manifests/init.pp
```
###Example Contents of init.pp
```
class new_module {

  file { 'printers.conf':
    path    => '/etc/cups/printers.conf',
    ensure  => file,
    source  => "puppet:///modules/new_module/printers.conf",
  }

}

```




# Puppet Forge

Are here but [shouldn't be](https://docs.puppet.com/puppet/4.6/reference/quick_start_module_install_nix.html#a-quick-note-about-module-directories)! 

`/opt/puppetlabs/puppet/modules`

## Configureation Files
https://docs.puppet.com/puppet/latest/reference/config_file_main.html

*nix Systems: `/etc/puppetlabs/puppet/puppet.conf`

## Adding Puppet Clients
###For one off additions
####Client:
Setup as required
`sudo apt install puppet` (if not already installed)
`sudo nano /etc/hosts` and add: `ip puppet` (if required)

Request certificate from server
`sudo /opt/puppetlabs/bin/puppet puppet agent -t`
(if this has issues, try `sudo su` to run `puppet` without path)

####Puppet server
sudo /opt/puppetlabs/bin/puppet puppet cert list`
`



