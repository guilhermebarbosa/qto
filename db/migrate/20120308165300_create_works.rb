class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :cei
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
      t.date :issue_date
      t.date :dwell
      t.date :cnd
      t.string :status_dwell
      t.string :status_cnd
      t.boolean :email_dwell_warning, :default => false
      t.boolean :email_cnd_warning, :default => false
      t.boolean :email_dwell, :default => false
      t.boolean :email_cnd, :default => false
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
      t.string :floor_qtd_km
      t.integer :floor_units
      t.string :floor_units_km
      t.integer :floor_bathroom
      t.string :floor_bathroom_km
      t.boolean :home_check
      t.integer :home_club
      t.string :home_club_km
      t.integer :home_ordinance
      t.string :home_ordinance_km
      t.integer :home_support_ordinance
      t.string :home_support_ordinance_km

      t.timestamps
    end
    add_index :works, :state_id
    add_index :works, :city_id
    add_index :works, :company_id
    add_index :works, :user_id
  end
end
