# encoding: utf-8
# copyright: 2018, The Authors

title 'Example project for telnet'


# you add controls here
control 'Checking telnet' do                # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title 'Checking telnet'                   # A human-readable title
  desc 'Check whether we have telnet installed and running'
  describe package('telnetd') do
    it { should_not be_installed }
  end

  describe inetd_conf do
    its("telnet") { should eq nil }
  end

  describe port(23) do
    it { should be_listening }
  end

end
