*** Settings ***
Documentation       Test Case For Invalid login


Resource    resource.robot
Suite Setup         Open Browser And Navigate To Login Page
Suite Teardown      Close Browser
Test Setup          Go To Login Page
Test Template       Login with invalid cred fail

*** Test Cases ***                  USERNAME        PASSWORD
Invalid Username                    invalid         ${PASSWORD}


*** Keywords ***
Login with invalid cred fail
    [Arguments]     ${USER}     ${PASSWORD}
    Input Username To Field    ${USER}
    Input Password To Field    ${PASSWORD}
    Submit Cred
    Login Failed
    
Login Failed
    Element Text Should Be    error    Your username is invalid!
