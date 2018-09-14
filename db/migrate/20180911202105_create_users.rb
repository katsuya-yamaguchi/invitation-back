class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :sid, unique: true
      t.string :email, unique: true
      t.integer :attend_status, null: false, default: 0
      t.string :user_name
      t.text :user_allergy

      t.timestamps
    end
  end
end
