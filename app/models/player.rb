# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :string(255)
#  name       :string(255)
#

class Player < ActiveRecord::Base
	attr_accessible :name, :number, :position, :season_ids, :game_ids

	has_many :memberships
	has_many :seasons, through: :memberships
	has_many :games, through: :memberships

	validates(:name, presence: true)
	validates(:position, presence: true)
	validates(:number, presence: true)
end
