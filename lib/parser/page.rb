require "rubygems"
require "watir-webdriver"

class Page
<<<<<<< HEAD
  
=======
>>>>>>> 444176d4b1fe2fb5373ca375095512d05b819565
  def initialize(url, browser = Watir::Browser.new)
    @browser = browser
    @browser.goto url
  end
<<<<<<< HEAD
  
  def close
    @browser.close
  end
  
  protected
  attr_reader :browser
  
=======
  def close
    @browser.close
  end
  protected
  attr_reader :browser
>>>>>>> 444176d4b1fe2fb5373ca375095512d05b819565
end
