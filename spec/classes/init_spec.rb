require 'spec_helper'
describe 'netbackupclient' do

  context 'with defaults for all parameters' do
    it { should contain_class('netbackupclient') }
  end
end
