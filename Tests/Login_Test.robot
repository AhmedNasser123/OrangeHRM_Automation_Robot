*** Settings ***
Library    Browser
Resource          ../Resources/Variables.robot
Resource          ../Pages/LoginPage.robot

Suite Setup       Open Orange HRM Application  
Suite Teardown    Close Orange HRM Application


**** Test Cases ***
Verify Successful Login
    [Tags]    smoke
    [Documentation]    Test login functionality with valid credentials
    Login To Application    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    Verify Login Success
    Logout From Application