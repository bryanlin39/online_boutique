class EditProductsRating < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :rating, :float
    change_column_default :products, :rating, 0
  end
end
