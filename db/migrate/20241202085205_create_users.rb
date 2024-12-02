class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, default: ""
      t.string :password_digest, null: false
      t.string :bio
      t.string :city
      t.string :country
      t.integer :role, default: 0  # Default to 'normal' (0)

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end