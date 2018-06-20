class UpcomingNintendoSwitchGames::CLI

  attr_accessor :name, :release_date, :url, :developer, :genre, :rating, :summary, :games

def call
  list_games
  menu
end

def list_games
  puts "Upcoming Nintendo Switch Games"
  @games = Game.today
  @games.each_with_index {|game, index| puts "#{index + 1}. #{game.name} - #{game.release_date}"}
end

def menu
  input = nil
  while input != "exit"
    puts "Choose the Number Corresponding to the Game of your choice."
    puts "Enter 'exit' to exit this program"
    input = gets.strip.downcase
    if input.to_i > 0
      game = @games[input.to_i - 1]
      the_game = Game.scrape_game(game)
      puts "#{the_game.name} - #{the_game.release_date} -
      #{the_game.developer} - #{the_game.genre} -
      #{the_game.summary}"
    elsif input == "exit"
      exit
  end
end
end

end
