# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class with default "from" parameter.
  config.mailer_sender = "csdn_csdn_csdn@126.com"

  # Configure the class responsible to send e-mails.
  # config.mailer = "Devise::Mailer"

  # Automatically apply schema changes in tableless databases
  config.apply_schema = false

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  # Configure which keys are used when authenticating a user. The default is
  # just :email. You can configure it to use [:username, :subdomain], so for
  # authenticating a user, both parameters are required. Remember that those
  # parameters are used only when authenticating and not when retrieving from
  # session. If you need permissions, you should implement that in a before filter.
  # You can also supply a hash where the value is a boolean determining whether
  # or not authentication should be aborted when the value is not present.
  # config.authentication_keys = [ :email ]

  # Configure parameters from the request object used for authentication. Each entry
  # given should be a request method and it will automatically be passed to the
  # find_for_authentication method and considered in your model lookup. For instance,
  # if you set :request_keys to [:subdomain], :subdomain will be used on authentication.
  # The same considerations mentioned for authentication_keys also apply to request_keys.
  # config.request_keys = []

  # Configure which authentication keys should be case-insensitive.
  # These keys will be downcased upon creating or modifying a user and when used
  # to authenticate or find a user. Default is :email.
  config.case_insensitive_keys = [ :email ]
  config.authentication_keys = [ :email ]

  config.stretches = 10

  config.pepper = "c7d4ed7d1ea1a7fee16e8a7ef80ca1d391fc3bb8e79a2da9ca23a68dc5c82e6cf3715a6f3d8369335372ab8be36a526bc2e778f17075ed241a1c14c5b93eea60"

  config.remember_for = 2.weeks

  config.password_length = 6..20

  config.email_regexp = /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', :scope => 'user,public_repo'

  # ==> Warden configuration
  # If you want to use other strategies, that are not supported by Devise, or
  # change the failure app, you can configure them inside the config.warden block.
  #
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(:scope => :user).unshift :some_external_strategy
  # end
  config.omniauth "qq", "801131451", "f92a72cd8db68f0689d911c049eb7879"
#  config.omniauth :tsohu, "Wh6FTBDSPum7N9Nrin6B","%ENKAl*jPQzrN0Mg1p7MBQzLUdA!pJb^nj*^VR)%"
#  config.omniauth :t163, "5HpV55umNP9dC3lp","kArPo1wsgA7Ch4PpoBVqU9QJcoy1iUjA"
#  config.omniauth :tqq, "801131451", "f92a72cd8db68f0689d911c049eb7879"
#  config.omniauth :sina, "898403372", "9bb01bfbff92e41e2bcf76e904f601a5"
#  config.omniauth :douban, "0de51c562d83665129af5502888a32f3", "e3120947ae3eab9d"
  #   config.omniauth :renren, "81f0474b0be54c9f8dbbe4d452a45f45","f768d334b7d14c17ad09bc6dbaa6dc6c"
end


