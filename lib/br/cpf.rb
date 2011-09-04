require 'ruby-debug'
require File.join(File.dirname(__FILE__), 'cpf/cpf_wrapper')

module BR
  class CPF

    CPF_MIN = 1
    CPF_MAX = 999999999

    extend CPFWrapper

    attr_reader :cpf, :verif

    def initialize(raiz)
      self.raiz = raiz
    end

    def valid?
      @valid
    end

    def raiz=(raiz)
      @raiz = raiz.to_i
      raise ArgumentError, "raiz should be between #{CPF_MIN} and #{CPF_MAX}" if @raiz < CPF_MIN or @raiz > CPF_MAX
      @cpf = self.class.calc_check_digit(@raiz)
      @verif = @cpf % 100
      @valid = true
    end

    def raiz
      @raiz
    end

    def self.valid?(cpf)
      if cpf.is_a? String
        is_valid(cpf.to_i)
      else
        is_valid(cpf)
      end
    end

    def to_i
      @cpf
    end

    def to_s
      "%011d" % @cpf
    end
  end
end
