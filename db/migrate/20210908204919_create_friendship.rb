class CreateFriendship < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :source, null: false, foreign_key: {to_table: :people}
      t.references :desitination, null: false, foreign_key: {to_table: :people}

      t.timestamps
    end
  end
end
