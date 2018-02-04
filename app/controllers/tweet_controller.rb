class TweetController < ApplicationController

before_action :authenticate_user
before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
     @tweets = Tweet.all.order(created_at: :desc)
   end

   def show
     @tweet = Tweet.find_by(id: params[:id])
     @user = @tweet.user
     @thanks_count = Thank.where(tweet_id: @tweet.id).count
   end

   def new
     @tweet = Tweet.new
   end

   def create
     @tweet = Tweet.new(
       content: params[:content],
       user_id: @current_user.id
     )
     if @tweet.save
       flash[:notice] = "投稿を作成しました"
       redirect_to("/tweet/index")
     else
       render("tweet/new")
     end
   end

   def edit
     @tweet = Tweet.find_by(id: params[:id])
   end

   def update
     @tweet = Tweet.find_by(id: params[:id])
     @tweet.content = params[:content]

      if @tweet.save
        flash[:notice] = "投稿を編集しました"
        redirect_to("/tweet/index")
      else
        render ("tweet/edit")
      end
   end

   def destroy
     @tweet = Tweet.find_by(id: params[:id])
     @tweet.destroy
      flash[:notice] = "投稿を削除しました"

     redirect_to("/tweet/index")
   end


 end
