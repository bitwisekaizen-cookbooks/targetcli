#
# Cookbook Name:: targetcli
# Recipe:: default
#
include_recipe 'apt'

node[:targetcli][:packages].each do |package|
  package package do
    action :install
  end
end

%w(configshell rtslib targetcli).each do |package|
  repo_dir = "#{Chef::Config[:file_cache_path]}/#{package}"
  git repo_dir do
    repository "https://github.com/Datera/#{package}.git"
    action :sync
  end

  execute 'make debinstall' do
    cwd repo_dir
  end
end
