class AlcoolCommentsController < ApplicationController
  def create
    @alchool = Alchool.find(params[:alchool_id])
    comment = AlcoolComment.new(alcool_comment_params)
    comment.user_id = current_user.id
    comment.alchool_id = alcool_comment_params
    if comment.save
     redirect_to alchool_path(@alchool)
    end
  end

  def destroy
    AlcoolComment.find_by(id: params[:id]).destroy
    redirect_to alcool_path(params[:alchool_id])
  end

  private
  def alcool_comment_params
    params.require(:alcool_comment).permit(:comment)
  end
end
