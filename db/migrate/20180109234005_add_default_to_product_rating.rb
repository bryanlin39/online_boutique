class AddDefaultToProductRating < ActiveRecord::Migration[5.1]
  def change
    change_column_default :products, :rating, 0
  end
end
