require 'minitest/autorun'

require_relative '../lib/page/people'

describe "People page" do
  subject {ChicagoCityCouncil::PeoplePage.new}

  it "has people" do
    subject.people.count.must_equal 52
  end

end
