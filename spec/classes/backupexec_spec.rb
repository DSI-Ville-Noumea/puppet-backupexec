require 'spec_helper'
require 'rspec-puppet'
require 'hiera'
require 'facter'

hiera_config = 'spec/fixtures/hiera/hiera.yaml'

describe 'backupexec' do
  context 'with hiera config on RedHat' do
    let(:hiera_config) { hiera_config }
    let(:facts) do
      { :osfamily => 'RedHat' }
    end  
    it { is_expected.to contain_group('beoper') }
    it { is_expected.to contain_user('beuser').with(:groups => 'beoper') }
    it { is_expected.to contain_file('/etc/VRTSralus/ralus.cfg') }
    it { is_expected.to contain_service('VRTSralus.init') }
  end # fin context "with hiera config on Debian"
end # fin describe 'one'
