Construa testes automatizados com a ferramenta Robot Framework na versão 6.1.1, conforme as orientações abaixo:

Funcionalidade:
    Sendo um visitante do site que curte cuidar de pets
    Posso fazer meu cadastro como Dog Walker
    Para que eu possa ter uma nova fonte de renda com essas atividades

Modelagem de dados:
| Campo                                    | Seletor CSS                       | Estado         | Obrigatório?   |
| ----------------------------------       | -----------------------------     | -------------- | -------------- |
| Nome completo                            | css=input[name="name"]            | Habilitado     | Sim            |
| E-mail                                   | css=input[name="email"]           | Habilitado     | Sim            |
| CPF (somente números)                    | css=input[name="cpf"]             | Habilitado     | Sim            |
| CEP                                      | css=input[name="cep"]             | Habilitado     | Sim            |
| Botão "Buscar CEP"                       | css=input[type="button"]          | Habilitado     | Sim            |
| Rua (Endereço)                           | css=input[name="addressStreet"]   | Desabilitado   | Não            |
| Número (Endereço)                        | css=input[name="addressNumber"]   | Habilitado     | Sim            |
| Complemento (Endereço)                   | css=input[name="addressDetails"]  | Habilitado     | Não            |
| Bairro (Endereço)                        | css=input[name="addressDistrict"] | Desabilitado   | Não            |
| Cidade/UF (Endereço)                     | css=input[name="addressCityUf"]   | Desabilitado   | Não            |
| Cuidar (Atividade extra)                 | css=li:has(img[alt="Cuidar"])     | Habilitado     | Não            |
| Adestrar (Atividade extra)               | css=li:has(img[alt="Adestrar"])   | Habilitado     | Não            |
| Upload do seu documento de identificação | css=input[type="file"]            | Habilitado     | Sim            |

Outros elementos da página de cadastro:
Para submeter o formulário de cadastro de dog walker, é importante clicar no botão "Cadastrar"
O upload do documento será feito com o arquivo document.png

Cenários de aceite:

Contexto:
    Dado que visito o site Walkdog
    E que desejo me tornar Dog Walker

Cenário: Cadastro de dog walker com sucesso
    Quando submeto o formulário de cadastro com os meus dados pessoais
    Então devo ver uma mensagem de sucesso informando que meu cadastro foi para análise

Cenário: CPF incorreto
    Quando submeto o formulário informando um cpf incorreto
    Então devo ver uma mensagem de alerta com o seguinte texto: "CPF inválido"

Cenário: Email incorreto
    Quando submeto o formulário informando um email incorreto
    Então devo ver uma mensagem de alerta com o seguinte texto: "Informe um email válido"

Cenário: Campos obrigatórios
    Quando submeto o formulário sem preencher nenhum dos campos
    Então devo ver mensagens de alerta avisando que esses campos são obrigatórios
