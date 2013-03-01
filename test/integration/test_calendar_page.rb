<<<<<<< HEAD
require 'minitest/autorun'
require_relative '../../lib/parser/calendar_page'

class TestCalendarPage < MiniTest::Unit::TestCase
  
  def setup
    @page = CalendarPage.new
  end
  
  def test_get_meetings
    assert_equal 38, @page.meetings.count
  end
  
  def teardown
    @page.close
=======
require 'test/unit'
require 'lib/parser/calendar_page'

class TestCalendarPage < Test::Unit::TestCase
  def test_get_meetings
    page = CalendarPage.new
    assert_equal 97, page.meetings.count
    page.close
>>>>>>> 444176d4b1fe2fb5373ca375095512d05b819565
  end
end