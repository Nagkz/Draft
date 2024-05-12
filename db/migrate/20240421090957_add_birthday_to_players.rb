class AddBirthdayToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :fyear, :integer
    add_column :players, :cyear, :integer
    add_column :players, :month, :integer
    add_column :players, :date, :integer
  end
end
