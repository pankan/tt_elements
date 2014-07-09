class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :oauth_token
      t.string :activity_list
      t.string :temp

      t.timestamps
    end
  end
end
