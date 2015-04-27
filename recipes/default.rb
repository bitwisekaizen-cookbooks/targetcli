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

build_packages = [
    { :name => 'configshell', :guard_file => '/usr/lib/python2.7/dist-packages/configshell' },
    { :name => 'rtslib', :guard_file => '/usr/lib/python2.7/dist-packages/rtslib' },
    { :name => 'targetcli', :guard_file => '/usr/bin/targetcli' }
]

build_packages.each do |package|
  repo_dir = "#{Chef::Config[:file_cache_path]}/#{package[:name]}"
  git repo_dir do
    repository "https://github.com/Datera/#{package[:name]}.git"
    action :sync
  end

  execute 'make debinstall' do
    cwd repo_dir
    not_if { File.exists?(package[:guard_file]) }
  end
end
