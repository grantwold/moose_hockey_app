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
#

class Player < ActiveRecord::Base
  attr_accessible :assists, :firstname, :gamesplayed, :goals, :lastname, 
  				  :number, :penalties, :powerplaygoals, :shorthandedgoals

	validates(:firstname, presence: true)
	validates(:lastname, presence: true)  	
end
