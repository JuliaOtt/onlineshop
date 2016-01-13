class AddColorToProducts < ActiveRecord::Migration
  def change
    add_column :products, :color, :string #The first parameter is the name of the table, the second is the field, and the third is the data type
  end
end
