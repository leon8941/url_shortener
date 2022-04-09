class AddGeocodingFieldsToUrlTrace < ActiveRecord::Migration[7.0]
  def change
    add_column :url_traces, :address, :string
    add_column :url_traces, :city, :string
    add_column :url_traces, :state, :string
    add_column :url_traces, :state_code, :string
    add_column :url_traces, :postal_code, :string
    add_column :url_traces, :country, :string
    add_column :url_traces, :country_code, :string
  end
end
