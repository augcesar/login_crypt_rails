require "login_crypt/version"

module LoginCrypt

    @@POSICOES_LOGIN_CRYPT = 12

    def login_crypt_mudar_quantidade_posicoes quant
      if quant.to_i > 5
        @@POSICOES_LOGIN_CRYPT = quant.to_i
      else
        raise Exception.new "quantidade de posicoes deve ser maior que 5"
      end
    end

    def login_crypt_sessao_seq inputs_crypt = nil
      if respond_to? :session
        session[:login_crypt_input] = inputs_crypt.join(",") unless inputs_crypt.nil?
        session[:login_crypt_seq]   = login_crypt_gerar_sequencia if session[:login_crypt_seq].blank? 
      else
        raise Exception.new "sessao nao habilitada. possivelmente voce esta no console"
      end

      session[:login_crypt_seq]
    end

    def login_crypt_sessao_inputs
      session[:login_crypt_input]
    end

    def login_crypt_gerar_sequencia
      seq = (0..(@@POSICOES_LOGIN_CRYPT-1)).to_a
      seq = seq.sample seq.count
    end

    def login_crypt_checar_sessao_seq 
      
      lista_chaves_params = session[:login_crypt_input].split ","

      if lista_chaves_params.class == Array

        lista_chaves_params.each do |chave|

            seq_session = session[:login_crypt_seq]
            seq_array   = []
            i           = 0

            params[chave.to_s].split("").map do |c|
              seq_array[ (seq_session[i].nil? ? i : seq_session[i]) ] = c
              i += 1
            end

            params[chave.to_s] = seq_array.delete_if { |c| c == " " }.join unless seq_array.blank?
        end
      
        session[:login_crypt_seq] = nil
      end  

    end


end
