class CreateSfotags < ActiveRecord::Migration[6.1]
  def change
    create_table :sfotags do |t|
      t.string :sub_fo_position

      t.timestamps
    end
  end
end
