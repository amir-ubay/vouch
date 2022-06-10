*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}=    https://vouch-public.github.io/sdet-interview/

*** Test Cases ***
Widget Button Should Open Chat Panel
    [Tags]    Test1    openChatPanel
    set selenium timeout    15 seconds
    Open homepage
    Open chat panel
    close browser

Chat panel should have "Vouch Widget" as title
    [Tags]    Test2    checkTitle
    set selenium timeout    15 seconds
    Open homepage
    Open chat panel
    Verify chat panel title
    close browser

Chat panel minimise button should close the chat panel
    [Tags]    Test3     closeChatPanel
    set selenium timeout    15 seconds
    Open homepage
    Open chat panel
    Close chat panel
    close browser

Get Started button should initiate conversation
    [Tags]    Test4         getStarted
    set selenium timeout    15 seconds
    Open homepage
    Open chat panel
    Click get started button
    Verify initiation conversation
    close browser

Sending "hello" message
    [Tags]    Test5     verifyHello
    set selenium timeout    15 seconds
    Open homepage
    Open chat panel
    Click get started button
    Type text    hello
    Verify reply hello
    close browser

Widget bottom bar buttons should trigger messages when clicked
    [Tags]    Test6         clickHelloButton
    set selenium timeout    15 seconds
    Open homepage
    Open chat panel
    Click get started button
    Wait first message
    Click hello button
    Verify hello button reply
    close browser

Widget buttons should trigger messages
    [Tags]    Test7     whatReplyButton
    Open homepage
    Open chat panel
    Click get started button
    Wait first message
    Click hello button
    Verify hello button reply
    Click what button
    Verify what button reply
    close browser

Widget retains conversation
    [Tags]    Test8
    set selenium timeout    15 seconds
    open browser    https://vouch-public.github.io/sdet-interview/     chrome
    wait until element is visible   id:widget-activator
    click element    id:widget-activator
    select frame    id:vc-chat-iframe
    wait until element is visible       css:[class="vc-widget-input-container vc-widget-get-started-button"]
    click element    css:[class="vc-widget-input-container vc-widget-get-started-button"]
    wait until element is visible    id:vc-list
    wait until element contains    id:vc-list   Hi! How are you?
    wait until element contains    id:vc-list   When your users first interact with your bot, messages from this block is what they will see.
    wait until element contains    id:vc-list   Make sure this block is never empty!
    click element    css:[class="vc-menu-bar vc-widget-panel-menu"]
    wait until element contains    xpath://*[@id="vc-list"]/div/div[3]/div/div/div   hello!
    click element   xpath://*[@id="vc-list"]/div/div[3]/div/div/div/div[2]/div[2]/div
    wait until element contains    xpath://*[@id="vc-list"]/div/div[5]/div/div/div[1]/div[2]/div[1]/div     what ?
    ${talks}=   get text    css:#vc-list
    Reload Page
    wait until element is visible   css:#vc-chat-iframe
    select frame    id:vc-chat-iframe
    wait until element contains     css:#vc-list    ${talks}
    close browser


*** Keywords ***
Open homepage
    open browser    ${url}     chrome

Open chat panel
    wait until element is visible   id:widget-activator
    click element    id:widget-activator
    select frame    id:vc-chat-iframe
    element should be visible    id:app
    unselect frame

Verify chat panel title
    select frame    id:vc-chat-iframe
    wait until element is visible    css:[class="vc-app-bar-title-center vc-app-bar-item-grow"]
    element should contain    css:[class="vc-app-bar-title-center vc-app-bar-item-grow"]    Vouch Widget

Close chat panel
    click element    id:widget-activator
    element should not be visible    css:vc-chat-panel-container

Click get started button
    select frame    id:vc-chat-iframe
    wait until element is visible       css:[class="vc-widget-input-container vc-widget-get-started-button"]
    click element    css:[class="vc-widget-input-container vc-widget-get-started-button"]
    unselect frame

Verify initiation conversation
    select frame    id:vc-chat-iframe
    wait until element is visible    id:vc-list
    wait until element contains    id:vc-list   Hi! How are you?
    wait until element contains    id:vc-list   When your users first interact with your bot, messages from this block is what they will see.
    wait until element contains    id:vc-list   Make sure this block is never empty!

Type text
    [Arguments]    ${text}
    select frame    id:vc-chat-iframe
    wait until element is visible   css:[class="vc-widget-input-text"]
    input text    css:[class="vc-widget-input-text"]    ${text}
    press keys    css:[class="vc-widget-input-text"]    RETURN
    unselect frame

Verify reply hello
    select frame    id:vc-chat-iframe
#    wait until element contains    xpath://*[@id="vc-list"]/div/div[3]/div/div/div   Hello
    wait until element contains    xpath://*[@id="vc-list"]/div/div[3]/div/div/div   This block gets called when the A.I. doesn't understand what your customer is saying

Click hello button
    select frame    id:vc-chat-iframe
    wait until element is visible    css:[class="vc-menu-bar vc-widget-panel-menu"]
    click element    css:[class="vc-menu-bar vc-widget-panel-menu"]
    wait until element contains    xpath://*[@id="vc-list"]/div/div[3]/div/div/div   hello!
    unselect frame

Wait first message
    select frame    id:vc-chat-iframe
    wait until element is visible    id:vc-list
    wait until element contains    id:vc-list   Hi! How are you?
    wait until element contains    id:vc-list   When your users first interact with your bot, messages from this block is what they will see.
    wait until element contains    id:vc-list   Make sure this block is never empty!
    unselect frame

Verify hello button reply
    select frame    id:vc-chat-iframe
    wait until element contains    xpath:/html/body/div/div/div[2]/div/div[3]/div/div/div[1]/div[2]/div[1]   hello!
    unselect frame

Click what button
    select frame    id:vc-chat-iframe
    click element   xpath://*[@id="vc-list"]/div/div[3]/div/div/div/div[2]/div[2]/div
    wait until element contains    xpath://*[@id="vc-list"]/div/div[5]/div/div/div[1]/div[2]/div[1]/div     what ?
    unselect frame

Verify what button reply
    select frame    id:vc-chat-iframe
    wait until element contains    xpath://*[@id="vc-list"]/div/div[5]/div/div/div[1]/div[2]/div[1]/div     what ?
    unselect frame