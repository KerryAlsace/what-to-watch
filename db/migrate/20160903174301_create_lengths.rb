class CreateLengths < ActiveRecord::Migration
  def change
    create_table :lengths do |t|
      t.string :length_description
    end
  end
end
