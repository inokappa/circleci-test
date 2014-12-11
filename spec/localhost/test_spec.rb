require 'spec_helper'

describe file ('/tmp') do
  it { should be_directory } 
end

describe package ('apache2') do
  it { should be_installed } 
end
