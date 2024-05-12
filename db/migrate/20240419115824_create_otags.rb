class CreateOtags < ActiveRecord::Migration[6.1]
  def change
    create_table :otags do |t|
      t.string :original

      t.timestamps
    end
  end
end
