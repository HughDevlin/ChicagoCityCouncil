require 'minitest/autorun'
require '../../lib/parser/meeting_page'

class TestMeetingPage < MiniTest::Unit::TestCase
  
  def test_get_votes
    @page = MeetingPage.new("http://chicago.legistar.com/MeetingDetail.aspx?ID=194860&GUID=A3B1120F-B620-4A26-A9AB-E8E4A8A8254F&Options=info|&Search=")
  end

  def test_get_votes
    votes = @page.votes
    assert_equal 182, votes.count
    votes.each { |vote|
      puts "#{vote[0]} > #{vote[1]}"
    }
  end

  def teardown
    @page.close
  end

end