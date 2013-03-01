require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://chicago.legistar.com/Calendar.aspx'))

# Search for nodes by css
doc.css('td a').each do |link|
  puts link.content
end