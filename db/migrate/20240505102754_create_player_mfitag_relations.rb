class CreatePlayerMfitagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :player_mfitag_relations do |t|
      t.references :player, null: false, foreign_key: true
      t.references :mfitag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
