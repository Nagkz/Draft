class CreateVtags < ActiveRecord::Migration[6.1]
  def change
    create_table :vtags do |t|
      t.string :variety

      t.timestamps
    end
  end
end
