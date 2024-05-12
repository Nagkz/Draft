class AddPurposesToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :purpose, :string
  end
end
