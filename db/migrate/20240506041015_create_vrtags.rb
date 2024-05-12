class CreateVrtags < ActiveRecord::Migration[6.1]
  def change
    create_table :vrtags do |t|
      t.string :variety

      t.timestamps
    end
  end
end
