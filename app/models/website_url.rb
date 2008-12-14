class WebsiteUrl
  
  def self.validate(url)
    domain = url.gsub(/^https?:\/\//,'').gsub(/\/.*$/,'').strip
    return false unless domain.size > 0
    response = `dig +short #{domain}`
    response.size > 0
  end
end
