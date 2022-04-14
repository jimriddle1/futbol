

class Team

  attr_reader :argument
  def initialize(argument)
    @argument = row[:team_id]
  end

  @teams.each do |row|
    if row[:team_id] == team_id.to_s
      team[:team_id] = row[:team_id]
      team[:franchise_id] = row[:franchiseid]
      team[:team_name] = row[:teamname]
      team[:abbreviation] = row[:abbreviation]
      team[:link] = row[:link]
    end
  end
end
