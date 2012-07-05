require 'test/unit'
require 'lib/parser/calendar_page'

class TestCalendarPage < Test::Unit::TestCase
  def test_get_meetings
    page = CalendarPage.new
    assert_equal 97, page.meetings.count
    page.close
  end
end