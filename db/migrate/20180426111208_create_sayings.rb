class CreateSayings < ActiveRecord::Migration[5.2]
  def change
    create_table :sayings do |t|
      t.string :hashid, unique: true, null: false
      t.references :thing, foreign_key: true

      t.timestamps
    end

    add_index :sayings, :hashid, unique: true
  end
end
