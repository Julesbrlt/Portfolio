class AddDemoToProject < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :demo_url, :string
  end
end
