*** Settings *** 
Documentation    Verifică faptul că mediul e configurat corect 
Library          SeleniumLibrary 
Library          RequestsLibrary 
Metadata         TICKET-1342     

*** Test Cases *** 
Browserul Porneste Si Aplicatia Raspunde
  [documentation]  AL DOILEA
  [Tags]  smoke REQ-101
  Open Browser    https://practicesoftwaretesting.com    chrome
  Wait Until Page Contains    Toolshop    timeout=20s
  Close Browser


API-ul Raspunde 
    ${resp}=    GET    https://api.practicesoftwaretesting.com/products
    Should Be Equal As Integers    ${resp.status_code}    200