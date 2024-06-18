*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             The system specific keywords created here form our own
...             domain specific language. They utilize keywords provided
...             by the imported selemniumLibrary.
Library         SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${DELAY}        0
${USER}   student
${PASSWORD}   Password123
${LOGINURL}    https://practicetestautomation.com/practice-test-login/
${WELCOMEURL}  https://practicetestautomation.com/logged-in-successfully/

*** Keywords ***
Open Browser And Navigate To Login Page
    Open Browser    ${LOGINURL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Is Opened

Login Page Is Opened
    Title Should Be    Test Login | Practice Test Automation

Go To Login Page
    Go To    ${LOGINURL}
    Login Page Is Opened

Input Username To Field
    [Arguments]     ${username}
    Input Text    username      ${username}

Input Password To Field
    [Arguments]     ${password}
    Input Text    password      ${password}

Submit Cred
    Click Button    Submit

Welcome Page Is Opened
    Location Should Be    ${WELCOME_URL}
    Title Should Be    Logged In Successfully | Practice Test Automation