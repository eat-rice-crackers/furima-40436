require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'postal_codeが存在すれば保存できること' do
        @order_form.postal_code = '123-4567'
        expect(@order_form).to be_valid
      end
      it 'postal_codeは、「3桁ハイフン4桁」の半角文字列であれば保存できること' do
        @order_form.postal_code = '123-4567'
        expect(@order_form).to be_valid
      end
      it 'prefectureが選択されていれば保存できること' do
        @order_form.prefecture_id = 1
        expect(@order_form).to be_valid
      end
      it 'cityが存在すれば保存できること' do
        @order_form.city = '横浜市緑区'
        expect(@order_form).to be_valid
      end
      it 'house_numberが存在すれば保存できること' do
        @order_form.house_number = '青山1-1'
        expect(@order_form).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
      it 'phone_numberが存在すれば保存できること' do
        @order_form.phone_number = '09012345678'
        expect(@order_form).to be_valid
      end
      it 'phone_numberは10桁以上11桁以内の半角数値であれば保存できること' do
        @order_form.phone_number = '09012345678'
        expect(@order_form).to be_valid
      end
      it 'tokenがあれば保存ができること' do
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeが「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空だと保存できないこと' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberが空だと保存できないこと' do
        @order_form.house_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空では保存できないこと' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが10桁以上11桁以内の半角数値でなければ保存できないこと' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Phone number input only number'
      end
      it 'phone_numberが10桁以上11桁以内の半角数値でなければ保存できないこと' do
        @order_form.phone_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Phone number input only number'
      end
      it 'phone_numberが10桁以上11桁以内の半角数値でなければ保存できないこと' do
        @order_form.phone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Phone number input only number'
      end
      it 'tokenが空では登録できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
