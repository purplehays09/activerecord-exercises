class AddContentToParts < ActiveRecord::Migration[6.1]
  def change
    add_column :parts, :content, :string
  end
end
