require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、dateが存在すれば登録できる' do
    end
    it 'nicknameが空では登録できない' do
    end
    it 'emailが空では登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
    end
    it 'nicknameが41文字以上では登録できない' do
    end
    it '重複したemailが存在する場合は登録できない' do
    end
    it 'emailは@を含まないと登録できない' do
    end
    it 'passwordが5文字以下では登録できない' do
    end
    it 'passwordが129文字以上では登録できない' do
    end
    it 'passwordが半角英数字混合でなければ登録できない' do
    end
    it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
    end
    it 'last_name_kanaが全角（カタカナ）でなければ登録できない' do
    end
    it 'first_name_kanaが全角（カタカナ）でなければ登録できない' do
    end
    it 'dateが空では登録できない' do
    end
  end
end
