*** Settings ***
Library    Browser
Library     String

*** Variables ***
# PIM  Locators
${MENU_PIM}                 xpath=//span[text()='PIM']
${BTN_ADD_EMPLOYEE}         xpath=//a[text()='Add Employee']
${INPUT_FIRST_NAME}         xpath=//input[@name='firstName']
${INPUT_MIDDLE_NAME}        xpath=//input[@name='middleName']
${INPUT_LAST_NAME}          xpath=//input[@name='lastName']
${INPUT_EMPLOYEE_ID}        xpath=(//input[@class='oxd-input oxd-input--active'])[2]
${BTN_SAVE}                 xpath=//button[@type='submit']
${BTN_CustomSubmit}         css=div[class='orangehrm-custom-fields'] button[type='submit']
${MENU_EMPLOYEE_LIST}       xpath=//a[text()='Employee List']
${INPUT_EMPLOYEE_NAME}      xpath=(//input[@placeholder='Type for hints...'])[1]
${BTN_SEARCH}               xpath=//button[@type='submit']
${SEARCH_RESULT}            xpath=//div[@class='oxd-table-card'][1]

*** Keywords ***
Navigate To PIM Module
    Click    ${MENU_PIM}
    Wait For Elements State    ${BTN_ADD_EMPLOYEE}    visible    

Click Add Employee
    Click    ${BTN_ADD_EMPLOYEE}
    Wait For Elements State    ${INPUT_FIRST_NAME}    visible    

Create New Employee
    [Arguments]    ${first_name}    ${middle_name}    ${last_name}
    Fill Text    ${INPUT_FIRST_NAME}    ${first_name}
    Fill Text    ${INPUT_MIDDLE_NAME}    ${middle_name}
    Fill Text    ${INPUT_LAST_NAME}    ${last_name}

    Click    ${BTN_SAVE}
    Scroll To    ${BTN_CustomSubmit}
    Click    ${BTN_CustomSubmit}

    RETURN    ${first_name} ${middle_name} ${last_name}

Navigate To Employee List    
    Click    ${MENU_EMPLOYEE_LIST}
    Wait For Elements State    ${INPUT_EMPLOYEE_NAME}    visible    

Search For Employee
    [Arguments]    ${first_name}
    Fill Text    ${INPUT_EMPLOYEE_NAME}    ${first_name}
   
    # Press Arrow Down and Enter to select from dropdown
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    Sleep    1s
    
    Click    ${BTN_SEARCH}
    Wait For Elements State    ${SEARCH_RESULT}    visible    

Verify Employee In Search Results
    [Arguments]    ${first_name}    ${last_name}
    ${result_text}=    Get Text    ${SEARCH_RESULT}
    Should Contain    ${result_text}    ${first_name}
    Should Contain    ${result_text}    ${last_name}