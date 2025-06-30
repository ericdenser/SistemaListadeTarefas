import Foundation

var lista: [String] = []

func listarTarefas() {
    let n = lista.count
    if n == 0 {
        print("Nenhum exercicio registrado")
        return
    } else {
        print("\nSegue abaixo a lista de suas tarefas registradas:\n ")
        for i in 0..<n {
        print("\(i): \(lista[i])")
        }
    }
}

func adicionarTarefa(tarefa: String, lista: [String]) -> [String] {
    var copiaLista = lista
    copiaLista.append(tarefa)
    print("Tarefa \(tarefa) adicionada com sucesso!")
    return copiaLista
    
}

func removerTarefa(IdxRemover: Int, lista: [String]) -> [String] {
    var copiaLista = lista
    copiaLista.remove(at: IdxRemover)
    print("Tarefa removida com sucesso!")
    return copiaLista
}

func editarTarefa(NovoEx: String, IdxEditar: Int, lista: [String]) -> [String] {
    var copiaLista = lista
    copiaLista[IdxEditar] = NovoEx
    print("Tarefa editada com sucesso!")
    return copiaLista
}

while true {
    print("""
    === Lista de Tarefas === 
    1 - Listar tarefas 
    2 - Adicionar tarefa 
    3 - Remover tarefa 
    4 - Editar tarefa 
    5 - Sair 
    Escolha uma opção: 
    """)
    guard let opcao = readLine(), 
    let opcao = Int(opcao) else {print("Opção inválida"); continue}
    
    switch (opcao) {
    //////////////////////////////////////////////////
    
    case 1: listarTarefas()
    
    //////////////////////////////////////////////////
    case 2: 
    print("\nInforme a tarefa que deseja adicionar: ")
    guard let tarefa = readLine() else {
        print("Entrada invalida")
        continue
    }
    lista = adicionarTarefa(tarefa: tarefa, lista: lista)
    //////////////////////////////////////////////////
    
    case 3: 
    print("Informe o número do exercicio que você deseja remover: ")
    for i in 0..<lista.count {
        print("\(i): \(lista[i])")
    }
    guard let IdxRemover = readLine(), 
    let IdxRemover = Int(IdxRemover) else {print("Opção inválida"); continue}

    if IdxRemover >= lista.count {
        print("Exercicio não existe")
    } else {
        lista = removerTarefa(IdxRemover: IdxRemover, lista: lista)
    }
 
    //////////////////////////////////////////////////
    
    case 4: 
    print("Informe o número do exercicio que você deseja editar: ")
    for i in 0..<lista.count {
        print("\(i): \(lista[i])")
    }
    
    guard let IdxEditar = readLine(), 
    let IdxEditar = Int(IdxEditar) else {print("Opção inválida"); continue}

    if IdxEditar >= lista.count {
        print("Exercicio não existe")
        break
    } else {
        print("Informe o novo exercicio: ")
        guard let NovoEx = readLine() 
        else {print("Null"); continue}
        lista = editarTarefa(NovoEx: NovoEx, IdxEditar: IdxEditar, lista: lista)
    }
    
    //////////////////////////////////////////////////
    
    case 5: print("saindo"); exit(1)
    default: print("Opção inválida")
    }
}
