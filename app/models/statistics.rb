# == Schema Information
#
# Table name: statistics
#
#  id               :integer          not null, primary key
#  goals            :integer
#  assists          :integer
#  shorthandedgoals :integer
#  powerplaygoals   :integer
#  penalties        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Statistics < ActiveRecord::Base
  attr_accessible :goals, :assists, :shorthandedgoals, :powerplaygoals, :penalties

  belongs_to :games

  validates(:goals, presence: true)
  validates(:assists, presence: true)
  validates(:shorthandedgoals, presence: true)
  validates(:powerplaygoals, presence: true)
  validates(:penalties, presence: true)
end
