class RemoveUserIdIdFromTweets < ActiveRecord::Migration[5.2]
  def change


    remove_reference :tweets, :user_id
  end
end
