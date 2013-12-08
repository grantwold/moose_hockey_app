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
#  location     :string(255)
#  opponent     :string(255)
#  time         :datetime
#  official     :boolean
#

class Game < ActiveRecord::Base
 	attr_accessible :location, :opponent, :time, :date, :official

  	belongs_to :player
	belongs_to :season
	has_one :statistic

	validates(:location, presence: true)
	
end
