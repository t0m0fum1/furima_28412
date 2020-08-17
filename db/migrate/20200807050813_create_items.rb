class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.integer :burden,            null: false
      t.integer :fee,            null: false
      t.string :name,            null: false
      t.string :name,            null: false
      t.string :name,            null: false
      t.string :name,            null: false
      t.timestamps
    end
  end
end
