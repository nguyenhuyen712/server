class CreateAccidents < ActiveRecord::Migration[5.0]
  def change
    create_table :accidents do |t|
      t.float :latitude
      t.float :longitude
      t.boolean :status, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
