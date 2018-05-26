class UpcomingNintendoSwitchGames::CLI

def call
  list_games
  menu
  goodbye
end

def list_games
  puts "Do You Want to See a List of Upcoming Nintendo Switch Games?"
  puts "Choose the Number Corresponding to your choice."
  puts "1. See List of Games"
  puts "2. Quit"
  input = gets.strip
  if input = "1" || "1."
  puts "Upcoming Nintendo Switch Games"
  puts "1. Yoku's Island Express"
  puts "2. Harvest Moon: Light of Hope"
  puts "3. Street Fighter: 30th Anniversary Collection"
end
@games = UpcomingNintendoSwitchGames::Game.today
end

def menu
  puts "Choose the Number Corresponding to the Game of your choice."
  puts "Enter 'QUIT' to quit this program"
  input = nil
  while input != "QUIT"
    input = gets.strip.downcase
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
