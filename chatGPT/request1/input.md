Adicione os seletores em uma tabela delimitada por pipe, de todos os elementos de entrada de dados, do HTML abaixo:

Quero que a tabela tenha a seguinte estrutura com todos os campos preenchidos: Campo, Seletor CSS, Estado, Obrigatório?
Quero que seja considerado o elemento de upload de arquivos
Preencha os valores da coluna Seletor CSS com o prefixo css=
Preencha os valores da coluna Estado com Habilitado ou Desabilitado

<form>
    <h1>Faça seu cadastro</h1>
    <p>Use nosso aplicativo para ganhar dinheiro fazendo o que ama: cuidar de pets</p>
    <fieldset>
        <div class="form-header">
            <h2>Dados</h2>
        </div>
        <div class="field-group">
            <div class="field"><input type="text" name="name" placeholder="Nome completo"></div>
        </div>
        <div class="field-group">
            <div class="field"><input type="text" name="email" placeholder="E-mail"></div>
            <div class="field"><input type="text" name="cpf" placeholder="CPF somente números"></div>
        </div>
    </fieldset>
    <fieldset>
        <div class="form-header">
            <h2>Endereço</h2><span>Informe o cep, número e complemento</span>
        </div>
        <div class="field-group">
            <div class="field"><input type="text" name="cep" placeholder="CEP" value=""></div>
            <div class="field"><input type="button" value="Buscar CEP"></div>
        </div>
        <div class="field"><input type="text" name="addressStreet" placeholder="Rua" disabled="" value=""></div>
        <div class="field-group">
            <div class="field"><input type="number" name="addressNumber" placeholder="Número"></div>
            <div class="field"><input type="text" name="addressDetails" placeholder="Complemento"></div>
        </div>
        <div class="field-group">
            <div class="field"><input type="text" name="addressDistrict" placeholder="Bairro" disabled="" value="">
            </div>
            <div class="field"><input type="text" name="addressCityUf" placeholder="Cidade/UF" disabled="" value="">
            </div>
        </div>
    </fieldset>
    <fieldset>
        <div class="form-header">
            <h2>Atividades extras</h2><span>Ganhe mais cuidando e/ou adestrando</span>
        </div>
        <ul class="walker-service">
            <li class=""><img src="/static/media/care.da95fc40d07de684ba44.png" alt="Cuidar"
                    width="80"><span>Cuidar</span></li>
            <li class=""><img src="/static/media/train.76340ac43fd11b8a312f.png" alt="Adestrar"
                    width="80"><span>Adestrar</span></li>
        </ul>
    </fieldset>
    <div class="dropzone" role="presentation" tabindex="0"><input accept="image/*" multiple="" type="file" tabindex="-1"
            style="display: none;">
        <p><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round"
                stroke-linejoin="round" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                <polyline points="17 8 12 3 7 8"></polyline>
                <line x1="12" y1="3" x2="12" y2="15"></line>
            </svg>Upload do seu documento de identificação</p>
    </div><button type="submit" class="button-register">Cadastrar</button>
</form>