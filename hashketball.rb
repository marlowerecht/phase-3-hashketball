# Write your code below game_hash
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def all_players
  game_hash[:home][:players] + game_hash[:away][:players]
end

def get_player_by_name player_name
  all_players.find do |player|
    player[:player_name] == player_name
  end
end

def get_team_by_name team_name
  #return team
  game_hash.find do |key, value|
    value[:team_name] == team_name
  end
  team_info[1]
end

def num_points_scored player
  all_players.find do |person|
    if person[:player_name] == player
      return person[:points]
    end
  end
end

def shoe_size player
  all_players.find do |person|
    if person[:player_name] == player
      return person[:shoe]
    end
  end
end

def team_colors team
  if game_hash[:home][:team_name] == team
    game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team
    game_hash[:away][:colors]
  end
end

def team_names
  team_name_array = []
  team_name_array << game_hash[:home][:team_name]
  team_name_array << game_hash[:away][:team_name]
end

def player_numbers team
  player_number_array = []
  if team == game_hash[:home][:team_name]
    game_hash[:home][:players].map do |person|
      player_number_array << person[:number]
    end
    player_number_array
  elsif team == game_hash[:away][:team_name]
    game_hash[:away][:players].map do |person|
      player_number_array << person[:number]
    end
    player_number_array
  end
end

def player_stats player_name
  all_players.find do |player|
    if player[:player_name] == player_name
      return player
    end
  end
end

def big_shoe_rebounds
  sorted_by_shoe_size = all_players.sort do |player1, player2|
    if player1[:shoe] == player2[:shoe]
      0
    elsif player1[:shoe] < player2[:shoe]
      -1
    elsif player1[:shoe] > player2[:shoe]
      1
    end
  end
  biggest_shoe_size_player = sorted_by_shoe_size[-1]
  biggest_shoe_size_player[:rebounds]
end