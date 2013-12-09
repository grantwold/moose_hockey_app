# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  game_id    :integer
#  season_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ActiveRecord::Base
  
  belongs_to :season
  belongs_to :player
  belongs_to :game
end
