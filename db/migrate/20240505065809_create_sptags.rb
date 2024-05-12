class CreateSptags < ActiveRecord::Migration[6.1]
  def change
    create_table :sptags do |t|
      t.string :sub_p_position

      t.timestamps
    end
  end
end
