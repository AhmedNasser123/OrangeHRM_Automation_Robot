*** Settings ***
Library    Browser
Resource   ../resources/variables.robot

*** Variables ***
# Login Page Locators
${LOGIN_USERNAME}       xpath=//input[@name='username']
${LOGIN_PASSWORD}       xpath=//input[@name='password']
${LOGIN_BUTTON}         xpath=//button[@type='submit']
${DASHBOARD_HEADER}     xpath=//h6[text()='Dashboard']
${USER_DROPDOWN}        xpath=//span[@class='oxd-userdropdown-tab']
${LOGOUT_LINK}          xpath=//a[text()='Logout']


*** Keywords ***
Open Orange HRM Application
    New Browser    ${browser}     ${headless}
    Set Browser Timeout    ${TIMEOUT} 
    New Page    ${BASE_URL}        

Login To Application
    [Arguments]    ${username}    ${password}
    Fill Text    ${LOGIN_USERNAME}    ${username}
   Fill Text    ${LOGIN_PASSWORD}    ${password}
    Click     ${LOGIN_BUTTON}
    Wait For Elements State    ${DASHBOARD_HEADER}    visible

Verify Login Success
    Get Text    ${DASHBOARD_HEADER}    ==    Dashboard

Logout From Application
    Click    ${USER_DROPDOWN}
    Wait For Elements State    ${LOGOUT_LINK}    visible    
    Click    ${LOGOUT_LINK}
    Wait For Elements State    ${LOGIN_USERNAME}    visible    

Close Orange HRM Application
    Close Browser

