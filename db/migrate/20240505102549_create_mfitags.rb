class CreateMfitags < ActiveRecord::Migration[6.1]
  def change
    create_table :mfitags do |t|
      t.string :main_fi_position

      t.timestamps
    end
  end
end
