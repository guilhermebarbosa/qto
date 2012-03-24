class AddColumnIssueDateToWork < ActiveRecord::Migration
  def change
    add_column :works, :issue_date, :date

  end
end
