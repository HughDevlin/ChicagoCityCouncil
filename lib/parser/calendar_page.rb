require 'lib/parser/page'

class CalendarPage < Page
  def initialize
    super("http://chicago.legistar.com/Calendar.aspx")
  end

  def meetings
    meetings = Hash.new
    # all years
    browser.link(:id, "ctl00_ContentPlaceHolder1_lstYears_Arrow").click
#    browser.lis(:class, "rcbItem ")[0].click
    browser.lis(:class, "rcbItem ").each { |item|
      next if not item.text.eql?('All Years')
      item.click
    }
    browser.link(:id, "ctl00_ContentPlaceHolder1_lstBodies_Arrow").click
    browser.li(:xpath, "//li[@class='rcbItem ' and .='City Council']").click
    browser.button(:id, "ctl00_ContentPlaceHolder1_btnSearch").click
    table = browser.table(:class, "rgMasterTable")
    rows = table.rows.find_all{ |row| row.cells.length > 4 }[1..-1]
    rows.each { |row|
      cells = row.cells
      cell = cells[1].text
      date = Date.strptime(cell, '%m/%d/%Y')
      link = cells[4].a.attribute_value("href")
      meetings[date] = link
    }
    meetings
  end

end
