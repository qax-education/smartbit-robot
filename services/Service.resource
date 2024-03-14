*** Settings ***
Documentation            Camada de integração com a API

Library        RequestsLibrary

*** Keywords ***
Set user token

    ${payload}      Create Dictionary
    ...            email=sac@smartbit.com
    ...            password=pwd123

    ${resp}        POST
    ...     url=http://localhost:3333/sessions
    ...     json=${payload}
    
    ${token}    Set Variable        Bearer ${resp.json()}[token]

    Set Suite Variable    ${token}

Get account by name
    [Arguments]        ${name}

    ${headers}        Create Dictionary
    ...            Authorization=${token}

    ${params}        Create Dictionary
    ...        name=${name}

    ${resp}    GET
    ...        url=http://localhost:3333/accounts
    ...        params=${params} 
    ...        headers=${headers}
    
    [return]        ${resp.json()}[data][0]
    