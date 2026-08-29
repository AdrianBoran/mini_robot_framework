*** Settings ***
Resource    ../common.resource


*** Variables ***
${INPUT_USER}           id=user-name
${INPUT_PASSWORD}       id=password
${BTN_LOGIN}            id=login-button
${MESAJ_EROARE}         css=h3[data-test="error"]


*** Keywords ***
Pagina De Login Este Afisata
    Wait Until Element Is Visible    ${INPUT_USER}
    Wait Until Element Is Enabled    ${BTN_LOGIN}

Autentifica Utilizatorul
    [Arguments]    ${user}    ${password}
    Pagina De Login Este Afisata
    Input Text    ${INPUT_USER}    ${user}
    Input Password    ${INPUT_PASSWORD}    ${password}
    Click Button    ${BTN_LOGIN}

Mesajul De Eroare Contine
    [Arguments]    ${text_asteptat}
    Wait Until Element Is Visible    ${MESAJ_EROARE}
    ${text}=    Get Text    ${MESAJ_EROARE}
    Should Contain    ${text}    ${text_asteptat}
