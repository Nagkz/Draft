class CreateMfctags < ActiveRecord::Migration[6.1]
  def change
    create_table :mfctags do |t|
      t.string :main_fc_position

      t.timestamps
    end
  end
end
