require File.join(File.dirname(__FILE__), '../CPF')

module BR
  class CPF
    class << self
      alias_method :orig_valid?, :valid?
    end

    def self.valid?(cpf)
      if cpf.is_a? String
        orig_valid?(cpf.to_i)
      else
        orig_valid?(cpf)
      end
    end

    def to_i
      @raiz * 100 + @verif
    end

    def to_s
      "%011d" % @cpf
    end
  end
end
