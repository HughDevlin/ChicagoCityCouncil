require 'minitest/autorun'
require 'open-uri'

require_relative '../lib/page/votes'

describe "Meeting page" do
  URL = "http://chicago.legistar.com/HistoryDetail.aspx?ID=6688873&GUID=E6BD8439-E2BB-4310-A02F-71B71F862111"

  subject {ChicagoCityCouncil::VotesPage.new(open(URL))}

  it "has votes" do
    subject.votes.count.must_equal 50
  end

end
