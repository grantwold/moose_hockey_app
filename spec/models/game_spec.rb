# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  player_id    :integer
#  season_id    :integer
#  statistic_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  location     :string(255)
#  opponent     :string(255)
#  time         :datetime
#  official     :boolean
#

require 'spec_helper'

describe Game do
  
end
