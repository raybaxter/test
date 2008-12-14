require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WebsiteUrl do
  before(:all) do
    p "These specs require a working Internet connection"
  end
  
  it "should be valid with only the url of a registered domain name" do
    WebsiteUrl.validate("example.com").should be_true
  end
  
  it "should not be valid with the url for an non-existent domain" do
    WebsiteUrl.validate("if_this_domain_is_created_this_test_will_fail.com").should be_false 
  end
  
  it "should not be valid with a blank url" do
    WebsiteUrl.validate("").should be_false 
  end
  
  it "should be valid with the url of a registered domain name beginning with 'http://" do
    WebsiteUrl.validate("http://example.com").should be_true
  end

  it "should be valid with the url of a registered domain name beginning with 'https://" do
    WebsiteUrl.validate("https://example.com").should be_true
  end
  
  it "should be valid with a url containing a path" do
    WebsiteUrl.validate("https://example.com/arbitrary/path?with=params&query=x").should be_true
  end
      
  it "should not be valid with a blank domain" do
    WebsiteUrl.validate("https:///arbitrary/path?with=params&query=x").should be_false 
  end
end  
