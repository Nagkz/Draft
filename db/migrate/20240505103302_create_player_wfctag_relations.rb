class CreatePlayerWfctagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :player_wfctag_relations do |t|
      t.references :player, null: false, foreign_key: true
      t.references :wfctag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
