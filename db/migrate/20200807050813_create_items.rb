class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,         foreign_key: true
      t.string :name,             null: false
      t.text :explain,            null: false
      t.integer :category_id,     null: false
      t.timestamps
    end
  end
end
