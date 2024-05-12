class CreatePlayerOtagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :player_otag_relations do |t|
      t.references :player, null: false, foreign_key: true
      t.references :otag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
