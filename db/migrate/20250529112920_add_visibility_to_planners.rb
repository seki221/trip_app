class AddVisibilityToPlanners < ActiveRecord::Migration[7.2]
  def change
    add_column :planners, :visibility, :string, default: 'private'
  end
end
