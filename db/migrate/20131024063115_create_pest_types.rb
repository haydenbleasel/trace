class CreatePestTypes < ActiveRecord::Migration
  def change
    create_table :pest_types do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
end
