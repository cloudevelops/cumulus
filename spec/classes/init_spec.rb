require 'spec_helper'
describe 'cumulus' do

  context 'with defaults for all parameters' do
    it { should contain_class('cumulus') }
  end
end
