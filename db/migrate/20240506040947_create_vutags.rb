class CreateVutags < ActiveRecord::Migration[6.1]
  def change
    create_table :vutags do |t|
      t.string :variety

      t.timestamps
    end
  end
end
