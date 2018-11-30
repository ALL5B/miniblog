class TweetsController < ApplicationController

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params_tweet)
    if @tweet.save
      flash[:notice] = "投稿されました。"
      redirect_to root_path
    else
      flash[:notice] = "投稿に失敗しました。"
      redirect_to new_tweet_path
    end

  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(params_tweet)
    flash[:notice] = "投稿を編集しました。"
    redirect_to root_path
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:notice] = "投稿を消去しました。"
    redirect_to root_path
  end

  private
  def params_tweet
    params.require(:tweet).permit(:image,:text).merge(user_id: current_user.id)
  end


end
