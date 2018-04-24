class CreatePhrases < ActiveRecord::Migration[5.2]
  def change
    create_table :phrases do |t|
      t.string :hashid, null: false, unique: true
      t.string :content, null: false
      t.string :digest, null: false

      t.timestamps
    end

    add_index :phrases, :hashid, unique: true
  end
end
