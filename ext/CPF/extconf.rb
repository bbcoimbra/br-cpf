require 'mkmf'

dir_config("CPF")

have_header("stdlib.h")

create_makefile("CPF")
