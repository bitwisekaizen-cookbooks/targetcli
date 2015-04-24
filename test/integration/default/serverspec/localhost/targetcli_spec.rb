require 'serverspec'
require 'json'

set :backend, :exec

describe command('targetcli version') do
  its(:exit_code) { should eq 0 }
  its(:stdout) { should match /^Using targetcli version 3.0.pre4.3~g0fba804$/}
end