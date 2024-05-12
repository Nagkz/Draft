class AddSummaryToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :summarytext, :string
  end
end
