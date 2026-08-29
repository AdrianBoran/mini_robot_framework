*** Settings ***
Documentation  Teste de autentificare
Library  SeleniumLibrary
Test Setup  Deschide Pagina De Login
Test Teardown  Inchide Browserul
  
*** Variables ***
${URL}  https://www.saucedemo.com
${BROWSER}  chrome
${USER}  standard_user
${PASSWORD}  secret_sauce
#Locatoarele stau ca variabile, nu împrăștiate prin teste
${INPUT_USER}  id=user-name
${INPUT_PASSWORD}  id=password
${BTN_LOGIN}  id=login-button
${LISTA_PRODUSE}  class= inventory_list
${MESAJ_EROARE}  css=h3[data-test="error"]

*** Test Cases ***
Autentificare Cu Credentiale Valide 
  [Tags]  smoke
  Autentifica  ${USER}  ${PASSWORD}
  Wait Until Element Is Visible    ${LISTA_PRODUSE}

Autentificare Cu Parola Gresita 
  [Tags]  negative
  Autentifica  ${USER}  parola_gresita 
  Wait Until Element Is Visible  ${MESAJ_EROARE} 
  ${text}=  Get Text   ${MESAJ_EROARE} 
  Should Contain  ${text}  do not match

Autentificare Cu Utilizator Blocat
  [Tags]  negative  blocat
  Autentifica   locked_out_user  ${PASSWORD}
  Wait Until Element Is Visible  ${MESAJ_EROARE} 
  ${text}=  Get Text  ${MESAJ_EROARE}
  Should Contain  ${text}   locked out

*** Keywords ***
Deschide Pagina De Login
  Open Browser  ${URL}  ${BROWSER}
  Wait Until Element Is Visible   ${INPUT_USER}  timeout=10s
  
Autentifica
  [Arguments]  ${user}   ${password}
  Input Text  ${INPUT_USER}  ${user} 
  Input Password  ${INPUT_PASSWORD}  ${password} 
  Click Button  ${BTN_LOGIN}

Inchide Browserul
  Run Keyword If Test Failed  Capture Page Screenshot
  Close Browser