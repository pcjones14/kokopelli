class AddPromoToArticles < ActiveRecord::Migration
  def change
    add_attachment :articles, :promo
  end
end
