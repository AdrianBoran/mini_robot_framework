*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BASE_URL}     https://www.saucedemo.com
${BROWSER}      chrome
${TIMEOUT}      10s
${USER}         standard_user
${PASSWORD}     secret_sauce


*** Keywords ***
Deschide Aplicatia
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Selenium Timeout    ${TIMEOUT}    # Setează timpul implicit de așteptare pentru toate keyword-urile

Inchide Aplicatia
    Run Keyword If Test Failed    Capture Page Screenshot
    Close Browser
