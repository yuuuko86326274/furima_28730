class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items, dependent: :destroy
  has_many :purchase_items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, length: { minimum: 6 }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
    validates :first_name_pkey, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナで入力して下さい。' }
    validates :last_name_pkey, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナで入力して下さい。' }
    validates :birthday
  end
end
