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

require 'spec_helper'

describe Membership do
  
  before { @membership = Membership.new }

  subject { @membership }

  it { should respond_to(:player_id) }
  it { should respond_to(:season_id) }
  it { should respond_to(:game_id) }
  it { should belong_to(:player) }
  it { should belong_to(:season) }
  it { should belong_to(:game) }
end
