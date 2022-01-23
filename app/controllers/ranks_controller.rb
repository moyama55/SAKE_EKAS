class RanksController < ApplicationController
  def rank
  　@all_ranks = Alchool.find(Favorite.group(:alchool_id).order('count(alchool_id) desc').limit(3).pluck(:alchool_id))
    @alchools = Alchool.all
  end
end
