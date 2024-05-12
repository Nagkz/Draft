class AddUserIdToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :user_id, :integer
  end
end
