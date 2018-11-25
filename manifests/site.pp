## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
#https://docs.puppet.com/pe/2015.3/release_notes.html#filebucket-resource-no-longer-created-by-default
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.


# Node definitions:
# https://puppet.com/docs/puppet/5.3/lang_node_definitions.html
# regex testing: http://rubular.com/

# EXAMPLE match 1-12 or 01-12:
# /tbl-hackerspace-(0?[1-9]|1[0-2])-s.hackerspace.tbl/
#1-16
# /tbl-hackerspace-(0?[1-9]|1[0-6])-s.hackerspace.tbl/
#1-24
# /tbl-hackerspace-(0?[1-9]|1[0-9]|2[0-4])-s\.hackerspace\.tbl/
node default {
}

node 'puppet' {
  include role::puppetmaster
}

# node /^(?i:tbl-hackerspace-\d+-s)$/ {
#   # e.g.: tbl-hackerspace-01-s (case insensitive)
#   include role::student_workstation
# }

#1-9, 10-30
node /tbl-hackerspace-(0?[1-9]|1[0-9]|2[0-9]|30)-s\.hackerspace\.tbl/ {
  include role::student_workstation
}

node 'tbl-hackerspace-01-e.hackerspace.tbl' {
  include role::teacher_workstation
}

node 'tbl-hackerspace-31-s.hackerspace.tbl' {
  include role::test_workstation
}

# node 'tbl-hackerspace-9-s.hackerspace.tbl' {
#   include role::attendance_workstation
# }

