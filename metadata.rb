name 'redirects'
maintainer 'Rodrigo Torres'
maintainer_email 'rlinstorres@gmail.com'
license 'Apache v2.0'
description 'Installs/Configures redirects'
long_description 'Installs/Configures redirects'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/rlinstorres/redirects/issues'
source_url 'https://github.com/rlinstorres/redirects'
supports 'ubuntu', '>=14.04'
license 'Apache-2.0'

depends 'apache2', '~> 5.0.1'
