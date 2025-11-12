class AddNameToTrainers < ActiveRecord::Migration[7.2]
  def change
    add_column :trainers, :name, :string
  end
end
