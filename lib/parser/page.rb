require "rubygems"
require "watir-webdriver"

class Page
  def initialize(url, browser = Watir::Browser.new)
    @browser = browser
    @browser.goto url
  end
  def close
    @browser.close
  end
  protected
  attr_reader :browser
end
