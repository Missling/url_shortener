class CreateUrlmappers < ActiveRecord::Migration
  def change
    create_table :urlmappers do |t|
      t.string :original_url
      t.string :url_key
      t.integer :count, default: 0

      t.timestamps null: false
    end
  end
end
