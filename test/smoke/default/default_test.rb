# # encoding: utf-8

# Inspec test for recipe redirects::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('apache2') do
  it { should be_installed }
end

describe command('sudo apachectl -t') do
  its(:exit_status) { should eq 0 }
end

describe command('sudo /etc/init.d/apache2 status') do
  its(:stdout) { should match 'apache2 is running' }
end

describe command('ls -la /etc/apache2/sites-enabled/') do
  its(:stdout) { should match /.conf/ }
end

describe command('ls -la /etc/apache2/sites-available/') do
  its(:stdout) { should match /.conf/ }
end
