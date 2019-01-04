control 'telnet-test' do
  impact 1.0
  title 'This is a telnet test'
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

# Disallow insecure protocols by testing
