#Puppet Environments for Timberline's Hackerspace

## Useful dirs

Environments: 
`/etc/puppetlabs/code/environments/`

Request puppet update as client:
`sudo /opt/puppetlabs/bin/puppet agent -t`

Modules location: 
`/opt/puppetlabs/puppet/modules/` (Are here but [shouldn't be](https://docs.puppet.com/puppet/4.6/reference/quick_start_module_install_nix.html#a-quick-note-about-module-directories)!)

Confdir: 
`/etc/puppetlabs/puppet`

## Configuration Files
https://docs.puppet.com/puppet/latest/reference/config_file_main.html

*nix Systems: `/etc/puppetlabs/puppet/puppet.conf`

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


## Puppet Forge

Modules are here but [shouldn't be](https://docs.puppet.com/puppet/4.6/reference/quick_start_module_install_nix.html#a-quick-note-about-module-directories)! 

`/opt/puppetlabs/puppet/modules`


`



