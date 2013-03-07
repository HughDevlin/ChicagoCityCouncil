require 'nokogiri'
require 'open-uri'
require 'multimap'

require_relative "../model/person"

module ChicagoCityCouncil
  class PeoplePage
    def people
      result = Array.new
      doc = Nokogiri::Slop(open('http://chicago.legistar.com/People.aspx'))
      doc.css('tr.rgRow, tr.rgAltRow').each do |tr|
        a = tr.td[0].a
        name = a.text
        role = tr.td[1].text
        url = a['href']
        # puts "#{name} (#{role}): #{url}"
        result.push Person.new(name, role, url)
      end
      result
    end
  end
end
