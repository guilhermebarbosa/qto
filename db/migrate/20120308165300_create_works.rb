class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.string :address
      t.string :number
      t.string :cep
      t.references :state
      t.references :city
      t.string :district
      t.string :adjunct
      t.string :contact_name
      t.string :contact_email
      t.string :contact_telephone
      t.date :date_initial
      t.string :cost_center
      t.string :territorial
      t.references :company
      t.string :footage
      t.string :responsible
      t.string :observation
      t.string :entry
      t.string :status
      t.references :user
      t.boolean :demolition_check
      t.string :demolition_type
      t.string :demolition_km
      t.boolean :floor_check
      t.integer :floor_qtd
      t.integer :floor_units
      t.integer :floor_bathroom
      t.boolean :home_check
      t.integer :home_club
      t.integer :home_ordinance
      t.integer :home_support_ordinance

      t.timestamps
    end
    add_index :works, :state_id
    add_index :works, :city_id
    add_index :works, :company_id
    add_index :works, :user_id
  end
end
