*** Settings ***
Documentation            Ações e elementos do componente de caixa de notificação

Library    Browser

*** Keywords ***
Notice should be
    [Arguments]        ${target}

    ${element}    Set Variable     css=form .notice

    Wait For Elements State
    ...    ${element}
    ...    visible    5
    
    Get Text    ${element}    equal    ${target}