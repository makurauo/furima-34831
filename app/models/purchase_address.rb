class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase    

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :user
    validates :item
    validates :postcode, format: {with: ^\d{3}-\d{4}$ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block 
    validates :phone_number, format: {with: ^0\d{9,10}$ }
    validates :purchase 
  end

end