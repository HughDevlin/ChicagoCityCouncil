require_relative "page"
require "watir-webdriver/wait"

class MeetingPage < Page
  
  def votes
    votes = Hash.new
    table = browser.table(:class, "rgMasterTable")
    rows = table.rows
    rows = rows[1..-1]
    rows = rows.find_all{ |row| row.cells.length > 7 }
    rows.each { |row|
      cells = row.cells
      document = cells[0].text.strip
      next if document.length == 0
      cells[7].a.click
      div = browser.div(:id, "RadWindowWrapper_ctl00_ContentPlaceHolder1_RadWindow2")
      frame = div.frame
      vote_table = frame.table(:id, "ctl00_ContentPlaceHolder1_tblVote2").table(:id, "ctl00_ContentPlaceHolder1_gridVote_ctl00")
      rows = vote_table.rows[1..-1]
      puts "number of votes=#{rows.length}" # skip header
      rows.each { |row|
        votes[row.cells[0].a.text] = row.cells[1].text
        puts "#{row.cells[0].a.text} > #{row.cells[1].text}"
      }
      div.a(:class, "rwCloseButton").click
    }
    votes
  end

end

