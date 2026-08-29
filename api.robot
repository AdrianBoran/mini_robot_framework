*** Settings ***
Documentation       Teste de API cu RequestsLibrary

Library             RequestsLibrary
Library             Collections


*** Variables ***
${API_URL}      https://jsonplaceholder.typicode.com


*** Test Cases ***
Preluarea Unei Postari Returneaza Structura Corecta
    [Documentation]    Verifica endpointul de citire si campurile obligatorii
    [Tags]    api
    ${resp}=    GET    ${API_URL}/posts/1    expected_status=200
    ${body}=    Set Variable    ${resp.json()}
    Dictionary Should Contain Key    ${body}    title
    Dictionary Should Contain Key    ${body}    userId
    Should Be Equal As Numbers    ${body}[id]    1

Crearea Unei Postari Returneaza 201
    [Documentation]    Verifica endpointul de creare
    [Tags]    api
    ${payload}=    Create Dictionary    title=test    body=continut    userId=${1}
    ${resp}=    POST    ${API_URL}/posts    json=${payload}    expected_status=201
# id-ul intors e un numar intreg, nu text:
# Should Not Be Empty ar esua, pentru ca un numar nu are lungime
    Should Be True    ${resp.json()}[id] > 0

Resursa Inexistenta Returneaza 404
    [Documentation]    Cazul negativ: ce se intampla la o resursa care nu exista
    [Tags]    api    negative
    GET    ${API_URL}/posts/999999    expected_status=404

Lista De Postari Contine Elemente
    [Documentation]    Verifica faptul ca endpointul de listare intoarce date
    [Tags]    api
    ${resp}=    GET    ${API_URL}/posts    expected_status=200
    ${lista}=    Set Variable    ${resp.json()}
    ${numar}=    Get Length    ${lista}
    Should Be True    ${numar} > 0
# Verificam si structura primului element din lista
    Dictionary Should Contain Key    ${lista}[0]    title
