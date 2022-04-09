class CreateUrlTraces < ActiveRecord::Migration[7.0]
  def change
    create_table :url_traces do |t|
      t.float :latitude
      t.float :longitude
      t.timestamps
    end

    add_reference :url_traces, :url, foreign_key: true, null: false
  end
end
