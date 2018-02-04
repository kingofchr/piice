class ThanksController < ApplicationController
  before_action :authenticate_user

  def create
    @thank= Thank.new(user_id: @current_user.id, tweet_id: params[:tweet_id])
    @thank.save
   redirect_to("/tweet/#{params[:tweet_id]}")
  end

  def destroy
    @thank= Thank.find_by(user_id: @current_user.id, tweet_id: params[:tweet_id])
    @thank.destroy
    redirect_to("/tweet/#{params[:tweet_id]}")
  end

end
