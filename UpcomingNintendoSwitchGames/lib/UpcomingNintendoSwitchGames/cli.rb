class UpcomingNintendoSwitchGames::CLI

def call
  puts "Do You Want to See a List of Upcoming Nintendo Switch Games?"
  puts "Choose the Number Corresponding to your choice."
  puts "1. See List of Games"
  puts "2. Quit"
  # list games
end

def list_games
  <<~HEREDOC
  puts "Upcoming Nintendo Switch Games"
  1. Yoku's Island Express
  2. Harvest Moon: Light of Hope
  3. Street Fighter: 30th Anniversary Collection
  HEREDOC
end

def menu
  puts "Choose the Number Corresponding to the Game of your choice."
  puts "Enter 'QUIT' to quit this program"
end
