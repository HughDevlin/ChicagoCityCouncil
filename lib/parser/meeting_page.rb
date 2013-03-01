<<<<<<< HEAD
require_relative "page"
=======
require "parser/page"
>>>>>>> 444176d4b1fe2fb5373ca375095512d05b819565
require "watir-webdriver/wait"

class MeetingPage < Page
  def votes
    votes = Hash.new
<<<<<<< HEAD
    table = browser.table(:class, "rgMasterTable")
    rows = table.rows
    rows = rows[1..-1]
    rows = rows.find_all{ |row| row.cells.length > 7 }
=======
    # all years
    table = browser.table(:class, "rgMasterTable")
    rows = table.rows.find_all{ |row| row.cells.length > 7 }[1..-1]
>>>>>>> 444176d4b1fe2fb5373ca375095512d05b819565
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
<<<<<<< HEAD

page = MeetingPage.new("http://chicago.legistar.com/MeetingDetail.aspx?ID=194860&GUID=A3B1120F-B620-4A26-A9AB-E8E4A8A8254F&Options=info|&Search=")
votes = page.votes
puts votes.count
=======
>>>>>>> 444176d4b1fe2fb5373ca375095512d05b819565
