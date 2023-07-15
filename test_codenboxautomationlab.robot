*** Settings ***
Library  SeleniumLibrary
Suite Setup    Set Selenium Speed    0.5s
Suite Teardown    Close All Browsers
Test Setup    Open Website
Test Teardown    Close Browser

*** Variables ***
${url}    https://codenboxautomationlab.com/practice/
${browser}    chrome

${locator_radiobutton1}    xpath=//*[@id="radio-btn-example"]/fieldset/label[1]/input
${locator_radiobutton2}    xpath=//*[@id="radio-btn-example"]/fieldset/label[2]/input
${locator_radiobutton3}    xpath=//*[@id="radio-btn-example"]/fieldset/label[3]/input

${locator_DynamicDropdown}         id=autocomplete
${locator_DynamicDropdown-list}    xpath=//*[@id="ui-id-1"]/li

${locator_StaticDropdown}         id=dropdown-class-example
${locator_StaticDropdown-list}    xpath=//*[@id="dropdown-class-example"]/option[4]

${locator_checkbox1}    name=checkBoxOption1
${locator_checkbox3}    name=checkBoxOption3

${locator_mousehover}    id=mousehover

*** Keywords ***
Open Website
    Set Selenium Speed    0.5s
    Open Browser                ${url}    ${browser}
    Wait Until Page Contains    Automation Practice    5s
    Maximize Browser Window

Select Radio Button
    Wait Until Page Contains    Radio Button Example    5s
    Click Element               ${locator_radiobutton2}

Input Text Dynamic Dropdown
    Input Text                       ${locator_DynamicDropdown}            Thai
    Wait Until Element Is Visible    ${locator_DynamicDropdown-list}
    Click Element                    ${locator_DynamicDropdown-list}

Select Satatic Dropdown
    Click Element                     ${locator_StaticDropdown}  
    Wait Until Element Is Visible     ${locator_StaticDropdown-list}    
    Click Element                     ${locator_StaticDropdown-list}  

CheckBox
    Select Checkbox    ${locator_checkbox1}
    Select Checkbox    ${locator_checkbox3}

Mouse Hover
    Wait Until Page Contains    Mouse Hover Example    5s
    Mouse Over                  ${locator_mousehover}    

*** Test Cases ***
TC-001
    [Setup]
    [Documentation]    Test
    [Tags]    Test
    Open Website
    Select Radio Button
    Input Text Dynamic Dropdown
    Select Satatic Dropdown
    CheckBox
    Mouse Hover
    [Teardown]
