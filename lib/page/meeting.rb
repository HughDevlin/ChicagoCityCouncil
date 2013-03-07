require "watir-webdriver/wait"

require_relative "page"
require_relative "../model/legislation"

module ChicagoCityCouncil
  class MeetingPage < ChicagoCityCouncil::Page
    def legislation
      result = Array.new
      table = browser.table(:class, "rgMasterTable")
      rows = table.rows
      rows = rows[2..-1] # skip headers, trailer
      rows = rows.find_all{ |row| row.cells.length > 7 }
      rows.each { |row|
        cells = row.cells
        name = cells[0].text.strip
        url = cells[0].a.href.strip
        next if name.length == 0
        title = cells[4]
        cells[7].a.click # go to votes page
        frame = browser.frame(:name, "HistoryDetail") 
        votes_url = frame.src.strip
        result.push Legislation.new(name, title, url, votes_url)
        browser.frame(:index, 0).locate # close iframe
      }
      result
    end
  end
end

