*** Settings ***
Documentation    Teste pentru fluxul de autentificare.

# A doua linie a documentației, continuată cu trei puncte.

Metadata   Versiune 2.1
Library    SeleniumLibrary
  #Resource    ../resources/pages/login_page.resource
Suite Setup    Verifica Ca Aplicatia Raspunde
Suite Teardown  Close All Browsers
Test Setup  Deschide Aplicatia
Test Teardown   Inchide Aplicatia
Test Tags   login
Test Timeout    2 minutes

*** Variables ***
${USER}    customer@example.com
${PAROLA}    welcome01
@{ROLURI}  admin client vizitator
&{UTILIZATOR}    nume=Ana  rol=admin

*** Test Cases ***
Autentificare Cu Credentiale Valide
    [Documentation]     Un client existent ajunge pe pagina de produse
    [Tags]      smoke REQ-101 
Autentifica Utilizatorul ${USER} ${PAROLA}
  Lista De Produse Este Afisata 

Autentificare Cu Parola Gresita
    [Documentation]  Parola greșită produce eroare, nu autentificare 
    [Tags]  negative 
    [Setup]  Deschide Pagina De Login  #suprascrie TestSetup pentru acest test
 Autentifica Utilizatorul ${USER} gresit123 
  Mesajul De Eroare Este Afisat
  [Teardown]  Inchide Aplicatia     
    
*** Keywords ***
Verifica Ca Aplicatia Raspunde
  [Documentation]    Health-check înainte de a rula orice test 
  ${resp}=  GET  ${API_URL}/status 
  Should Be Equal As Integers  ${resp.status_code}   200

Autentifica Utilizatorul
    [Documentation]   Completează formularul de login și trimite
    [Arguments]  ${email}  ${parola}=${PAROLA} 
    Input Text   ${email} 
    Input Password  ${INPUT_PAROLA}  ${parola} 
    Click Element    ${BTN_LOGIN} 