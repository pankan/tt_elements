class AddTweetMessageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tweet_message, :string
  end
end
