*** Settings ***
Library     SeleniumLibrary

Test Setup       Abrir Navegador
Test Teardown    Fechar Navegador

*** Variables ***
${URL}        https://walkdog.vercel.app/signup
${BROWSER}    Chrome
${DOCUMENT}   ${EXECDIR}/fixtures/document.png

*** Test Cases ***
Cenário: Cadastro de dog walker com sucesso
    [Tags]    happy_path
    Preencher Dados Pessoais         Thairam Ataíde    thairam@email.com    12345678901    12345-678    123    Apt 4B
    Selecionar Atividades            Cuidar    Adestrar
    Upload de Documento              ${DOCUMENT}
    Submeter Formulário de Cadastro
    Verificar Mensagem de Sucesso    Recebemos o seu cadastro e em breve retornaremos o contato.

Cenário: CPF incorreto
    [Tags]    invalid_cpf
    Preencher Dados Pessoais        Thairam Ataíde    thairam@email.com    1234567890a    12345-678    123    Apt 4B
    Submeter Formulário de Cadastro
    Verificar Mensagem de Alerta    CPF inválido

Cenário: Email incorreto
    [Tags]    invalid_email
    Preencher Dados Pessoais        Thairam Ataíde    thairam.com    12345678901    12345-678    123    Apt 4B
    Submeter Formulário de Cadastro
    Verificar Mensagem de Alerta    Informe um email válido

Cenário: Campos obrigatórios
    [Tags]    required
    Submeter Formulário de Cadastro
    Verificar Mensagem de Alerta    Informe o seu nome completo
    Verificar Mensagem de Alerta    Informe o seu melhor email
    Verificar Mensagem de Alerta    Informe o seu CPF
    Verificar Mensagem de Alerta    Informe o seu CEP
    Verificar Mensagem de Alerta    Informe um número maior que zero
    Verificar Mensagem de Alerta    Adcione um documento com foto (RG ou CHN)    

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar Navegador
    Capture Page Screenshot
    Close Browser

Vá Para a Página de Cadastro
    Go To    ${URL}/cadastro

Preencher Dados Pessoais
    [Arguments]    ${name}    ${email}    ${cpf}    ${cep}    ${number}    ${details}
    Input Text    css=input[name="name"]    ${name}
    Input Text    css=input[name="email"]    ${email}
    Input Text    css=input[name="cpf"]    ${cpf}
    Input Text    css=input[name="cep"]    ${cep}
    Input Text    css=input[name="addressNumber"]    ${number}
    Input Text    css=input[name="addressDetails"]   ${details}

Selecionar Atividades
    [Arguments]    @{atividades}
    FOR    ${atividade}    IN    @{atividades}
        Click Element    css=li:has(img[alt="${atividade}"])
    END

Upload de Documento
    [Arguments]    ${documento}
    Choose File    css=input[type="file"]    ${documento}

Submeter Formulário de Cadastro
    Click Element    css=button[type=submit]

Verificar Mensagem de Sucesso
    [Arguments]    ${mensagem}
    Wait Until Element Is Visible    xpath=//div[@class="swal2-html-container"]
    Element Should Contain           xpath=//div[@class="swal2-html-container"]    ${mensagem}

Verificar Mensagem de Alerta
    [Arguments]    ${mensagem}
    ${element}    Set Variable       xpath=//span[@class="alert-error"][text()="${mensagem}"]
    Wait Until Element Is Visible    ${element}    5