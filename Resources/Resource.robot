*** Settings ***
Variables   ../Variables/URLs.py
Library     RequestsLibrary
Library     Collections
Library     os
Library     JSONLibrary
Library    XML
Library     Collections

*** Variables ***
${productCategoryName}       RESIDENTIAL_MORTGAGES
${countryCodeName}           AUS
${pageNum}                   2


*** Keywords ***


Create Request with List Users API
        Create Session    mysession    ${base_url}
         ${response}     Get Request   mysession    /api/users?page=${pageNum}


Verify the Response Code
         ${response}     Get Request   mysession    /api/users?page=${pageNum}
        ${status_code}     Convert To String    ${response.status_code}
        Should Be Equal    ${status_code}    200

Verify the Response Data List Users API
         ${response}     Get Request   mysession    /api/users?page=${pageNum}
        ${json_object}     to json    ${response.content}

        FOR    ${i}    IN RANGE    5
            ${id}      get value from json    ${json_object}    data[${i}].id
            Element Should Exist  ${id}

            ${email}       Get Value From Json    ${json_object}    data[${i}].email
            Element Should Exist  ${email}

            ${first_name}       Get Value From Json    ${json_object}    data[${i}].first_name
            Element Should Exist    ${first_name}

            ${last_name}       Get Value From Json    ${json_object}    data[${i}].last_name
            Element Should Exist    ${last_name}
        END






