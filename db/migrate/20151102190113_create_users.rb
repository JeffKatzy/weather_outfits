class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :location
      t.integer :gender

      t.timestamps null: false
    end
  end
end
