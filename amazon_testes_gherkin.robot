*** Settings ***
Documentation   Essa suite testa o site da Amazon.com.br
Resource        amazon_resources.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
   [Documentation]  Este teste verifica o menu eletonicos do site da Amazon.com.br
   ...              e verifica a categoria computadores e informática
   [Tags]           menus  categorias
   Dado que estou na home page da Amazon.com.br
   Quando acessar o menu "Eletrônicos"
   Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
   E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
   E a categoria "Computadores e Informática" deve ser exibida na página



Caso de Teste 02 - Pesquisa de um Produto
   [Documentation]  Esste teste verifica a busca de um produto
   [Tags]           busca_produtos  lista_busca
   Dado que estou na home page da Amazon.com.br
   Quando pesquisar pelo produto "Xbox Series S"
   Então um produto da linha "Xbox Series S" deve ser mostrado na página
   E o título da página deve ficar "Amazon.com.br : Xbox Series S"


#Caminho infeliz
Caso de Teste 03 - Tentativa de Efetuar o Login com Email inválido
   [Documentation]  Esste teste verifica se será permitido efetuar o login informando um e-mail inválido
   [Tags]           Login  email_invalaido
   Dado que estou na home page da Amazon.com.br
   E acesso a tela de login
   Quando digito um email invalido
   Então o cacesso não deverá ser permitido


   

