require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
  end

  describe '商品の保存' do
    context '商品が出品できる場合' do
      it '全ての項目が入力できていれば出品できる' do
        expect(@item).to be_valid
      end
      it'価格が¥300~¥9,999,999の間であれば出品できる' do
        @item.price = 5000
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品画像のファイルが選択されていなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end
      it '商品名が40文字以上では出品できない' do
        @item.items_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Items name is too long (maximum is 40 characters)')
      end
      it '商品の説明が空では出品できない' do
        @item.items_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items description can't be blank")
      end
      it '商品の説明が1000文字以上では出品できない' do
        @item.items_description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Items description is too long (maximum is 1000 characters)')
      end
      it 'カテゴリーが無効では出品できない' do
        @item.category_info_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category info must be greater than or equal to 1")
      end
      it '商品の状態が無効では出品できない' do
        @item.items_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Items condition must be greater than or equal to 1")
      end
      it '配送料の負担が無効では出品できない' do
        @item.shipping_fee_burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden must be greater than or equal to 1")
      end
      it '発送元の地域が無効では出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be greater than or equal to 1")
      end
      it '発送までの日数が無効では出品できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be greater than or equal to 1")
      end
      it '販売価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が¥300未満では出品できない' do
        @item.price =299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が¥9,999,999より大きい場合は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '特定のエラーメッセージが1回だけ表示されること' do
        @item.user = nil
        @item.invalid?
        expect(@item.errors.full_messages.count('User must exist')).to eq 1
      end
    end
  end
end
