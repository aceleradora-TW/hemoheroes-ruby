class NotificationMailer < ApplicationMailer


  default from: 'aceleradora10@gmail.com'

  def send_email_new_user user
    @user = user
    @url  = 'https://snap-ci.com/aceleradora-TW/HemoHeroes/branch/master'
    mail(to: @user.email,
    subject: 'Bem vindo ao HemoHeroes',
    template_path: 'notification_mailer',
    template_name: 'new_user_donator_email.html.erb')
  end

  def send_email(user, bank)
    @user = user
    @bank = bank
    @url  = 'https://snap-ci.com/aceleradora-TW/HemoHeroes/branch/master'
    mail(to: @user.email,
    subject: 'Teste implementação',
    template_path: 'layouts',
    template_name: 'mailer.html.erb')
  end

  def send_notification_to_admin bank
    @bank = bank
    @url = 'http://hemoheroestw-staging.herokuapp.com/admin'
    mail(to: 'aceleradora10@gmail.com',
    subject: 'Validar cadastro de novo banco de sangue',
    template_path: 'notification_mailer',
    template_name: 'new_blood_bank_email')
  end

  def send_email_no_blood_type_donator user
    @user = user
    @url = 'http://hemoheroestw-staging.herokuapp.com/admin'
    mail(to: @user.email,
    subject: 'Convite para doação',
    template_path: 'notification_mailer',
    template_name: 'mailer_no_blood_type')
  end

  def send_activation_email bank
    @bank = bank
    @url = 'http://hemoheroestw-staging.herokuapp.com/admin'
    mail(to: @bank.email,
    subject: 'Conta HemoHeroes ativada!',
    template_path: 'notification_mailer',
    template_name: 'blood_bank_activation_email')
  end

end
