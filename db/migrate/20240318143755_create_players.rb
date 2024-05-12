class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :furigana
      t.string :belong
      t.string :throws
      t.string :bats
      t.integer :height
      t.integer :weight
      t.date :birthday
      t.string :prefecture
      t.text :career
      t.text :explanation
      t.text :injury
      t.integer :max
      t.integer :powerful
      t.integer :control
      t.integer :stamina
      t.integer :breaking
      t.integer :meet
      t.integer :power
      t.integer :running
      t.integer :defence

      t.timestamps
    end
  end
end
