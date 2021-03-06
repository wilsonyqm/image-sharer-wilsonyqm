class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_column :users, :password_digest, :string
  end
end
