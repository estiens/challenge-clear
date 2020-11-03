class AddDefaultToLibrariesTimestamps < ActiveRecord::Migration[6.0]
  def change
    change_column :libraries, :created_at, :datetime, default: -> { "CURRENT_TIMESTAMP" }
    change_column :libraries, :updated_at, :datetime, default: -> { "CURRENT_TIMESTAMP" }
  end
end
