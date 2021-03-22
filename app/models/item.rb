class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :delivery

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1_000 }
    validates :user
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id 
    validates :condition_id 
    validates :charge_id 
    validates :prefecture_id  
    validates :delivery_id 
  end
  validates :price, numericality: true
end
