class AddNameToSnacks < ActiveRecord::Migration[5.1]
  def change
    add_column :snacks, :name, :string
  end
end
