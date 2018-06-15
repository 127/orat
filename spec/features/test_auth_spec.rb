feature 'auth test', :js => true do
  before(:all) do
    @valid_login    = 'VALIDTESTLOGIN'
    @valid_password = 'VALIDTESTPASSWORD'
    
    @url = 'https://ya.ru'
    @lang = 'en'
    @login_path = "/"
  end
  
  before do 
    visit @url
  end
      
  scenario "with valid details" do
    login @valid_login, @valid_password
    expect(page).to have_content('Websites')
  end
    
  context "with invalid details" do
    
    scenario "with blank fields" do
      login '', ''
      expect(page).to have_content('login failed')
    end
    
    scenario "100 trials to login" do
      (1..10).each do |i|
        login 'admin', with: Faker::Crypto.md5
        expect(page).to have_content('login failed')
      end
      
    end
  #
  #   scenario "with invalid login" do
  #     fill_in 'Login', with: Faker::Internet.email
  #     fill_in 'Password', with: Faker::Crypto.md5
  #     page.find('#loginForm input[type="submit"]').click
  #     expect(page).to have_content('Incorrect login or password')
  #   end
      
  end
  
  private 
    def login login, pass
      fill_in 'Login',    with: login
      fill_in 'Password', with: pass
      click_button 'Login'
    end
end