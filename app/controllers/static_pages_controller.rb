class StaticPagesController < ApplicationController
  def home
  end

  def calendar
  end

  def roster
    @players = Player.all
  end

  def player_pages
  end

  def team_history
  end

  def game_archive
  end
end
