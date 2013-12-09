# == Schema Information
#
# Table name: games
#
#  id               :integer          not null, primary key
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
#  season_id        :integer
#

class Game < ActiveRecord::Base
 	attr_accessible :location, :opponent, :time, :date, :official, :scrimmage, :practice, 
 					:goals, :assists, :shorthandedgoals, :powerplaygoals, :penalties, :player_ids,
 					:season_ids

	has_many :memberships
	has_many :players, through: :memberships
	has_and_belongs_to_many :seasons
	accepts_nested_attributes_for :players
	accepts_nested_attributes_for :seasons

	validates(:date, presence: true)
	
end
