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
   Acessar a home page do site Amazon.com.br
   Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
   Entrar no menu "Eletrônicos"
   Verificar se aparece a frase "Eletrônicos e Tecnologia"
   Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
   Verificar se aparece a categoria "Computadores e Informática"
   Verificar se aparece a categoria "Tablets"


Caso de Teste 02 - Pesquisa de um Produto
   [Documentation]  Esste teste verifica a busca de um produto
   [Tags]           busca_produtos  lista_busca
   Acessar a home page do site Amazon.com.br
   Digitar o nome de produto "Xbox Series S" no campo de pesquisa
   Clicar no botão de pesquisa
   Verificar o resultado da pesquisa, se esta listando o produto "Console Xbox Series S"

#Caminho infeliz
Caso de Teste 03 - Tentativa de Efetuar o Login com Email inválido
   [Documentation]  Esste teste verifica se será permitido efetuar o login informando um e-mail inválido
   [Tags]           Login  email_invalaido
   Acessar a home page do site Amazon.com.br
   Acessar a tela para efetuar o login
   Digitar um e-mail inválido "keke@kenia.com"
   Clicar no botão Continuar
   O acesso não deverá ser permitido

