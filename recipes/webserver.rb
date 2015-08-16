#
# Cookbook Name:: awesome_customers
# Recipe:: webserver
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#Install Apache and start the services


httpd_service 'customers' do
	mpm 'prefork'
	action [:create, :start]
end

#Configuration for HTTPD
httpd_config 'customers' do
	instance 'customers'
	source 'customers.conf.erb'
	notifies :restart, 'httpd_service[customers]'
end

#Document Root configuration
directory node['awesome_customers']['document_root'] do
	recursive true
end

password_secret = Chef::EncryptedDataBagItem.load_secret(node['awesome_customers']['passwords']['secret_path'])
app_password_data_bag_item = Chef::EncryptedDataBagItem.load('passwords', 'db_admin_password', password_secret)

#Write a default home page
template "#{node['awesome_customers']['document_root']}/index.php" do
	source 'index.php.erb'	
	mode 0644
	user node['awesome_customers']['user']
	group node['awesome_customers']['group']
	variables({
    	:database_password => app_password_data_bag_item['password']
  	})
end

# Open port 80 to incoming traffic.
firewall_rule 'http' do
  port 80
  protocol :tcp
  action :allow
end

#httpd_module 'php5' do
	#instance 'customers'
#end

package 'php5-mysql' do
	action :install
	notifies :restart, 'httpd_service[customers]'
end
