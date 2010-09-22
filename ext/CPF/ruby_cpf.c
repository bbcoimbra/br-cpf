#include <stdlib.h>
#include "ruby.h"
#include "cpf.h"

static VALUE t_init_cpf(VALUE self, VALUE ruby_cpf_raiz){
    long long cpf = 0, raiz = 0;
    VALUE ruby_cpf;

    if(TYPE(ruby_cpf_raiz) == T_STRING) {
        raiz = NUM2LL(rb_funcall(ruby_cpf_raiz, rb_intern("to_i"), 0));
    } else {
        raiz = NUM2LL(ruby_cpf_raiz);
    }

    if(raiz < 1 || raiz > 999999999)
        rb_raise(rb_eArgError, "raiz should be greather than 0 and lesser than 999_999_999");
    cpf = calcula_digito_cpf((long long) raiz);
    ruby_cpf = LL2NUM(cpf);
    rb_iv_set(self, "@raiz", INT2FIX(raiz));
    rb_iv_set(self, "@cpf", ruby_cpf);
    rb_iv_set(self, "@valid", e_cpf(cpf) ? Qtrue : Qfalse );
    return self;
}

static VALUE valid_cpf(VALUE self, VALUE ruby_cpf){
    long long cpf = 0;
    cpf = (long long)NUM2LL(ruby_cpf);
    if(cpf == 0) return Qfalse;
    return e_cpf(cpf) ? Qtrue : Qfalse;
}

VALUE mBr, cCpf;
void Init_CPF(){
    mBr = rb_define_module("BR");
    cCpf = rb_define_class_under(mBr, "CPF", rb_cObject);
    rb_define_method(cCpf, "initialize", t_init_cpf, 1);
    rb_define_singleton_method(cCpf, "valid?", valid_cpf, 1);
}
