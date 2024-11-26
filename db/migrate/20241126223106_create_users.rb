class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :bio
      t.integer :status
      t.integer :role
      t.string :city
      t.string :country
      t.text :skills
      t.text :user_attributes
      t.text :interests
      t.text :languages
      t.string :website
      t.text :social_links
      t.string :company
      t.string :job_title

      t.timestamps
    end
  end
end
