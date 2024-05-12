class CreateMfotags < ActiveRecord::Migration[6.1]
  def change
    create_table :mfotags do |t|
      t.string :main_fo_position

      t.timestamps
    end
  end
end
