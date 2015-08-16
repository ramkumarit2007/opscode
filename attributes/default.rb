#This will hold the attributes which will be used in the awesome_customers recipe
default['awesome_customers']['user'] = 'web_admin'
default['awesome_customers']['group'] = 'web_admin'
default['awesome_customers']['document_root'] = '/var/www/customers/public_html'
default['firewall']['allow_ssh'] = true
default['php']['install_method'] = 'package'
default['awesome_customers']['passwords']['secret_path'] = '/etc/chef/data_bag.key'
default['awesome_customers']['database']['host'] = '127.0.0.1'
default['awesome_customers']['database']['dbname'] = 'products'
default['awesome_customers']['database']['username'] = 'root'
default['awesome_customers']['database']['app']['username'] = 'db_admin'
default['awesome_customers']['database']['seed_file'] ='/tmp/create-tables.sql'
