class CreateSayings < ActiveRecord::Migration[5.2]
  def change
    create_table :sayings do |t|
      t.string :hashid, unique: true, null: false
      t.string :content
      t.string :theme
      t.string :font
      t.string :css

      t.timestamps
    end

    add_index :sayings, :hashid, unique: true
  end
end
