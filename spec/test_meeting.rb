require 'minitest/autorun'

require_relative '../lib/page/meeting'

describe "Meeting page" do
  URL = "http://chicago.legistar.com/MeetingDetail.aspx?ID=194860&GUID=A3B1120F-B620-4A26-A9AB-E8E4A8A8254F"

  subject {ChicagoCityCouncil::MeetingPage.new(URL)}

  it "has votes" do
    subject.legislation.count.must_equal 200
  end

  after do
    subject.close
  end

end
