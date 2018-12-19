# - Adicionar é classe que representa a subpagina Adicionar tarefas
# que será tratada como uma Seção do SitePrism
class Adicionar < SitePrism::Section
  element :campo_nome, 'input[name=title]'
  element :campo_data, 'input[name=dueDate]'
  element :campo_tags, '.bootstrap-tagsinput input'
  element :botao_cadastrar, 'button[id*=submit]'
  element :alerta, '.alert-warn'

  def add_tags(tags)
    tags.each do |t|
      campo_tags.set t[:tag]
      campo_tags.send_keys :tab
    end
  end

  def cadastrar(tarefa, tags)
    campo_nome.set tarefa[:nome]
    campo_data.set tarefa[:data]
    add_tags(tags)
    botao_cadastrar.click
  end
end

# - TarefasPage é a pagina principal
class TarefasPage < SitePrism::Page
  element :painel, '#task-board'
  element :botao_novo, '#insert-button'

  element :campo_busca, 'input[name=search]'
  element :botao_busca, '#search-button'

  elements :itens, 'table tbody tr'
  element :botao_confirmar, '.btn.btn-danger'
  element :botao_deixa_queto, 'button[data-bb-handler=danger]'
  element :tarefa_nao_cadastrada, '.panel.panel-filled.panel-c-info'

  element :botao_editar, '#edit-button'
  element :finalizar_tarefa_edicao, 'name=done'
  
  def busca(valor)
    campo_busca.set valor
    botao_busca.click
  end

  def item(valor)
    find('table tbody tr', text: valor)
  end

  section :adicionar, Adicionar, '#add-task-view'
end
