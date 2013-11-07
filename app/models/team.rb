# == Schema Information
#
# Table name: teams
#
#  id           :integer          not null, primary key
#  season_start :date
#  season_end   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string(255)
#

class Team < ActiveRecord::Base
  attr_accessible :season_end, :season_start, :name

  has_and_belongs_to_many :players

  validates(:season_start, presence: true)
  validates(:season_end, presence: true)
end
