class CreatePlayerVrtagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :player_vrtag_relations do |t|
      t.references :player, null: false, foreign_key: true
      t.references :vrtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
