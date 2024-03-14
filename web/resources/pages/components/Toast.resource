*** Settings ***
Documentation            Ações e elementos do Componente Toast

Library        Browser

*** Keywords ***
Toast should be
    [Arguments]        ${expected_text}

    ${selector}        Set Variable        .Toastify__toast-body

    Wait For Elements State    css=${selector}
    ...        visible    5
    
    Get Text    css=${selector}
    ...    equal
    ...    ${expected_text}
    
    Take Screenshot    selector=${selector}
