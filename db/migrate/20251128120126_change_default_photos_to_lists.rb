class ChangeDefaultPhotosToLists < ActiveRecord::Migration[7.1]
  def change
    change_column :lists, :photos, :string, :default => "generic.png"
  end
end
