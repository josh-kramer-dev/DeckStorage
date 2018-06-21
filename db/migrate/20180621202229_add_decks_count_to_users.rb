class AddDecksCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :decks_count, :integer
  end
end
