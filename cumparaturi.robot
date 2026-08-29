*** Settings ***
Documentation  Fluxul de adăugare în coș
Resource  ../resources/pages/login_page.resource
Resource  ../resources/pages/produse_page.resource
Resource  ../resources/common.resource
Test Setup  Deschide Aplicatia 
Test Teardown  Inchide Aplicatia
Test Tags  cumparaturi

*** Test Cases ***
Produsul Adaugat Apare In Cos  
  [Tags]  smoke
  Autentifica Utilizatorul   ${USER}  ${PASSWORD} 
  Lista De Produse Este Afisata 
  Adauga Rucsacul In Cos 
  Cosul Contine  1