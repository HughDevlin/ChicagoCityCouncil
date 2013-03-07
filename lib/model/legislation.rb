module ChicagoCityCouncil
  class Legislation
    attr_reader :name, :title, :url, :vote_url
    def initialize(name, title, url, vote_url)
      @name, @title, @url, @vote_url = name, title, url, vote_url
    end
  end
end
