class Game

attr_accessor :name, :release_date, :url, :developer, :genre, :summary

@@all = []

def initialize(name:, release_date:, url:, developer:, genre:, summary:)
    @name = name
    @release_date = release_date
    @url = url
    @developer = developer
    @genre = genre
    @summary = summary
  end

  def self.all
      @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    game = self.new(name)
    @@all << game
    game
  end

  def self.today
    self.scrape_metacritic
  end

  def self.scrape_metacritic
    doc = Nokogiri::HTML(open("http://www.metacritic.com/browse/games/release-date/coming-soon/switch/date",
    ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'safari'))
    # games = []
    doc.css('div.product_wrap').each do |game|
      # Below was originally just name, release_date, and url
      self.name = game.css('div.product_title').text.gsub(/\s+/, " ")
      self.release_date = game.css('li.stat.release_date').text.gsub(/\s+/, " ")
      self.url = game.css('div.product_title a')[0]["href"]
      # games << {name: name, release_date: release_date, url: url}
      # originally just above shovelling into games.
      self.save
    end
    # games
  end

def self.scrape_game(game)
  url = "http://www.metacritic.com" + game.url
  profile = Nokogiri::HTML(open(url,
  ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'safari'))
  # game_info = []
  profile.css('div.layout').each do |the_game|
    # Below was originally just name, release_date, etc, etc.
    self.name = the_game.css('div.product_title').text.gsub(/\s+/, " ")
    self.release_date = the_game.css('li.summary_detail.release_data').text.gsub(/\s+/, " ")
    self.developer = the_game.css('li.summary_detail.developer').text.gsub(/\s+/, " ")
    self.genre = the_game.css('li.summary_detail.product_genre').text.gsub(/\s+/, " ")
    self.summary = the_game.css('li.summary_detail.product_summary').text.gsub(/\s+/, " ")
    # game_info << {name: name, release_date: release_date, developer: developer,
    genre: genre, summary: summary}
    self.save
end
# game_info
end

end
