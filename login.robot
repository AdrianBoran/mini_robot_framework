*** Settings ***
Documentation       Primul meu test in Robot Framework

Library             SeleniumLibrary


*** Variables ***
${URL}          https://www.saucedemo.com
${BROWSER}      chrome
${USER}         standard_user
${PASSWORD}     secret_sauce


*** Test Cases ***
Autentificare Cu Credentiale Valide
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=user-name    ${USER}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    # Wait Until Element Is Visible    class=inventory_list    timeout=10s
    Page Should Contain Element    class=inventory_list
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot

 ... AND    Close Browser

# sau:
    # Wait Until Element Is Visible    class=inventory_list    timeout=10s
    # Page Should Contain Element    class=inventory_list
    # [Teardown]    Close Browser
