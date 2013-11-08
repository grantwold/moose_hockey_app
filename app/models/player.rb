# == Schema Information
#
# Table name: players
#
#  id               :integer          not null, primary key
#  number           :integer
#  gamesplayed      :integer
#  goals            :integer
#  assists          :integer
#  shorthandedgoals :integer
#  powerplaygoals   :integer
#  penalties        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  position         :string(255)
#  name             :string(255)
#

class Player < ActiveRecord::Base
	attr_accessible :assists, :name, :gamesplayed, :goals, :number, :penalties, 
		:position, :powerplaygoals, :shorthandedgoals, :season_ids

	has_many :memberships
	has_many :seasons, through: :memberships
	accepts_nested_attributes_for :seasons

	validates(:name, presence: true)
	validates(:position, presence: true)
	validates(:number, presence: true)
	validates(:gamesplayed, presence: true)
	validates(:goals, presence: true)
	validates(:assists, presence: true)
	validates(:shorthandedgoals, presence: true)
	validates(:powerplaygoals, presence: true)
	validates(:penalties, presence: true)
end
