class CreateWfctags < ActiveRecord::Migration[6.1]
  def change
    create_table :wfctags do |t|
      t.string :whole_fc_position

      t.timestamps
    end
  end
end
