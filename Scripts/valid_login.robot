*** Settings ***
Documentation       A Test suite with a single test for valid login.
...
...                 This test has a workflow that is created using keywords in
...                 the imported resource file.
Resource            resource.robot

*** Test Cases ***
Valid Login
    Open Browser And Navigate To Login Page
    Input Username To Field      ${USER}
    Input Password To Field      ${PASSWORD}
    Submit Cred
    Welcome Page Is Opened