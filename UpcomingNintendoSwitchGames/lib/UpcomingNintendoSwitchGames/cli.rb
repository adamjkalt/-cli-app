class UpcomingNintendoSwitchGames::CLI

  attr_accessor :name, :release_date, :url, :developer, :genre, :rating, :summary, :games

def call
  list_games
  menu
end

def list_games
  puts "Upcoming Nintendo Switch Games"
  # @games = Game.today
  @@all = Game.today
  # binding.pry
  # @games.each_with_index {|game, index| puts "#{index + 1}. #{game[:name]} - #{game[:release_date]}"}
end

def menu
  # Need to scrape actual game and return data
  input = nil
  while input != "exit"
    puts "Choose the Number Corresponding to the Game of your choice."
    puts "Enter 'exit' to exit this program"
    input = gets.strip.downcase
    if input.to_i > 0
      game_url = @games[input.to_i - 1][:url]
      the_game = Game.scrape_game(game_url)[0]
      puts "#{the_game[:name]} - #{the_game[:release_date]} -
      #{the_game[:developer]} - #{the_game[:genre]} -
      #{the_game[:summary]}"
    elsif input == "exit"
      exit
  end
end
end

end
