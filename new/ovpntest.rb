# Disallow insecure protocols by testing
describe package('openvpn') do
  it { should be_installed }
end
describe file('client.ovpn') do
  its('content') {should match(%r{tls-cipher DHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES128-SHA256:DHE-RSA-CAMELLIA256-SHA:DHE-RSA-AES256-SHA:DHE-RSA-CAMELLIA128-SHA:DHE-RSA-AES128-SHA:CAMELLIA256-SHA:AES256-SHA:CAMELLIA128-SHA:AES128-SHA})}
end
describe file('client.ovpn') do
  its('content') {should match(%r{cipher AES-256-CBC})}
end
describe file('client.ovpn') do
  its('content') {should_not match(%r{DES})}
end
