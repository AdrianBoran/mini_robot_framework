*** Settings ***
Documentation       Aceeasi verificare, cu date diferite

Library             SeleniumLibrary

Test Setup          Deschide Pagina De Login
Test Teardown       Inchide Browserul
Test Template       Autentificarea Esueaza Cu

Test Tags           negative


*** Variables ***
${URL}                  https://www.saucedemo.com
${BROWSER}              chrome
${PASSWORD}             secret_sauce
${INPUT_USER}           id=user-name
${INPUT_PASSWORD}       id=password
${BTN_LOGIN}            id=login-button
${MESAJ_EROARE}         css=h3[data-test="error"]


*** Test Cases ***    UTILIZATOR    PAROLA    MESAJ_ASTEPTAT
Utilizator Blocat    locked_out_user    ${PASSWORD}    locked out
Parola Gresita    standard_user    gresit123    do not match
Utilizator Inexistent    nu_exista    ${PASSWORD}    do not match
Campuri Goale    ${EMPTY}    ${EMPTY}    Username is required


*** Keywords ***
Deschide Pagina De Login
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    ${INPUT_USER}    timeout=10s

Inchide Browserul
    Run Keyword If Test Failed    Capture Page Screenshot
    Close Browser

Autentificarea Esueaza Cu
    [Documentation]    Incearca autentificarea si verifica mesajul de eroare
    [Arguments]    ${user}    ${parola}    ${mesaj}
    IF    '${user}' != '${EMPTY}'    Input Text    ${INPUT_USER}    ${user}
    IF    '${parola}' != '${EMPTY}'
        Input Password    ${INPUT_PASSWORD}    ${parola}
    END
    Click Button    ${BTN_LOGIN}
    Wait Until Element Is Visible    ${MESAJ_EROARE}
    ${text}=    Get Text    ${MESAJ_EROARE}
    Should Contain    ${text}    ${mesaj}
