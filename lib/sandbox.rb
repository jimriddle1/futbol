require 'csv'

class StatTracker

  attr_reader :games, :teams, :game_teams
  def initialize
    @games = CSV.read "#{locations[:games]}", headers: true, header_converters: :symbol
    @teams = CSV.read "#{locations[:teams]}", headers: true, header_converters: :symbol
    @game_teams = CSV.read "#{locations[:game_teams]}", headers: true, header_converters: :symbol
  end

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def highest_total_score
    game_score = []
    @games.each do |row|
      game_score << row[:away_goals].to_i + row[:home_goals].to_i
    end
    p game_score.max
  end

  def team_info
    team_info = []
  end
end

## -- NOTES FROM OLD / NON-WORKING METHODS -- ##

## -- Old Team info Method attempts -- ##
    # @teams.find do |row|
    #   team_id = row[:team_id]
    #   franchise_id = row[:franchiseid]
    #   team_name = row[:teamname]
    #   abbrev = row[:abbreviation]
    #   link = row[:link]
    #   team << Hash.new(team_id, franchise_id, team_name, abbrev, link)
      # :team_id => @teams[:team_id],
      # :franchise_id => @teams[:franchiseid],
      # :team_name => @teams[:teamname],
      # :abbrev => @teams[:abbreviation],
      # :link => @teams[:link]


## -- Non-initialized class method for accessing CSVs-- ##
  # def self.from_csv(locations)
  #   big_contents = []
  #   locations.keys.each do |key|
  #     contents = CSV.read "#{locations[key]}", headers: true, header_converters: :symbol
  #     big_contents << contents
  #   end
  #   return big_contents
  #   require "pry";binding.pry
  # end


# csv methods -- .open and .read, GUESS-- .read lets you access the values stored in
# a key/value pair more easily than .open?

#ANSWER -- csv.read initializes an instance of csv and immediately stores its
#contents into an array

#ANSWER --
