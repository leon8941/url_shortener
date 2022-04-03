class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :target_url, null: false
      t.string :short_url, null: false, limit: 15, index: { unique: true, name: 'unique_short_url' }
      t.timestamps
    end

    add_reference :urls, :users, foreign_key: true, null: false
  end
end
