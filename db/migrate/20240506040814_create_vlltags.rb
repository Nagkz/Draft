class CreateVlltags < ActiveRecord::Migration[6.1]
  def change
    create_table :vlltags do |t|
      t.string :variety

      t.timestamps
    end
  end
end
