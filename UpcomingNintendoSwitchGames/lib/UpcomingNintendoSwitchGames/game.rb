class UpcomingNintendoSwitchGames::Game

attr_accessor :name, :release_date, :url

  def self.today
    # I should return a bunch of instances of games

    game_1 = self.new
    game_1.name = "Yoku's Island Express"
    game_1.release_date = "May 29"
    game_1.url = "http://www.metacritic.com/game/switch/yokus-island-express"

    game_2 = self.new
    game_2.name = "Harvest Moon: Light of Hope"
    game_2.release_date = "May 29"
    game_2.url = "http://www.metacritic.com/game/switch/harvest-moon-light-of-hope"

    game_3 = self.new
    game_3.name = "Street Fighter: 30th Anniversary Collection"
    game_3.release_date = "May 29"
    game_3.url = "http://www.metacritic.com/game/switch/street-fighter-30th-anniversary-collection"

    [game_1, game_2, game_3]
  end
