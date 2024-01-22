require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '全て正常' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'TestUser', email: '', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: '', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'mismatched_password', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
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
    it 'passwordが半角英数字混合でなければ登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'パスワード', password_confirmation: 'パスワード', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが半角英字のみでは登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password', password_confirmation: 'password', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが半角数字のみでは登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: '123456', password_confirmation: '123456', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: 'Yamada', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid")
    end
    it 'last_name（全角）が空だと登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: 'Taro', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid")
    end
    it 'first_name（全角）が空だと登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが全角（カタカナ）でなければ登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ﾔﾏﾀﾞ', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid")
    end
    it 'last_name_kana（全角）が空だと登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: '', first_name_kana: 'タロウ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが全角（カタカナ）でなければ登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'ﾀﾛｳ', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'first_name_kana（全角）が空だと登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: '', date: Date.today)
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'dateが空では登録できない' do
      user = User.new(nickname: 'TestUser', email: 'test@example.com', password: 'password123', password_confirmation: 'password123', last_name: '山田', first_name: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', date: nil )
      user.valid?
      expect(user.errors.full_messages).to include("Date can't be blank")
    end
  end
end
