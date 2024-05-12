class CreateVlrtags < ActiveRecord::Migration[6.1]
  def change
    create_table :vlrtags do |t|
      t.string :variety

      t.timestamps
    end
  end
end
