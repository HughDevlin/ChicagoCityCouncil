require "minitest/autorun"

require_relative '../lib/page/calendar'

describe "Calendar page" do

  subject {ChicagoCityCouncil::CalendarPage.new}

  it "has meetings" do
    subject.meetings.count.must_equal 36
  end

  after do
    subject.close
  end

end
