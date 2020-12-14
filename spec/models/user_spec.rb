require 'rails_helper'
describe User do
  before do
    @user = Factory.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまく行く時' do
      it "nickname,first_name,last_name,fname,lname,email,encryped_password,birthdayが存在すれば登録できる"
        expect(@user).to be_valid
      end
      it "encryped_passwordが６文字以上であれば登録できる"
        @user.encrypted_password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "パスワードは半角英数混合での入力が必須"
        @user.encryped_password = "a00000"
        expect(@user).to be_valid
      end
    end
  end

    context '新規登録がうまくいかない時'
      it "nicknameが空だと登録できない"
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない"
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to  include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない"
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは＠を含む必要がある"
        @user.email = "testsample.com"
        @user.valid?
        expect(@user.errors.full_messaeges).to include("@ isn't exist")
      end
      it "encrypted_passwordが空だと登録できない"
        @user.encryped_password = ""
        @user.valid?
        expect(@user.errors.full_messaeges).to include("Encrypted_password can;t be blank")
      end
      it "password_confirmationが空だと登録できない"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password_confirmation can't be blank")
      end
      it "パスワードと確認用のパスワードの一致が必須であること"
      end
      it "first_nameが空だと登録できない"
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to  include("First_name can't be blank")
      end
      it "last_nameが空だと登録できない"
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to  include("Last_name can't be blank")
      end
      it "fnameが空だと登録できない"
        @user.fname = ""
        @user.valid?
        expect(@user.errors.full_messages).to  include("Fname can't be blank")
      end
      it "lnameが空だと登録できない"
        @user.lname = ""
        @user.valid?
        expect(@user.errors.full_messages).to  include("Lname can't be blank")
      end
      it "birthdayが空だと登録できない"
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to  include("Birthday can't be blank")
      end

end


RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    # トップページに遷移する
    visit root_path

    # ログインしていない場合、ヘッダーに新規登録/ログインボタンが表示されること
    expect(current_path).to have_content ("新規登録","ログイン")
  end
  it 'ログイン状態では、ヘッダーにユーザーのニックネーム/ログアウトボタンが表示されること'
    sign_in(@user)
    expect(current_path).to have_content("@user.nickname","ログアウト")
  end
  it 'ヘッダーの新規登録をクリックすることで遷移できること'
    click_on("新規登録")
    expect(current_path).to eq new_user_registration_path
  end
  it 'ヘッダーのログインボタンをクリックすることで遷移できる'
    click_on("ログイン")
    expect(current_path).to eq new_user_session_path
  end
  it 'ヘッダーのログアウトボタンをクリックすることで、ログアウトができること'
    click_on("ログアウト")
    expect(current_path).to eq root_path
end
