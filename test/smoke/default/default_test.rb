# # encoding: utf-8

# Inspec test for recipe redirects::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe upstart_service('apache2') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port 80 do
  it { should be_listening }
end

describe command('ls -la /etc/apache2/sites-enabled/') do
  its(:stdout) { should match /.conf/ }
end

describe command('ls -la /etc/apache2/sites-available/') do
  its(:stdout) { should match /.conf/ }
end
