class AddCategoryToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :category, :string
  end
end
