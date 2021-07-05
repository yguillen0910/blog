class ChangeColorToBeStringInCategories < ActiveRecord::Migration[6.1]
  def change
    change_column :categories, :color, :string
  end
end
