*** Settings ***
Documentation        Arquivo principal do projeto Robot

Variables      Env.py

Library        JSONLibrary

Library        Browser
Library        ../../libs/Account.py
Library        ../../libs/Database.py

Resource       pages/Landing.resource
Resource       pages/Welcome.resource
Resource       pages/Login.resource
Resource       pages/Accounts.resource
Resource       pages/Memberships.resource

Resource       pages/components/Navbar.resource
Resource       pages/components/Toast.resource
Resource       pages/components/BoxNotice.resource
Resource       pages/components/Modal.resource

*** Variables ***
${ADMIN_EMAIL}        sac@smartbit.com
${ADMIN_PASS}         pwd123

*** Keywords ***
Start session
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Page       ${BASE_URL}

# Helpers
Get Json fixture
    [Arguments]        ${file_name}    ${scenario}

    ${data}    Load Json From File
    ...        ${EXECDIR}/resources/fixtures/${file_name}.json
    ...        encoding=utf-8
    
    [Return]    ${data}[${scenario}]

SignIn admin
    Go to login page
    Submit login form    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    User is logged in    ${ADMIN_EMAIL}