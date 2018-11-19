node profile::server_puppet {
  #https://ask.puppet.com/question/10532/is-it-ok-to-delete-report-yaml-files/
  # tidy { '/opt/puppetlabs/server/data/puppetserver/reports':
  #   age     => '30d',
  #   matches => "*.yaml",
  #   recurse => true,
  #   rmdirs  => false,
  #   type    => ctime,
  # }
}