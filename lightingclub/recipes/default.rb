# create a user with an MD5-encrypted password
pg_user "clubit" do
  privileges :superuser => false, :createdb => false, :login => true
  encrypted_password "667ff118ef6d196c96313aeaee7da519"
end

# create a database
pg_database "lightingclub_development" do
  owner "clubit"
  encoding "utf8"
  template "template0"
  locale "en_US.UTF8"
end

pg_database "lightingclub_production" do
  owner "clubit"
  encoding "utf8"
  template "template0"
  locale "en_US.UTF8"
end

# create the datbase.yml file
directory "/home/vagrant/websites/lightingclub/shared/config" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  recursive true
end
execute "chown directory" do
  command "chown -R vagrant:vagrant /home/vagrant/websites"
  action :run
end
template "/home/vagrant/websites/lightingclub/shared/config/database.yml" do
  mode "644"
  owner "vagrant"
  group "vagrant"
  source "database.yml.erb"
end

# Install lightingclub ssl private key
template "/etc/ssl/thelightingclub.be.key" do
  mode "0600"
  owner "nobody"
  group "nogroup"
  source "thelightingclub.be.key.erb"
end

# Install lightingclub ssl certificate
template "/etc/ssl/thelightingclub.be.crt" do
  mode "0600"
  owner "nobody"
  group "nogroup"
  source "thelightingclub.be.crt.erb"
end

# Install lightingclub vhost
template "/etc/nginx/sites-available/lightingclub.conf" do
  mode "0644"
  source "lightingclub.conf.erb"
end

# Enable lightingclub vhost
link "/etc/nginx/sites-enabled/lightingclub.conf" do
  to "/etc/nginx/sites-available/lightingclub.conf"
  notifies :reload, resources(:service => "nginx")
end

# Disable default vhost (allows lightingclub vhost to serve http://localhost)
link "/etc/nginx/sites-enabled/default" do
  action :delete
  notifies :reload, resources(:service => "nginx")
end

# Add keys to user in order to deploy repository from gitolite (git.clubit.be)
template "/home/vagrant/.ssh/id_rsa" do
  mode "0600"
  source "id_rsa"
  owner "vagrant"
  group "vagrant"
end
template "/home/vagrant/.ssh/id_rsa.pub" do
  mode "0600"
  source "id_rsa.pub"
  owner "vagrant"
  group "vagrant"
end