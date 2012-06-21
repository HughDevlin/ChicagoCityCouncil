# HJD 2012-06-21
require "rubygems"
require "watir-webdriver"

class Meetings
  def Meetings.getMeetings(browser)
    meetings = Hash.new
    # all years
    browser.link(:id, "ctl00_ContentPlaceHolder1_lstYears_Arrow").click
    browser.lis(:class, "rcbItem ")[0].click
    browser.link(:id, "ctl00_ContentPlaceHolder1_lstBodies_Arrow").click
    browser.li(:xpath, "//li[@class='rcbItem ' and .='City Council']").click
    browser.button(:id, "ctl00_ContentPlaceHolder1_btnSearch").click
    table = browser.table(:class, "rgMasterTable")
    rows = table.rows.find_all{ |row| row.cells.length > 4 }[1..-1]
    rows.each { |row|
      cells = row.cells
      date = Date.parse(cells[1].text, '%m/%d/%Y')
      link = cells[4].a.attribute_value("href")
      meetings[date] = link
    }
    meetings
  end
end

def Meetings.getDocuments(browser)
  documents = Hash.new
  table = browser.table(:class, "rgMasterTable")
  rows = table.rows.find_all{ |row| row.cells.length > 7 }[1..-1]
  rows.each { |row|
    cells = row.cells
    document = cells[0].text.strip
    next if document.length == 0
    link = cells[7].a.attribute_value("href")
    documents[document] = link
  }
  documents
end

def Meetings.getVotes(browser)
  votes = Hash.new
  # all years
  table = browser.table(:class, "rgMasterTable")
  rows = table.rows.find_all{ |row| row.cells.length > 7 }[1..-1]
  rows.each { |row|
    cells = row.cells
    document = cells[0].text.strip
    next if document.length == 0
    link = cells[7].a.attribute_value("href")
    votes[document] = link
  }
  votes
end

$browser = Watir::Browser.new :firefox

#$browser.goto "http://chicago.legistar.com/Calendar.aspx"
#meetings = Meetings.getMeetings $browser
#start = Date.parse('2011-06-01')
#meetings.find_all{ |key, value| key > start}.sort.each{ |a|
#  puts "#{a[0]} > #{a[1]}"
#}
#$browser.goto meetings.values[0]

#$browser.goto "http://chicago.legistar.com/MeetingDetail.aspx?ID=194860&GUID=A3B1120F-B620-4A26-A9AB-E8E4A8A8254F&Options=info|&Search="
#documents = Meetings.getDocuments $browser
#documents.sort.each{ |a|
#  puts "#{a[0]} > #{a[1]}"
#}

$browser.goto "http://chicago.legistar.com/MeetingDetail.aspx?ID=194860&GUID=A3B1120F-B620-4A26-A9AB-E8E4A8A8254F&Options=info|&Search=#"
votes = Meetings.getVotes $browser
votes.sort.each{ |a|
  puts "#{a[0]} > #{a[1]}"
}

$browser.close
puts "Done."
