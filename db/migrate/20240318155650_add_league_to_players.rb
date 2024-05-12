class AddLeagueToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :league, :string
  end
end
