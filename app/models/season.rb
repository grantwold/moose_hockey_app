# == Schema Information
#
# Table name: seasons
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  season_start   :date
#  season_end     :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  current_season :boolean          default(FALSE)
#

class Season < ActiveRecord::Base
  attr_accessible :season_end, :season_start, :name, :player_ids, :current_season
  after_save :falsify_all_others

  has_many :memberships
  has_many :players, through: :memberships
  has_many :games, inverse_of: :season, dependent: :destroy
  accepts_nested_attributes_for :players

  validates(:name, presence: true)

  	private

		def falsify_all_others
  			self.class.where('id != ?', self.id).update_all(current_season: :false)
		end
end
