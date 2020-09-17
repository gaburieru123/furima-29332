require 'rails_helper'

# RSpec.
describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが半角英数字の6文字以上であれば登録できる" do
        @user.password = "11111a"
        @user.password_confirmation = "11111a"
        expect(@user).to be_valid
      end
      it "first_nameとlast_nameが全角であると登録できる" do
        @user.first_name  = "山田"
        @user.last_name = "太郎"
        expect(@user).to be_valid
      end
      it "first_name_kanaとlast_name_kanaが全角カタカナであると登録できる" do
        @user.first_name_kana = "ハヤシ"
        @user.last_name_kana = "ハナコ"
        expect(@user).to be_valid
      end
    end

      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空だと登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailの@が無いと登録できない" do
          @user.email = 'aaabbb.com'
          @user.valid?
          
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空だと登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが5文字以下だと登録できない" do
          @user.password = '1111a'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordが数字のみでは登録できない" do
          @user.password = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが半角英字のみでは登録できない" do
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが存在してもpassword_confirmationが空だと登録できない" do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "birthdayが空だと登録できない" do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
  end
  describe 'ユーザーログイン' do
    context 'ログインがうまくいくとき' do
      it "emailとpasswordが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailが正いとき" do
        @user.email = "b@ne.jp"
        expect(@user).to be_valid
      end
      it "passwordが正いとき" do
        @user.password = "1aaaaa"
        @user.password_confirmation = "1aaaaa"
        expect(@user).to be_valid
      end
      
    end


    context "ログインがうまくいくとき" do
      it "emailが空だとログインできない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが間違っているときログインできない" do
        @user.email = "bne.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だとログインできない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下のときログインできない" do
        @user.password = "1aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英字のみのときログインできない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字のみのときログインできない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
end

