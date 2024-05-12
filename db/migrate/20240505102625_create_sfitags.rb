class CreateSfitags < ActiveRecord::Migration[6.1]
  def change
    create_table :sfitags do |t|
      t.string :sub_fi_position

      t.timestamps
    end
  end
end
