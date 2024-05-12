class CreateWptags < ActiveRecord::Migration[6.1]
  def change
    create_table :wptags do |t|
      t.string :whole_p_position

      t.timestamps
    end
  end
end
