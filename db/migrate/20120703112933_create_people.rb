class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :surname
      t.string :idnumber
      t.string :email

      t.timestamps
    end
  end
end
