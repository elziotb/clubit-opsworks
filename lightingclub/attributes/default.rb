default['lightingclub'] = {
  'git_revision' => "1.2.1",
  'git_repository' => "https://github.com//",
  'app_path' => "/home/vagrant/websites/lightingclub/current",
  'app_server_name' => 'lightingclub.be',
  'unicorn_conf' => {
    'pid' => "/tmp/pids/unicorn.pid",
    'sock' => "/tmp/sockets/unicorn.sock",
    'error_log' => "unicorn.error.log",
    'access_log' => "unicorn.access.log"
    },
  'ruby' => "ruby-1.9.3-p327@lightingclub",
  'rmagick' => "disabled",
  'nginx_filenames' => ["lightingclub.conf"],
  'nginx_listen' => ["80 default"]
}