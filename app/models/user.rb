class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do       
    validates :nickname
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: {with: PASSWORD_REGEX, message: "は無効です"}
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は無効です。全角文字で入力してください"} do
      validates :first_name
      validates :family_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message:"は無効です。カタカナで入力してください"} do
      validates :first_name_kana
      validates :family_name_kana
    end
    validates :birth_day
  end
       
  has_many :items
  has_many :purcahses     
end
