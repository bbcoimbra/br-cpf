#ifndef _CPF_H
#define	_CPF_H

#ifdef	__cplusplus
extern "C" {
#endif

long long calc_check_digit(long long raiz);
int is_valid(long long cpf);

#ifdef	__cplusplus
}
#endif

#endif	/* _CPF_H */
