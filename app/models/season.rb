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
  attr_accessible :season_end, :season_start, :name, :player_ids

  has_many :games
  has_many :players, through: :games
  accepts_nested_attributes_for :players

  validates(:name, presence: true)
end
