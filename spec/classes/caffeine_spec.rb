require 'spec_helper'

describe 'caffeine' do
  let(:facts) do
    {
      :boxen_user => "foo"
    }
  end

  it "has package Caffeine" do
    should contain_package('Caffeine').with({
      :provider => 'compressed_app',
      :source   => 'http://lightheadsw.com/files/releases/com.lightheadsw.Caffeine/Caffeine1.1.1.zip'
    })
  end

  it "starts the app after config changes" do
    should contain_exec("launch caffeine").with_command '/usr/bin/open /Applications/Caffeine.app'
    should contain_exec("launch caffeine").with_refreshonly 'true'
    should contain_exec("launch caffeine").with_subscribe "File[config caffeine]"
  end

  it "set up a custom config/plist" do
    should contain_file('config caffeine').with({
      'path'     => '/Users/foo/Library/Preferences/com.lightheadsw.caffeine.plist',
      'require'  => 'Package[Caffeine]'
    })
  end

  describe "sets the content of the config/plist file" do
    it "automatically starts at login" do
      should contain_file('config caffeine').with_content /<key>ActivateOnLaunch<\/key>\s+<true\/>/
    end

    it "is enabled by default" do
      should contain_file('config caffeine').with_content /<key>DefaultDuration<\/key>\s+<integer>0<\/integer>/
    end

    it "supresses the launch message" do
      should contain_file('config caffeine').with_content /<key>SuppressLaunchMessage<\/key>\s+<true\/>/
    end
  end
end
