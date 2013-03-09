require 'nokogiri'

module ChicagoCityCouncil
  class VotesPage
    def initialize(html)
      @doc = Nokogiri::Slop(html)
    end
    
    def votes
      result = Hash.new
      trs = @doc.css("table#ctl00_ContentPlaceHolder1_tblVote2 table#ctl00_ContentPlaceHolder1_gridVote_ctl00 tr")
      trs = trs[1..-1] # skip header
      # puts "number of votes=#{trs.length}"
      trs.each { |tr| #loop thru votes
        result[tr.td[0].a.text] = tr.td[1].text # name -> vote
        # puts "#{tr.td[0].a.text} > #{tr.td[1].text}"
      } if trs.length > 1 # no records to display (placed on file)         
      result
    end
    
    def pdf
      @doc.css("span#ctl00_ContentPlaceHolder1_lblAttachments2 a")['href']
    end
  end
end

