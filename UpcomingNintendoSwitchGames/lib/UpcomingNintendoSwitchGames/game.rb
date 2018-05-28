# class UpcomingNintendoSwitchGames::Game

class Game

attr_accessor :name, :release_date, :url, :developer, :genre, :rating, :summary

  def self.today
    self.scrape_games
  end

  def self.scrape_games
    games = []
    games << self.scrape_metacritic
    # go to metacritic, find game
    # extrac the properties
    # instantiate the game
    games
  end

  def self.scrape_metacritic
    doc = Nokogiri::HTML(open("http://www.metacritic.com/browse/games/release-date/coming-soon/switch/date",
    ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'safari'))
    games = []
    doc.css('div.product_wrap').each do |game|
      name = game.css('div.product_title').text
      release_date = game.css('li.stat.release_date').text
      games << {name: name, release_date: release_date}
    end
    games
  end
  # Method is finding games and release dates - need to fix formatting

def self.scrape_game
  doc = Nokogiri::HTML(open("http://www.metacritic.com/browse/games/release-date/coming-soon/switch/date",
  ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'safari'))
  binding.pry
end


# game_1 = self.new
# game_1.name = "Yoku's Island Express"
# game_1.release_date = "May 29"
# game_1.url = "http://www.metacritic.com/game/switch/yokus-island-express"
#
# game_2 = self.new
# game_2.name = "Harvest Moon: Light of Hope"
# game_2.release_date = "May 29"
# game_2.url = "http://www.metacritic.com/game/switch/harvest-moon-light-of-hope"
#
# game_3 = self.new
# game_3.name = "Street Fighter: 30th Anniversary Collection"
# game_3.release_date = "May 29"
# game_3.url = "http://www.metacritic.com/game/switch/street-fighter-30th-anniversary-collection"
#
# [game_1, game_2, game_3]

end
