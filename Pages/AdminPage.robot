*** Settings ***
Library           Browser

*** Variables ***
# Admin Module Locators
${MENU_ADMIN}               xpath=//span[text()='Admin']
${BTN_ADD_USER}             xpath=//button[normalize-space()='Add']
${INPUT_USER_ROLE}          xpath=//label[text()='User Role']/parent::div/following-sibling::div//div[@class='oxd-select-text-input']
${INPUT_EMPLOYEE_NAME}      xpath=//label[text()='Employee Name']/parent::div/following-sibling::div//input
${INPUT_STATUS}             xpath=//label[text()='Status']/parent::div/following-sibling::div//div[@class='oxd-select-text-input']
${INPUT_USERNAME}           xpath=//label[text()='Username']/parent::div/following-sibling::div/input
${INPUT_PASSWORD}           xpath=//label[text()='Password']/parent::div/following-sibling::div/input
${INPUT_CONFIRM_PASSWORD}   xpath=//label[text()='Confirm Password']/parent::div/following-sibling::div/input
${BTN_SAVE_USER}            xpath=//button[@type='submit']
${INPUT_USERNAMESEARCH}     xpath=//h5[normalize-space()='System Users']/following::label[normalize-space()='Username']/following::input[1] 
${BTN_SEARCH}               css=  button[type='submit']
${SEARCH_RESULT}            xpath=//div[@class='oxd-table-card'][1]

*** Keywords ***
Navigate To Admin Module
    Click    ${MENU_ADMIN}
    Wait For Elements State    ${BTN_ADD_USER}    visible    timeout=10s

Click Add User
    Click    ${BTN_ADD_USER}
    Wait For Elements State    ${INPUT_USER_ROLE}    visible    timeout=10s

Create New System User
    [Arguments]    ${employee_name}    ${username}    ${password}
    
    # Fill Employee Name
    Fill Text    ${INPUT_EMPLOYEE_NAME}    ${employee_name}
    Sleep    2s
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    
    # Select Status (Enabled)
    Click    ${INPUT_STATUS}
    Sleep    1s
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    
    # Fill Username and Password
    Fill Text    ${INPUT_USERNAME}    ${username}
    Fill Text    ${INPUT_PASSWORD}    ${password}
    Fill Text    ${INPUT_CONFIRM_PASSWORD}    ${password}

    # Select User Role (Admin)
    Click    ${INPUT_USER_ROLE}
    Sleep    1s
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    Click    ${BTN_SAVE_USER}
    
 Verify User In Search Results
    [Arguments]       ${username} 
    Fill Text    ${INPUT_USERNAMESEARCH}    ${username} 
    Take Screenshot
    Click    ${BTN_SEARCH}
    ${result_text}=    Get Text    ${SEARCH_RESULT}
    Should Contain  ${result_text}    ${username}
   