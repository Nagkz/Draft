class CreatePlayerMptagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :player_mptag_relations do |t|
      t.references :player, null: false, foreign_key: true
      t.references :mptag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
