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

  def self.today
    self.scrape_metacritic
  end

  def self.scrape_metacritic
    doc = Nokogiri::HTML(open("http://www.metacritic.com/browse/games/release-date/coming-soon/switch/date",
    ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'safari'))
    games = []
    doc.css('div.product_wrap').each do |game|
      name = game.css('div.product_title').text.gsub(/\s+/, " ")
      release_date = game.css('li.stat.release_date').text.gsub(/\s+/, " ")
      url = game.css('div.product_title a')[0]["href"]
      games << {name: name, release_date: release_date, url: url}
    end
    games
  end

def self.scrape_game(url)
  url = "http://www.metacritic.com" + url
  profile = Nokogiri::HTML(open(url,
  ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'safari'))
  game_info = []
  profile.css('div.layout').each do |the_game|
    name = the_game.css('div.product_title').text.gsub(/\s+/, " ")
    release_date = the_game.css('li.summary_detail.release_data').text.gsub(/\s+/, " ")
    developer = the_game.css('li.summary_detail.developer').text.gsub(/\s+/, " ")
    genre = the_game.css('li.summary_detail.product_genre').text.gsub(/\s+/, " ")
    summary = the_game.css('li.summary_detail.product_summary').text.gsub(/\s+/, " ")
    game_info << {name: name, release_date: release_date, developer: developer,
    genre: genre, summary: summary}
end
game_info
end

end
