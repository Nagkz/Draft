class AddExplanationToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :explanation2, :string
    add_column :players, :explanation3, :string
    add_column :players, :subtitle1, :string
    add_column :players, :subtitle2, :string
    add_column :players, :subtitle3, :string
    add_column :players, :url, :string
  end
end
