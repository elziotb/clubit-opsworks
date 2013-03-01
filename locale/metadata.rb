maintainer        "Clubit BVBA"
maintainer_email  "cookbooks@clubit.be"
license           "Apache 2.0"
description       "Fixes locale"
# long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"
recipe            "locale", "Sets locale in default session and adds entries to /etc/default/locale"

%w{ ubuntu debian }.each do |os|
  supports os
end
