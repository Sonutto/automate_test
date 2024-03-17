*** Settings ***
Library    SeleniumLibrary
Test Setup    open web browser
Test Teardown    Close Browser

*** Variables ***
${url}    https://abhigyank.github.io/To-Do-List/
${browser}    headlesschrome
${Todolist}    xpath=/html/body/div/h1
${locator_textbox}   id=new-task
${locator_additem_tab}    xpath=/html/body/div/div/div[1]/a[1]/span
${locator_additem}   xpath=//*[@id="add-item"]/button
${locator_to-do-task_tab}    xpath=/html/body/div/div/div[1]/a[2]/span
${locator_checkbox}    xpath=//*[@id="incomplete-tasks"]/li/label/span[4]
${locator_delete_todo}    xpath=//*[@id="1"]/span
${locator_completed_tab}    xpath=/html/body/div/div/div[1]/a[3]/span
${locator_delete_completed}    xpath=//*[@id="1"]
${txt1}    เขียนเทสเคส
${txt2}    Start Test

*** Keywords ***
open web browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

input single data on add item
    Input Text    ${locator_textbox}    ${txt1}
    Click Element    ${locator_additem}
    Click Element    ${locator_to-do-task_tab}

input multiple data on add item
    Input Text    ${locator_textbox}    ${txt1}
    Click Element    ${locator_additem}
    Input Text    ${locator_textbox}    ${txt2}
    Click Element    ${locator_additem}
    Click Element    ${locator_to-do-task_tab}

*** Test Cases ***

TC001 Validate information on ADD ITEM default screen
  Wait Until Page Contains Element   ${Todolist}
  Wait Until Page Contains    To Do List
  Wait Until Page Contains Element    ${locator_additem}
  Wait Until Page Contains    Add Item
  Wait Until Page Contains Element    ${locator_to-do-task_tab}
  Wait Until Page Contains    To-Do Tasks
  Wait Until Page Contains Element    ${locator_completed_tab}
  Wait Until Page Contains    Completed      

TC002 Verify "+" icon when user input text
    Wait Until Page Contains    To Do List 
    input single data on add item
    Wait Until Page Contains    ${txt1}    

TC003 Verify "+" icon when user not input text
    Wait Until Page Contains    To Do List
    Click Element    ${locator_additem}
    Click Element    ${locator_to-do-task_tab}
    Wait Until Element Is Not Visible    ${locator_checkbox}    


TC004 Verify "+" icon when user want to ADD multiple item
    Wait Until Page Contains    To Do List 
    input multiple data on add item
    Wait Until Page Contains    ${txt1}
    Wait Until Page Contains    ${txt2}  

TC005 Validate information on TO DO TASK default screen
  Wait Until Page Contains Element    ${locator_additem}
  Click Element    ${locator_to-do-task_tab}
  Wait Until Page Contains Element   ${Todolist}
  Wait Until Page Contains    To Do List
  Wait Until Page Contains Element    ${locator_additem}
  Wait Until Page Contains    Add Item
  Wait Until Page Contains Element    ${locator_to-do-task_tab}
  Wait Until Page Contains    To-Do Tasks
  Wait Until Page Contains Element    ${locator_completed_tab}
  Wait Until Page Contains    Completed  

TC006 Verify Checkbox when user completed to do list
    Wait Until Page Contains    To Do List 
    input single data on add item
    Wait Until Page Contains    ${txt1}
    Click Element    ${locator_checkbox}
    Click Element    ${locator_completed_tab}
    Wait Until Page Contains    ${txt1}

TC007 Verify Delete icon when user want to delete to do list
    Wait Until Page Contains    To Do List 
    input single data on add item
    Wait Until Page Contains    ${txt1}
    Click Element    ${locator_delete_todo}
    Wait Until Page Does Not Contain    ${txt1}    

 TC008 Verify Checkbox when user completed multiple to do list
    Wait Until Page Contains    To Do List 
    input multiple data on add item
    Wait Until Page Contains    ${txt1}
    Wait Until Page Contains    ${txt2}
    Double Click Element    ${locator_checkbox}
    Click Element    ${locator_completed_tab}
    Wait Until Page Contains    ${txt1}
    Wait Until Page Contains    ${txt2}

TC009 Verify Delete icon when user want to delete multiple to do list
    Set Selenium Speed    0.1s
    Wait Until Page Contains    To Do List 
    input multiple data on add item
    Wait Until Page Contains    ${txt1}
    Wait Until Page Contains    ${txt2}
    Double Click Element    ${locator_delete_todo}
    Wait Until Page Does Not Contain    ${txt1}
    Wait Until Page Does Not Contain    ${txt2} 

TC010 Validate information on Completed default screen
  Wait Until Page Contains Element    ${locator_additem}
  Click Element    ${locator_completed_tab}
  Wait Until Page Contains Element   ${Todolist}
  Wait Until Page Contains    To Do List
  Wait Until Page Contains Element    ${locator_additem_tab}
  Wait Until Page Contains    Add Item
  Wait Until Page Contains Element    ${locator_to-do-task_tab}
  Wait Until Page Contains    To-Do Tasks
  Wait Until Page Contains Element    ${locator_completed_tab}
  Wait Until Page Contains    Completed  
    
TC011 Verify Delete icon when user want to delete completed list
    Wait Until Page Contains    To Do List 
    input single data on add item
    Wait Until Page Contains    ${txt1}
    Click Element    ${locator_checkbox}
    Click Element    ${locator_completed_tab}
    Wait Until Page Contains    ${txt1}
    Click Element    ${locator_delete_completed}
    Wait Until Page Does Not Contain    ${txt1}

TC012 Verify Delete icon when user want to delete multiple completed list
    Wait Until Page Contains    To Do List 
    input multiple data on add item
    Wait Until Page Contains    ${txt1}
    Wait Until Page Contains    ${txt2}
    Double Click Element    ${locator_checkbox}
    Click Element    ${locator_completed_tab}
    Wait Until Page Contains    ${txt1}
    Wait Until Page Contains    ${txt2}
    Double Click Element    ${locator_delete_completed}
    Wait Until Page Does Not Contain    ${txt1}
    Wait Until Page Does Not Contain    ${txt2}











#TC002 Login Fail
 #   open web browser
 #   Wait Until Element Is Visible    xpath=//*[@id="email"]    2s
 #   input data for login fail
 #   ${txt}=    Get Text    ${locator_msg_email}
  #  Should Be Equal As Strings    ${txt}   email must be a valid email
  #  Close Browser


   # Select From List By Index เลือกข้อมูลใน drop down ตามด้วยเลขข้อที่เลือก
    #Select From List By Label    ตาม ขค เลย  
   # Select Radio Button    
   # Select Checkbox    