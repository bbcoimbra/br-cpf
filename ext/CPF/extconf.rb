require 'mkmf'

dir_config("CPF")

have_header("stdlib.h")
have_func('lldiv')
have_type('lldiv_t','stdlib.h')

with_cflags('-std=c99') do
  create_makefile("CPF")
end
