module SeasonsHelper

	def falsify_all_others
  		self.class.where('id != ? and current_season', self.id).update_all("current_season = 'false'")
	end
end
