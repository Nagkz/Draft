class CreateWfotags < ActiveRecord::Migration[6.1]
  def change
    create_table :wfotags do |t|
      t.string :whole_fo_position

      t.timestamps
    end
  end
end
