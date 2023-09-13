*** Settings ***
Documentation    Tudo começa aqui
Library          SeleniumLibrary

Resource   pages/SignupPage.robot

*** Variables ***
${URL}        https://walkdog.vercel.app/signup
${BROWSER}    Chrome

*** Keywords ***
Start session
    Open Browser    ${URL}    ${BROWSER}

Finish session
    Capture Page Screenshot
    Close Browser