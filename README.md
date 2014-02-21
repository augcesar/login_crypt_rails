# LoginCrypt

Conexões HTTP são inseguras e podem ser capturadas em redes abertas.
Com o LoginCrypt, a senha do seu formulário html é EMBARALHADA.

## Installation

Add this line to your application's Gemfile:

    gem 'login_crypt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install login_crypt

## Usage

###ApplicationController
```
  include LoginCrypt
  helper_method :login_crypt_sessao_seq, :login_crypt_sessao_inputs
```

###LoginController

```
  before_filter :only => :index do
    login_crypt_sessao_seq ["senha"]
  end
```
```
  before_filter :only => :checa_usuario do
    login_crypt_checar_sessao_seq
  end
```

###LoginView
  
  `<%= render "login_crypt/form", seletor_form: "#form-login" %>`
  
  ou
  
  `<%= render "login_crypt/form_compress", seletor_form: "#form-login" %>`


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
