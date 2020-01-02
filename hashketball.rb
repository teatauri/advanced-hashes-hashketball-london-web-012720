require 'pry'

def game_hash
  game_hash = {
    :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => 
        
             [{ :player_name => "Alan Anderson", 
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1 },
                
              { :player_name => "Reggie Evans", 
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7 },
            
              { :player_name => "Brook Lopez", 
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15 },
              
              { :player_name => "Mason Plumlee", 
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 11,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5 },
          
              { :player_name => "Jason Terry", 
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1 }]
        },
    
    :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => 
        
             [{ :player_name => "Jeff Adrien", 
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2 },
                
              { :player_name => "Bismack Biyombo", 
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 22,
                :blocks => 15,
                :slam_dunks => 10 },
            
              { :player_name => "DeSagna Diop", 
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5 },
              
              { :player_name => "Ben Gordon", 
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0 },
          
              { :player_name => "Kemba Walker", 
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 7,
                :blocks => 5,
                :slam_dunks => 12 }]
       },
  }
  game_hash
end 

########## NUM POINTS SCORED ##########

def num_points_scored(player)
  hash = game_hash()
  hash.each do |team, attributes|
     i = 0
     players = hash[team][:players]
     while i < players.length
          if players[i][:player_name] == player
            return players[i][:points]
          end
     i += 1
     end
  end
end

########## RETURN PLAYER SHOE SIZE ##########

def shoe_size(player)
  hash = game_hash()
  hash.each do |team, attributes|
    i = 0
    players = hash[team][:players]
    while i < players.length
        if players[i][:player_name] == player
          return players[i][:shoe]
        end
    i += 1
    end
  end
end

########## RETURN TEAM COLOURS ##########

def team_colors(name)
  hash = game_hash()
  hash.each do |team, attributes|
     if hash[team][:team_name] == name
       return hash[team][:colors]
     end
  end
end

########## RETURN TEAM NAMES ##########

def team_names
  hash = game_hash()
  names = []
    hash.each do |team, attributes|
      names << hash[team][:team_name]
    end
  names
end

########## RETURN PLAYER NUMBER ##########

def player_numbers(name)
   hash = game_hash()
   numbers = []
   hash.each do |team, attributes|
     i = 0
     players = hash[team][:players]
     while i < players.length
         if hash[team][:team_name] == name
           numbers << players[i][:number]
         end
     i += 1
     end
   end
  numbers
end

########## RETURN PLAYER STATS ##########

def player_stats(name)
  hash = game_hash()
  hash.each do |team, attributes|
    i = 0
    players = hash[team][:players]
    while i < players.length
      if players[i][:player_name] == name
        return players[i].reject {|k,v| k == :player_name}
      end
      i += 1
    end
  end
end

########## REBOUNDS FOR BIGGEST SHOE ##########

def big_shoe_rebounds
  hash = game_hash()
  
  # Find biggest shoe
  shoe_size = []
  hash.each do |team, attributes|
    i = 0
    players = hash[team][:players]
    while i < players.length
      shoe_size << players[i][:shoe]
    i += 1
    end
  end
  max = shoe_size.max
  
  # Find big shoe rebounds
  hash.each do |team, attributes|
    i = 0
    players = hash[team][:players]
    while i < players.length
      if players[i][:shoe] == max
        return players[i][:rebounds]
      end
    i += 1
    end
  end
end

########## MOST POINTS SCORED ##########

def most_points_scored
  hash = game_hash()

  # Find the most points scored
  points = []
  hash.each do |team, attributes|
    i = 0
    players = hash[team][:players]
    while i < players.length
      points << players[i][:points]
    i += 1
    end
  end
  max = points.max()

  # Return player name 
  hash.each do |team, attributes|
    i = 0
    players = hash[team][:players]
    while i < players.length
      if players[i][:points] == max
        return players[i][:player_name]
      end
    i += 1
    end
  end
end

########## RETURN WINNING TEAM ##########

def winning_team
  hash = game_hash()
  team1 = []
  team2 = []
  hash.each do |team, attributes|
    i = 0
    players = hash[team][:players]
    while i < players.length
        if hash[team][:team_name] == "Brooklyn Nets"
          team1 << players[i][:points]
        else
          team2 << players[i][:points]
        end
    i += 1
    end
  end
  score1 = team1.reduce(0) {|sum, n| sum + n}
  score2 = team2.reduce(0) {|sum, n| sum + n}
  score1 > score2 ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
  hash = game_hash()
  names = []
  hash.each do |team, attrubutes|
    players = hash[team][:players]
    i = 0
    while i < players.length
      names << players[i][:player_name]
    i += 1
    end
  end
  return names.max_by(&:length)
end

def long_name_steals_a_ton?
  hash = game_hash()
  longname = player_with_longest_name()
  steals = []
  
  # Find the most steals 
  hash.each do |team, attributes|
    attributes.each do |key, stats|
      if key == :players
        stats.each do |player|
          steals << player[:steals]
        end
      end
    end
  end
  max = steals.max
  
  # Find if player with most steals also has longest name
  hash.each do |team, attributes|
    players = hash[team][:players]
    i = 0
    while i < players.length
      if players[i][:player_name] == longname
        if players[i][:steals] == max
          return true
        end
      end
    i += 1
    end
  end
end
