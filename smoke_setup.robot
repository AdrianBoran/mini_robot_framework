*** Settings *** 
Documentation    Verifică faptul că mediul e configurat corect 
Library          SeleniumLibrary 
Library          RequestsLibrary 
Metadata         TICKET-1342     

*** Variables ***
${URL}        https://practicesoftwaretesting.com
${BROWSER}    chrome
${OPTIUNI}    add_argument("--headless=new"); add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")

*** Test Cases *** 
Browserul Porneste Si Aplicatia Raspunde
  [documentation]  AL DOILEA
  [Tags]  smoke REQ-101
  Open Browser    ${URL}    ${BROWSER}    options=${OPTIUNI}
  Wait Until Page Contains    title    timeout=60s
  Close Browser


API-ul Raspunde 
    ${resp}=    GET    https://api.practicesoftwaretesting.com/products
    Should Be Equal As Integers    ${resp.status_code}    200