*** Settings ***
Documentation        Ações e elementos da página de boas vindas

Library        Browser

*** Keywords ***
Verify welcome message
    Wait For Elements State
    ...    text=Falta pouco para fazer parte da família Smartbit!
    ...    visible    5  

