#include <stdlib.h>
#include "cpf.h"

long long calc_check_digit(long long raiz){
    int produto=0, i, digito;
    long long aux=raiz, cpf;
    lldiv_t divisao;

    cpf=(long long)raiz*100;
    for(i=0; i<=8; i++){
        divisao = lldiv(aux, 10);
        produto += divisao.rem * (i+2);
        aux = divisao.quot;
    }
    digito = produto % 11 < 2 ? 0 : 11 - (produto % 11);
    cpf += (digito*10);
    produto = 0;
    aux = (long long)cpf / 10;
    for(i=0; i<=9; i++){
        divisao = lldiv(aux, 10);
        produto += divisao.rem * (i+2);
        aux = divisao.quot;
    }
    digito = produto % 11 < 2 ? 0 : 11 - (produto % 11);
    cpf += digito;
    return cpf;
}


int is_valid(long long cpf){
    return cpf==calc_check_digit((long long)cpf / 100);
}


