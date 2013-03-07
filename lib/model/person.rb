module ChicagoCityCouncil
  class Person
    attr_reader :name, :role, :url
    def initialize(name, role, url)
      @name, @role, @url = name, role, url
    end
  end
end
