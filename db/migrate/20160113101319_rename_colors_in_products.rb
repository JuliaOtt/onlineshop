class RenameColorsInProducts < ActiveRecord::Migration
  def change
  	rename_column :products, :color, :colour # first parameter is the table, the second is the old field name, and the third is the new field name
  end
end
