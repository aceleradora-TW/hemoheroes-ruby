require "rails_helper"

describe "Kátia poderá fazer login como banco de sangue", type: :feature, js: true do

  before(:all) do
    UserBloodBank.create(cnpj: '12345678912369', name: 'Carlos', email: 'huehue@gmail.com', password: '123456', password_confirmation: '123456', address: 'Vila Mata Gato', actived: true, has_active_key: false)
  end

  context "Quando logar com dados corretos" do
    it "deve ser direcionado para página de necessidade de hospital" do
      visit "/"
      find("#login_hemocentro_button").trigger('click')
      sleep 2
      page.fill_in 'user_blood_donator_document', with: '12345678912369'
      page.fill_in 'user_blood_donator_password', with: '123456'
      click_button 'Login'

      expect(page).to have_content 'Informe a quantidade necessária de doadores de sangue para cada tipo sanguíneo'
    end
  end

  context "Quando logar com dados incorretos" do
    it "deve aparecer mensagem de login invalido" do
      visit "/"
      find("#login_hemocentro_button").trigger('click')
      sleep 1
      page.fill_in 'user_blood_donator_document', with: '1233467891'
      page.fill_in 'user_blood_donator_password', with: '123456'
      click_button 'Login'

      sleep 1
      expect(page).to have_content 'Login inválido'
    end
  end

  context "Quando logar com senha incorreta" do
    it "deve aparecer mensagem de login invalido" do
      visit "/"
      find("#login_hemocentro_button").trigger('click')
      sleep 1
      page.fill_in 'user_blood_donator_document', with: '12345678912369'
      page.fill_in 'user_blood_donator_password', with: '123123'
      click_button 'Login'

      sleep 1
      expect(page).to have_content 'Senha inválida'
    end
  end

end
