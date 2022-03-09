*** Settings ***
Resource   ../Resources/Resource.robot

*** Test Cases ***
Verify the List of Users
        [Tags]      API
        Create Request with List Users API
        Verify the Response Code
        Verify the Response Data List Users API


Verify the List of Users 2
        [Tags]      API
        given create request with list users api
        when verify the response code
        then verify the response data list users api








