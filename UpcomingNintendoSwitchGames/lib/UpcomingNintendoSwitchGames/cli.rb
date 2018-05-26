class UpcomingNintendoSwitchGames::CLI

def call
  # puts "Do You Want to See a List of Upcoming Nintendo Switch Games?"
  # puts "Choose the Number Corresponding to your choice."
  # puts "1. See List of Games"
  # puts "2. Quit"
  # input = gets.strip
  # if input = "1" || "1."
  list_games
  menu
  goodbye
end

def list_games
  puts "Upcoming Nintendo Switch Games"
  @games = UpcomingNintendoSwitchGames::Game.today\
  @games.each.with_index(1) do |game, i|
    puts "#{i}. #{game.name} - #{game.release_date}"
end
end

def menu
  puts "Choose the Number Corresponding to the Game of your choice."
  puts "Enter 'QUIT' to quit this program"
  input = nil
  while input != "QUIT"
    input = gets.strip.downcase
    if input.to_i > 0
      puts @games[input.to_i - 1]
    case input
    when "1"
      puts "More info on 1..."
    when "2"
      puts "More info on 2..."
    when "3"
      puts "More info on 3..."
    else
      puts "There is no game corresponding with that number.  Please try again
      or enter 'QUIT' to exit this program."
    end
  end
end


def goodbye
  puts "Thanks for your interest in Upcoming Nintendo Switch Games."
end

end
