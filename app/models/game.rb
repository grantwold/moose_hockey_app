# == Schema Information
#
# Table name: games
#
#  id               :integer          not null, primary key
#  player_id        :integer
#  season_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  location         :string(255)
#  opponent         :string(255)
#  official         :boolean
#  time             :time
#  date             :date
#  goals            :integer
#  assists          :integer
#  shorthandedgoals :integer
#  powerplaygoals   :integer
#  penalties        :integer
#  scrimmage        :boolean
#  practice         :boolean
#

class Game < ActiveRecord::Base
 	attr_accessible :location, :opponent, :time, :date, :official, :scrimmage, :practice, 
 					:goals, :assists, :shorthandedgoals, :powerplaygoals, :penalties

  	belongs_to :player
	belongs_to :season

	validates(:date, presence: true)
	
end
