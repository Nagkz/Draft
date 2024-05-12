class CreatePlayerVutagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :player_vutag_relations do |t|
      t.references :player, null: false, foreign_key: true
      t.references :vutag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
