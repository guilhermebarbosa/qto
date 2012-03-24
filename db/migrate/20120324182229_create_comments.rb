class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :work
      t.text :description
      t.boolean :document
      t.has_attached_file :patent
      t.has_attached_file :enrollment
      t.has_attached_file :cei
      t.has_attached_file :gifp
      t.has_attached_file :invoice
      t.has_attached_file :inss
      t.has_attached_file :cnd
      t.has_attached_file :dwell
      t.has_attached_file :social_contract

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :work_id
  end
end