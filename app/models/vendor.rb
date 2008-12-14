class Vendor < ActiveRecord::Base
  # has_many :contacts
  # has_one :phone_numbers
  validates_presence_of :name, :on => :save, :message => "can't be blank"
  validates_presence_of :valid_contact_information, :message => "must have phone number, email address, or website url"

  validates_presence_of :valid_website_url, 
                        :message => "must be valid domain", 
                        :unless => :website_url_empty
                        
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
    domain = website_url.gsub(/^https?:\/\//,'').gsub(/\/.*$/,'')
    response = `dig +short #{domain}`
    response.size > 0
  end
end
