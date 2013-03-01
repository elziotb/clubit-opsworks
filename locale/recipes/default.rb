script :fix_locale_in_session do
  interpreter "bash"
  user "root"
  code <<-EOH
    export 'LANGUAGE="en_US.UTF-8"'
    export 'LANG="en_US.UTF-8"'
    export 'LC_ALL="en_US.UTF-8"'
  EOH
end

script :add_locale do
  interpreter "bash"
  user "root"
  code <<-EOH
    if ! grep -F "LANGUAGE" /etc/default/locale
    then
      echo 'LANGUAGE="en_US.UTF-8"' >> /etc/default/locale
    fi
    if ! grep -F "LC_ALL" /etc/default/locale
    then
      echo 'LC_ALL="en_US.UTF-8"' >> /etc/default/locale
    fi
  EOH
end


e = execute "apt-get update" do
  action :nothing
end
e.run_action(:run)