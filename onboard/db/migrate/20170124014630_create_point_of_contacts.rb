class CreatePointOfContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :point_of_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :department

      t.timestamps
    end
  end
end
