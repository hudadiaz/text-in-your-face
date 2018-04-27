class CreateStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :styles do |t|
      t.references :saying, foreign_key: true
      t.string :theme
      t.string :font
      t.string :css

      t.timestamps
    end
  end
end
