class AddCountToUrl < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :visit_count, :integer, default: 0
  end
end
