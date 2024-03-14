*** Settings ***
Documentation        Cenários de testes de pré-cadastro de clientes

Resource        ../resources/Base.resource

Test Setup        Start session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}     Create Dictionary
    ...        name=Papito Fernando
    ...        email=papito@msn.com
    ...        cpf=06097411871
    
    Delete Account By Email    ${account}[email]

    Submit signup form     ${account}
    Verify welcome message


Tentativa de pré-cadastro
    [Template]       Attempt signup
    ${EMPTY}           papito@gmail.com     39831866029    Por favor informe o seu nome completo
    Fernando Papito    ${EMPTY}             39831866029    Por favor, informe o seu melhor e-mail
    Fernando Papito    papito@gmail.com     ${EMPTY}       Por favor, informe o seu CPF
    João da Silva      joao&gmail.com       39831866029    Oops! O email informado é inválido
    João da Silva      joao*gmail.com       39831866029    Oops! O email informado é inválido
    João da Silva      www.teste.com.br     39831866029    Oops! O email informado é inválido
    João da Silva      HGHGHJGH             39831866029    Oops! O email informado é inválido
    João da Silva      kjhkjjkh^*&^&*       39831866029    Oops! O email informado é inválido
    João da Silva      123123               39831866029    Oops! O email informado é inválido
    Maria da Silva     maria@yahoo.com      3983186602a    Oops! O CPF informado é inválido
    Maria da Silva     maria@yahoo.com      39831866011    Oops! O CPF informado é inválido
    Maria da Silva     maria@yahoo.com      7879878978     Oops! O CPF informado é inválido
    Maria da Silva     maria@yahoo.com      1              Oops! O CPF informado é inválido
    Maria da Silva     maria@yahoo.com      hjkhjkhj       Oops! O CPF informado é inválido
    Maria da Silva     maria@yahoo.com      ^*&&*^*&       Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}
    
    ${account}        Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}
    
        Submit signup form    ${account}
        Notice should be      ${output_message}
