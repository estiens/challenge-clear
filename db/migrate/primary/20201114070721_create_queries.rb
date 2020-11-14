class CreateQueries < ActiveRecord::Migration[6.0]
  def change
    create_table :queries do |t|
      t.string :input
      t.string :ip_address
      t.integer :language
      t.timestamps
    end
    add_index :queries, :input
    add_index :queries, :ip_address
    add_index :queries, :language
  end
end
