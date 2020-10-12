class AddIndexToUserStock < ActiveRecord::Migration[6.0]
  def change
    add_index :user_stocks, [:user_id, :ticker], unique: true
  end
end
