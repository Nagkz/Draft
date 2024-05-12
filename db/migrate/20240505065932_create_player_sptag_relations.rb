class CreatePlayerSptagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :player_sptag_relations do |t|
      t.references :player, null: false, foreign_key: true
      t.references :sptag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
