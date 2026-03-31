class RemoveFilenameFromImages < ActiveRecord::Migration[8.1]
  def change
    remove_column :images, :filename, :string
  end
end
