class CreateProductHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :product_histories do |t|
      t.references :user,    foreign_key: true 
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end