class CreatePlayerVtagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :player_vtag_relations do |t|
      t.references :player, null: false, foreign_key: true
      t.references :vtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
