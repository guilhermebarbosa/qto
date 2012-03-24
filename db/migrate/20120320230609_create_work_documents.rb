class CreateWorkDocuments < ActiveRecord::Migration
  
  def change
    
    create_table :work_documents do |t|
      t.references :work
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
    
    add_index :work_documents, :work_id
  
  end
end
