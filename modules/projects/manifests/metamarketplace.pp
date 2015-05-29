class projects::metamarketplace {
  $ruby_version = "1.9.3-p448"
  # include imagemagick # imagemagick version for boxen is off
  include phantomjs

  boxen::project { "metamarketplace":
    ruby          => $ruby_version,
    mysql         => true,
    redis         => true,

    source        => "elsom25/manyfeek",
    dir           => "${boxen::config::srcdir}/work/manyfeek"
  }

  ruby_gem { "bundler for ruby ${ruby_version}":
    gem           => "bundler",
    ruby_version  => $ruby_version
  }

  # exec { "solr for ${name}":
  #   command  => "env -i bash -c 'source /opt/boxen/env.sh && RBENV_VERSION=${ruby_version} rake sunspot:solr:start'",
  #   path    => $path,
  # }
}
