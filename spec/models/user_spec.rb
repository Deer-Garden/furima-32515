require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,first_name,last_name,fname,lname,email,password,password_confirmation,birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "encryped_passwordが６文字以上であれば登録できる" do
      @user.password = "000000a"
      @user.password_confirmation = "000000a"
      expect(@user).to be_valid
    end
    it "パスワードは半角英数混合での入力が必須" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages). to include("Password には英字と数字の両方を含めて設定してください")
    end
  
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to  include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは＠を含む必要がある" do
      @user.email = "testsample.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "encrypted_passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it "パスワードと確認用のパスワードの一致が必須であること" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to  include("First name can't be blank")
    end
    it "first_nameに英字が入力されていると登録できない" do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to  include("Last name can't be blank")
    end
    it "last_nameに英字入力されていると登録できない" do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "fnameが空だと登録できない" do
      @user.fname = ""
      @user.valid?
      expect(@user.errors.full_messages).to  include("Fname can't be blank")
    end
    it "fnameに英字が入力されていると登録できない" do
      @user.fname = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Fname is invalid")
    end
    it "lnameが空だと登録できない" do
      @user.lname = ""
      @user.valid?
      expect(@user.errors.full_messages).to  include("Lname can't be blank")
    end
    it "lnameに英字が入力されていると登録できない" do
      @user.lname = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Lname is invalid")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to  include("Birthday can't be blank")
    end
  end
end