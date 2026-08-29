*** Settings ***
Resource  ../common.resource


*** Variables ***
${LISTA_PRODUSE}  class=inventory_list
${BTN_ADAUGA_RUCSAC}  id=add-to-cart-sauce-labs-backpack 
${BADGE_COS}  class=shopping_cart_badge

*** Keywords ***
Lista De Produse Este Afisata 
  Wait Until Element Is Visible   ${LISTA_PRODUSE}

Adauga Rucsacul In Cos 
  Wait Until Element Is Visible   ${BTN_ADAUGA_RUCSAC} 
  Click Button  ${BTN_ADAUGA_RUCSAC}


Cosul Contine 
  [Arguments]  ${numar} 
  Wait Until Element Is Visible  ${BADGE_COS} 
  ${text}=  Get Text  ${BADGE_COS} 
  Should Be Equal As Numbers  ${text}  ${numar}