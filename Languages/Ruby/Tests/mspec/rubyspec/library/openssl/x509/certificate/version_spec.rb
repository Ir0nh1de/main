require File.dirname(__FILE__) + '/../../../../spec_helper'
require File.dirname(__FILE__) + '/../../shared/constants'
require 'openssl'

describe "OpenSSL::X509::Certificate#version" do
  it 'is 0 by default' do
    x509_cert = OpenSSL::X509::Certificate.new
    x509_cert.version.should == 0
  end
  
  it 'returns the version' do
    x509_cert = OpenSSL::X509::Certificate.new(X509Constants::X509CERT)
    x509_cert.version.should == X509Constants::X509Version
  end
end

describe "OpenSSL::X509::Certificate#version=" do
  before :each do
    @x509_cert = OpenSSL::X509::Certificate.new
  end
  
  it 'returns the argument' do
    n = 20
    (@x509_cert.version=(n)).should equal(n)
  end
  
  it 'raises TypeError if argument is nil' do
    lambda { @x509_cert.version = nil }.should raise_error(TypeError)
  end
  
  it 'raises TypeError if argument is not a OpenSSL::BN' do
    m = mock(10).should_not_receive(:to_int) 
    lambda { @x509_cert.version = m }.should raise_error(TypeError)
  end
end
