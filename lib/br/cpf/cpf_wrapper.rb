require 'ffi'
module BR
  module CPFWrapper
    extend FFI::Library
    path = File.join(File.dirname(__FILE__), "..", "..")
    lib = File.join(path, 'CPF.so')
    lib = File.join(path, 'CPF.bundle') unless File.exists?(lib)
    ffi_lib lib
    attach_function :calc_check_digit, [:long_long], :long_long
    attach_function :is_valid, [:long_long], :bool
  end
end
