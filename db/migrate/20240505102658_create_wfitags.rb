class CreateWfitags < ActiveRecord::Migration[6.1]
  def change
    create_table :wfitags do |t|
      t.string :whole_fi_position

      t.timestamps
    end
  end
end
