class CreateUrlTags < ActiveRecord::Migration[7.0]
  def change
    create_table :url_tags do |t|
      t.string :title, null: false
      t.timestamps
    end

    add_reference :url_tags, :urls, foreign_key: true, null: false
  end
end
