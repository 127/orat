# describe 'test browser', :type => :feature, :js => true do
#   it "makes nothing" do
#     lang = 'en'
#     url = 'https://www.ya.ru'
#     visit url
#     # page.execute_script("$('#langMenuContainer').trigger('mouseover')")
#     page.find('#langMenuContainer').hover
#     page.find("#langmenu li.#{lang} a").click
#     expect(current_path).to eq("/#{lang}")
#
#     click_on 'Sign up'
#     expect(current_path).to eq("/#{lang}/auth_register")
#
#     # sleep 20
#   end
# end