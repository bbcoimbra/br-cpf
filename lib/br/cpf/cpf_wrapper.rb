require 'ffi'
module BR
  module CPFWrapper
    extend FFI::Library
    ffi_lib File.join(File.dirname(__FILE__), "..", "..", "CPF.so")
    attach_function :calc_check_digit, [:long_long], :long_long
    attach_function :is_valid, [:long_long], :bool
  end
end
