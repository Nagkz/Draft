class CreateSfctags < ActiveRecord::Migration[6.1]
  def change
    create_table :sfctags do |t|
      t.string :sub_fc_position

      t.timestamps
    end
  end
end
