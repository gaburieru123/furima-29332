require 'rails_helper'

describe CreditAddress, type: :model do
  
    before do
      @credit_address = FactoryBot.build(:credit_address)
    end
    

    describe '購入情報登録' do
      context '購入がうまくいく時' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@credit_address).to be_valid
        end
         it 'building_nameは空でも保存できる' do
          @credit_address.building_name = ''
          @credit_address.valid?
          expect(@credit_address).to be_valid
        end
      end

      context '購入がうまくいかない時' do
        # it 'tokenが空だと保存できない'do
        #   token = nil
        #   expect(token.errors.full_messages).to include("Token is nil")
        # end
        it 'post_codeが空だと保存できない' do
          @credit_address.post_code = ''
          @credit_address.valid?
          expect(@credit_address.errors.full_messages).to include("Post code can't be blank")
        end
        it 'post_codeにハイフンがないと保存できない' do
          @credit_address.post_code = '1234567'
          @credit_address.valid?
          expect(@credit_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it 'delivery_area_idが1だと保存できない' do
          @credit_address.delivery_area_id = '1'
          @credit_address.valid?
          expect(@credit_address.errors.full_messages).to include("Delivery area must be other than 1")
        end
        it 'cityが空だと保存できない' do
          @credit_address.city = ''
          @credit_address.valid?
          expect(@credit_address.errors.full_messages).to include("City can't be blank")
        end
        it 'house_numberが空だと保存できない' do
          @credit_address.house_number = ''
          @credit_address.valid?
          expect(@credit_address.errors.full_messages).to include("House number can't be blank")
        end
       
        it 'phone_numberが空だと保存できない' do
          @credit_address.phone_number = ''
          @credit_address.valid?
          expect(@credit_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberにハイフンがあると保存できない' do
          @credit_address.phone_number = '090-1234-5678'
          @credit_address.valid?
          expect(@credit_address.errors.full_messages).to include("Phone number is invalid")
        end
        it 'phone_numberが12桁以上あると保存できない' do
          @credit_address.phone_number = '090123456789'
          @credit_address.valid?
          expect(@credit_address.errors.full_messages).to include("Phone number is invalid")
        end
        
      end


    


    

  
  end

end
