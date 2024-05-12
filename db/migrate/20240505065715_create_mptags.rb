class CreateMptags < ActiveRecord::Migration[6.1]
  def change
    create_table :mptags do |t|
      t.string :main_p_position

      t.timestamps
    end
  end
end
