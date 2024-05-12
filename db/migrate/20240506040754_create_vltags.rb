class CreateVltags < ActiveRecord::Migration[6.1]
  def change
    create_table :vltags do |t|
      t.string :variety

      t.timestamps
    end
  end
end
