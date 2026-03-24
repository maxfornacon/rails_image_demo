class CreateImages < ActiveRecord::Migration[8.1]
  def change
    create_table :images do |t|
      t.string :filename
      t.binary :data

      t.timestamps
    end
  end
end
