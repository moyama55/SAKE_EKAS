class AlchoolsController < ApplicationController
  before_action :authenticate_user!

  def show
    @alchool = Alchool.find(params[:id])
    @alchool_new = Alchool.new
    @alcool_comment = AlcoolComment.new
    @alcool_comments = AlcoolComment.all
  end

  def index
    @alchools = Alchool.all
    @alchool_new = Alchool.new
    @all_ranks = Alchool.find(Favorite.group(:alchool_id).order('count(alchool_id) desc').limit(3).pluck(:alchool_id))
  end

  def create
    @alchool = Alchool.new(alchool_params)
    @alchool.user_id = current_user.id
    if @alchool.save
      redirect_to alchools_path(@alchool), notice: "You have created book successfully."
    else
      @alchools = Alchool.all
      render 'index'
    end
  end

  def edit
    @alchool = Alchool.find(params[:id])
  end

  def update
    @alchool = Alchool.find(params[:id])
    if @alchool.update(alchool_params)
      redirect_to alchool_path(@alchool), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @alchool = Alchool.find(params[:id])
    @alchool.destroy
    redirect_to alchools_path, notice: "successfully delete book!"
  end

  def rank
    @all_ranks = Alchool.find(Favorite.group(:alchool_id).order('count(alchool_id) desc').limit(3).pluck(:alchool_id))
  end

  private

  def alchool_params
    params.require(:alchool).permit(:title, :body, genre_ids: [])
  end
end
