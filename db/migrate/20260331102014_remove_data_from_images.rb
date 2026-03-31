class RemoveDataFromImages < ActiveRecord::Migration[8.1]
  def change
    remove_column :images, :data, :binary
  end
end
