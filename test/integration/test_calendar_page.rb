require 'minitest/autorun'
require_relative '../../lib/parser/calendar_page'

class TestCalendarPage < MiniTest::Unit::TestCase
  
  def setup
    @page = CalendarPage.new
  end
  
  def test_get_meetings
    assert_equal 36, @page.meetings.count
  end
  
  def teardown
    @page.close
  end

end