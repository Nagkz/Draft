class AddCopyToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :copy, :string
    add_column :players, :future, :string
  end
end
