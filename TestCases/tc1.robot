*** Settings ***
Library     SeleniumLibrary

*** Variables ***


*** Test Cases ***
Widget Button Should Open Chat Panel
    set selenium timeout    15 seconds
    open browser    https://vouch-public.github.io/sdet-interview/     chrome
    wait until element is visible   id:widget-activator
    click element    id:widget-activator
    select frame    id:vc-chat-iframe
    element should be visible    id:app
    close browser

Chat panel should have "Vouch Widget" as title
    set selenium timeout    15 seconds
    open browser    https://vouch-public.github.io/sdet-interview/     chrome
    wait until element is visible   id:widget-activator
    click element    id:widget-activator
    element should be visible    id:app
    select frame    id:vc-chat-iframe
    wait until element is visible    css:[class="vc-app-bar-title-center vc-app-bar-item-grow"]
    element should contain    css:[class="vc-app-bar-title-center vc-app-bar-item-grow"]    Vouch Widget
    close browser

Chat panel minimise button should close the chat panel
    set selenium timeout    15 seconds
    open browser    https://vouch-public.github.io/sdet-interview/     chrome
    wait until element is visible   id:widget-activator
    click element    id:widget-activator
    element should be visible    id:app
    click element    id:widget-activator
    element should not be visible    css:vc-chat-panel-container
    close browser

Get Started button should initiate conversation
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
    close browser

Sending "hello" message
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
    input text    css:[class="vc-widget-input-text"]    hello
    press keys    css:[class="vc-widget-input-text"]    RETURN
#    wait until element contains    xpath://*[@id="vc-list"]/div/div[3]/div/div/div   Hello
    wait until element contains    xpath://*[@id="vc-list"]/div/div[3]/div/div/div   This block gets called when the A.I. doesn't understand what your customer is saying
    close browser

Widget bottom bar buttons should trigger messages when clicked
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
    close browser

Widget buttons should trigger messages
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
    close browser

Widget retains conversation
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