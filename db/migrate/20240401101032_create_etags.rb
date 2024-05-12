class CreateEtags < ActiveRecord::Migration[6.1]
  def change
    create_table :etags do |t|
      t.string :expectation

      t.timestamps
    end
  end
end
