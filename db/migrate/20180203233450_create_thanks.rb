class CreateThanks < ActiveRecord::Migration[5.1]
  def change
    create_table :thanks do |t|
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end
