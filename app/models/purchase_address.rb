class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase_id    

  #extend ActiveHash::Associations::ActiveRecordExtensions
  #belongs_to :prefecture

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block 
    validates :phone_number, format: {with: /\A\d{10,11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number:phone_number, purchase_id: purchase.id)
  end

end