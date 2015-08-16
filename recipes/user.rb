#
# Cookbook Name:: awesome_customers
# Recipe:: user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#group 'web_admin'

group node['awesome_customers']['group']

user node['awesome_customers']['user'] do
	group node['awesome_customers']['group']
	system true
	shell '/bin/bash'
end
