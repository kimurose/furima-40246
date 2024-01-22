require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、dateが存在すれば登録できる' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'TestUser', email: '', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: '', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'mismatched_password', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("password_confirmation doesn't match Password")
    end
    it 'nicknameが41文字以上では登録できない' do
      user = User.new(nickname: 'a * 41', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
    end
    it '重複したemailが存在する場合は登録できない' do
      existing_user = create(:user, email: 'duplicate@example.com')
      user = User.new(nickname: 'TestUser', email: 'duplicate@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは@を含まないと登録できない' do
      user = User.new(nickname: 'TestUser', email: 'invalid_email', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが5文字以下では登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: '1234', password_confirmation: '1234', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが129文字以上では登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'a * 129', password_confirmation: 'a * 129', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it 'passwordが半角英数字混合でなければ登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'パスワード', password_confirmation: 'パスワード', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: 'Yamada', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: 'Taro', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid")
    end
    it 'last_name_kanaが全角（カタカナ）でなければ登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ﾔﾏﾀﾞ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid")
    end
    it 'first_name_kanaが全角（カタカナ）でなければ登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'ﾀﾛｳ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'dateが空では登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: nil )
      user.valid?
      expect(user.errors.full_messages).to include("Date can't be blank")
    end
  end
end
