# == Schema Information
#
# Table name: games
#
#  id                      :integer          not null, primary key
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  location                :string(255)
#  opponent                :string(255)
#  official                :boolean
#  time                    :time
#  date                    :date
#  scrimmage               :boolean
#  practice                :boolean
#  moose_goals             :integer
#  opponent_goals          :integer
#  moose_assists           :integer
#  opponent_assists        :integer
#  moose_shg               :integer
#  opponent_shg            :integer
#  moose_ppg               :integer
#  opponent_ppg            :integer
#  moose_penalties         :integer
#  opponent_penalties      :integer
#  opponents_shots_on_goal :integer
#  moose_shots_on_goal     :integer
#

class Game < ActiveRecord::Base
 	attr_accessible :location, :opponent, :time, :date, :official, :scrimmage, 
 					:practice, :opponent_goals, :opponent_assists, :opponent_shg, 
 					:opponent_ppg, :opponent_penalties, :opponents_shots_on_goal, 
 					:moose_goals, :moose_assists, :moose_shg, :moose_ppg, 
 					:moose_penalties, :moose_shots_on_goal, :player_ids, :season_ids

	has_many :memberships
	has_many :players, through: :memberships
	has_and_belongs_to_many :seasons
	accepts_nested_attributes_for :players
	accepts_nested_attributes_for :seasons

	validates(:date, presence: true)
	
end
