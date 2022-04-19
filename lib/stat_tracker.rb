require 'csv'
require_relative 'futbol_csv_reader'
require_relative 'game_child'
require_relative 'league_child'
require_relative 'seasons_child'
require_relative 'teams_child'

class StatTracker
<<<<<<< HEAD

  attr_reader :games, :teams, :game_teams

=======
>>>>>>> 1319766726c806238171e6bbd28c02d1e13146ef
  def initialize(locations)
    @game_child = GameChild.new(locations)
    @league_child = LeagueChild.new(locations)
    @seasons_child = SeasonsChild.new(locations)
    @teams_child = TeamsChild.new(locations)
  end

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def highest_total_score
    @game_child.highest_total_score
  end

  def lowest_total_score
    @game_child.lowest_total_score
  end

  def team_info(given_team_id)
<<<<<<< HEAD
    team = {}
    @teams.each do |row|
      if row.team_id == given_team_id
        team[:team_id] = row.team_id
        team[:franchise_id] = row.franchise_id
        team[:team_name] = row.team_name
        team[:abbreviation] = row.abbreviation
        team[:link] = row.link
      end
    end
    return team
  end

  def game_teams_by_season(season)
    @game_teams.select do |row|
      row.game_id.to_s[0..3] == season.to_s[0..3]
    end
  end

  def game_teams_by_team(team_id)
    @game_teams.select do |row|
      row.team_id == team_id
    end
  end

  def coaches_records(game_teams)
    hash = Hash.new{|h,k| h[k] = [0,0,0.to_f] }
    game_teams.each do |row|
      if row.result == "WIN"
        hash[row.head_coach][0] += 1
      else
        hash[row.head_coach][1] += 1
      end
    end
    return hash
  end

  def win_tallies
    game_results = Hash.new({:home_wins => 0, :home_losses => 0, :away_wins => 0, :away_losses => 0, :home_ties => 0, :away_ties => 0})
      @game_teams.each do |game|
        if game.hoa == "home" && game.result == "WIN"
          game_results[:game_data][:home_wins] += 1
        elsif game.hoa == "home" && game.result == "LOSS"
          game_results[:game_data][:home_losses] += 1
        elsif game.hoa == "away" && game.result == "WIN"
          game_results[:game_data][:away_wins] += 1
        elsif game.hoa == "away" && game.result == "LOSS"
          game_results[:game_data][:away_losses] += 1
        elsif game.hoa == "home" && game.result == "TIE"
          game_results[:game_data][:home_ties] += 1
        else game.hoa == "away" && game.result == "TIE"
          game_results[:game_data][:away_ties] += 1
        end
      end
      game_results
=======
    @teams_child.team_info(given_team_id)
>>>>>>> 1319766726c806238171e6bbd28c02d1e13146ef
  end

  def percentage_home_wins
    @game_child.percentage_home_wins
  end

  def percentage_away_wins
    @game_child.percentage_away_wins
  end

  def percentage_ties
    @game_child.percentage_ties
  end

  def count_games_by_season
    @game_child.count_games_by_season
  end

  def average_goals_by_season
    @game_child.average_goals_by_season
  end

  def average_goals_per_game
    @game_child.average_goals_per_game
  end

  def winningest_coach(season)
    @seasons_child.winningest_coach(season)
  end

  def worst_coach(season)
    @seasons_child.worst_coach(season)
  end

  def most_accurate_team(season)
    @seasons_child.most_accurate_team(season)
  end

  def least_accurate_team(season)
    @seasons_child.least_accurate_team(season)
  end

  def tackle_hash(season)
    @seasons_child.tackle_hash(season)
  end

  def most_tackles(season)
    @seasons_child.most_tackles(season)
  end

  def fewest_tackles(season)
    @seasons_child.fewest_tackles(season)
  end

  def best_season(id)
    @teams_child.best_season(id)
  end

  def win_percentage_by_team_id(id)
    @teams_child.win_percentage_by_team_id(id)
  end

  def worst_season(id)
    @teams_child.worst_season(id)
  end

  def most_goals_scored(id)
    @teams_child.most_goals_scored(id)
  end

  def fewest_goals_scored(id)
    @teams_child.fewest_goals_scored(id)
  end

  def average_win_percentage(id)
    @teams_child.average_win_percentage(id)
  end

  def games_by_team(team_id)
    @teams_child.games_by_team(team_id)
  end

  def favorite_opponent(id)
    @teams_child.favorite_opponent(id)
  end

  def rival(id)
    @teams_child.rival(id)
  end

  def count_of_teams
    @league_child.count_of_teams
  end

  def best_offense(hoa = nil)
    @league_child.best_offense
  end

  def worst_offense(hoa = nil)
    @league_child.worst_offense
  end

  def highest_scoring_visitor
    @league_child.highest_scoring_visitor
  end

  def highest_scoring_home_team
    @league_child.highest_scoring_home_team
  end

  def lowest_scoring_visitor
    @league_child.lowest_scoring_visitor
  end

  def lowest_scoring_home_team
    @league_child.lowest_scoring_home_team
  end
end
