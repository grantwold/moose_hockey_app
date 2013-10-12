# == Schema Information
#
# Table name: players
#
#  id               :integer          not null, primary key
#  firstname        :string(255)
#  lastname         :string(255)
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
#

class Player < ActiveRecord::Base
  attr_accessible :assists, :firstname, :gamesplayed, :goals, :lastname, 
  				  :number, :penalties, :position, :powerplaygoals, :shorthandedgoals

  	has_many :memberships
  	has_many :teams, through: :memberships

	validates(:firstname, presence: true)
	validates(:lastname, presence: true)
	validates(:position, presence: true)
	validates(:number, presence: true)
	validates(:gamesplayed, presence: true)
	validates(:goals, presence: true)
	validates(:assists, presence: true)
	validates(:shorthandedgoals, presence: true)
	validates(:powerplaygoals, presence: true)
	validates(:penalties, presence: true)
end
