*** Settings ***

Resource    ${EXECDIR}/resources/base.resource
Test Setup    Start session
Test Teardown    Finish session

*** Test Cases ***
Cadastro de Dog Walker com Sucesso
    [Documentation]    Cadastro de Dog Walker com todos os campos preenchidos corretamente.
    [Tags]    happy_path
    Fill signup form        name=Thairam Ataíde    email=email@email.com    cpf=12345678910   cep=12345-678    number=133    details=Apt 4B
    Submit signup form
    Popup have text         expected_text=Recebemos o seu cadastro e em breve retornaremos o contato.

CPF Incorreto
    [Documentation]    Tentativa de cadastro com CPF incorreto.
    [Tags]    cpf_invalid
    Fill signup form        name=Thairam Ataíde    email=email@email.com    cpf=1234567891a   cep=12345-678    number=133    details=Apt 4B
    Submit signup form
    Alert have text         expected_text=CPF inválido

Email Incorreto
    [Documentation]    Tentativa de cadastro com Email incorreto.
    [Tags]    email_invalid
    Fill signup form        name=Thairam Ataíde    email=email.com    cpf=12345678910   cep=12345-678    number=133    details=Apt 4B
    Submit signup form
    Alert have text         expected_text=Informe um email válido

Campos Obrigatórios
    [Documentation]    Tentativa de cadastro sem preencher campos obrigatórios.
    [Tags]    required_fields_not_provided
    Submit signup form
    Alert have text    expected_text=Informe o seu nome completo
    Alert have text    expected_text=Informe o seu melhor email
    Alert have text    expected_text=Informe o seu CPF
    Alert have text    expected_text=Informe o seu CEP
    Alert have text    expected_text=Informe um número maior que zero
    Alert have text    expected_text=Adcione um documento com foto (RG ou CHN)