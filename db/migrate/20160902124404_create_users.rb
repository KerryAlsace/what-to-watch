class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :username
      t.string :password_digest
      
      t.timestamps
    end
  end
end
