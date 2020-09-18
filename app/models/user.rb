class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items  

  
  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d{6,}]+\z/i.freeze}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } 
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナを使用してください' } 
    validates :last_name_kana, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナを使用してください' } 
    validates :birthday

  end
end
