# == Schema Information
#
# Table name: seasons
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  season_start :date
#  season_end   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Season < ActiveRecord::Base
  attr_accessible :season_end, :season_start, :name, :player_ids, :game_ids

  has_many :memberships
  has_many :players, through: :memberships
  has_and_belongs_to_many :games
  accepts_nested_attributes_for :players
  accepts_nested_attributes_for :games

  validates(:name, presence: true)
end
