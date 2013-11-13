# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  player_id    :integer
#  season_id    :integer
#  statistic_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Game < ActiveRecord::Base
  
  	belongs_to :player
	belongs_to :season
	belongs_to :statistic
	
end
