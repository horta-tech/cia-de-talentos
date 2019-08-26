class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :upload
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
