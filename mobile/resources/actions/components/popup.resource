*** Settings ***
Documentation            Ações e elementos do componentes Popup

Library        AppiumLibrary

*** Keywords ***
Popup have text
    [Arguments]        ${target}

    ${element}        Set Variable        xpath=//android.widget.TextView[@resource-id="android:id/message"]

    Wait Until Element Is Visible      ${element}        5
    Element Text Should Be             ${element}        ${target}