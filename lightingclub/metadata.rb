maintainer        "Clubit BVBA"
maintainer_email  "cookbooks@clubit.be"
license           "Apache 2.0"
description       "Configures the lightingclub application"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"
recipe            "lightingclub", "Installs postgresql user and database. Configures nginx conf file."

%w{ ubuntu debian }.each do |os|
  supports os
end
