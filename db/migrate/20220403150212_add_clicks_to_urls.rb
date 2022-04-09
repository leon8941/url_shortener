class AddClicksToUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :urls, :clicks, :integer, default: 0
  end
end
