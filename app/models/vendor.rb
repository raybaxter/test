class Vendor < ActiveRecord::Base
  has_many :chemicals
  
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :valid_contact_information, :message => "must have phone number, email address, or website url"
  validates_presence_of :valid_website_url, :message => "must be a valid domain", 
                        :unless => :website_url_empty
                        
  before_save :fix_phone_number
  
  def fix_phone_number
    @phone_number = PhoneNumber.strip(phone_number)
  end                      
  
  def contact_information
    [phone_number, email_address, website_url]
  end
    
  def valid_contact_information
    !contact_information.reject{|x| x.nil? or x.size == 0 }.blank?
  end  
  
  def website_url_empty
    website_url.blank?
  end
  
  def valid_website_url
    WebsiteUrl.validate(website_url)
  end
end
