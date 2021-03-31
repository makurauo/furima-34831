require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.3
  end
  describe '購入記録機能' do
    context '購入記録を保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '購入記録が保存できない' do
      it 'postcodeが空だと保存できないこと' do
        @purchase_address.postcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeにハイフンがないと保存できないこと' do
        @purchase_address.postcode.delete!('-')
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postcode is invalid')
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postcode = '壱弐参-四五六七'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postcode is invalid')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @purchase_address.block = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以上だと保存できないこと' do
        @purchase_address.phone_number = '123451234512'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが10桁以下だと保存できないこと' do
        @purchase_address.phone_number = '123451234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numbeが半角のハイフンを含まない正しい形式でないと保存できないこと' do
        @purchase_address.phone_number = '壱弐参四五六七八九十'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
