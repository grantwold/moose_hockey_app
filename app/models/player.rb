# == Schema Information
#
# Table name: players
#
#  id          :integer          not null, primary key
#  number      :integer
#  gamesplayed :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position    :string(255)
#  name        :string(255)
#

class Player < ActiveRecord::Base
	attr_accessible :name, :gamesplayed, :number, :position, :season_ids

	has_many :games
	has_many :seasons, through: :games
	accepts_nested_attributes_for :seasons

	validates(:name, presence: true)
	validates(:position, presence: true)
	validates(:number, presence: true)
	validates(:gamesplayed, presence: true)
end
