class AddVisibilityToSchedules < ActiveRecord::Migration[7.2]
  def change
    add_column :schedules, :visibility, :string, default: 'default'
  end
end
