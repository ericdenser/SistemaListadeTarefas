import Foundation

var lista: [String] = []

func listarTarefas() {
    
    let n = lista.count
    
    if n == 0 {
        
        print("\nNenhum exercicio registrado\n")
        
        return
        
    } else {
        
        print("\nSegue abaixo a lista de suas tarefas registradas:\n ")
        
        for i in 0..<n {
            
        print("\(i+1): \(lista[i])")
        
        }
    }
}


func adicionarTarefa(tarefa: String, lista: [String]) -> [String] {
    
    var copiaLista = lista
    
    copiaLista.append(tarefa)
    
    print("\nTarefa \(tarefa) adicionada com sucesso!\n")
    
    return copiaLista
    
}


func removerTarefa(IdxRemover: Int, lista: [String]) -> [String] {
    
    var copiaLista = lista
    
    copiaLista.remove(at: IdxRemover)
    
    print("\nTarefa removida com sucesso!\n")
    
    return copiaLista
}


func editarTarefa(NovoEx: String, IdxEditar: Int, lista: [String]) -> [String] {
    
    var copiaLista = lista
    
    copiaLista[IdxEditar] = NovoEx
    
    print("\nTarefa editada com sucesso!\n")
    
    return copiaLista
}


func mudarPrioridade(IdxModificar: Int, IdxNovo: Int, lista: [String]) -> [String] {
    
    var copiaLista = lista
    
    let copiaIdxNovo = copiaLista[IdxNovo]
    
    copiaLista[IdxNovo] = copiaLista[IdxModificar]
    copiaLista[IdxModificar] = copiaIdxNovo
    
    print("\nExercicio modificado com sucesso!\n")
    
    return copiaLista
    
}


while true {
    
    print("""
    === Lista de Tarefas === 
    1 - Listar tarefas 
    2 - Adicionar tarefa 
    3 - Remover tarefa 
    4 - Editar tarefa 
    5 - Mudar Prioridade
    6 - Sair 
    Escolha uma opção: 
    """)
    guard let opcao = readLine(), 
    let opcao = Int(opcao) else {print("\nOpção inválida"); continue}
    
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
    
        if lista.count == 0 {
            print("\nNenhum exercicio registrado\n")
            continue
        }
        
        listarTarefas()
        
        print("Informe o número do exercicio que você deseja remover: ")
        
        guard let IdxRemover = readLine(), 
        var IdxRemover = Int(IdxRemover) else {
            print("Opção inválida")
            continue
            
        }
    
        if IdxRemover > lista.count || IdxRemover <= 0 {
            
            print("\nExercicio não existe\n")
            
        } else {
        
            IdxRemover -= 1
            
            lista = removerTarefa(IdxRemover: IdxRemover, lista: lista)
            
        }
     
    //////////////////////////////////////////////////
    
    case 4: 
    
        if lista.count == 0 {
            print("\nNenhum exercicio registrado\n")
            continue
        }
        
        listarTarefas()
        
        print("Informe o número do exercicio que você deseja editar: ")
        
        guard let IdxEditar = readLine(), 
        var IdxEditar = Int(IdxEditar) else {
            print("Opção inválida"); 
            continue
        }
    
        if IdxEditar > lista.count || IdxEditar <= 0 {
            
            print("\nExercicio não existe\n")
            
            continue
            
        } else {
        
            IdxEditar -= 1
            
            print("\nInforme o novo exercicio: \n")
            
            guard let NovoEx = readLine() else {
                print("Null"); 
                continue
                
            }
            
            lista = editarTarefa(NovoEx: NovoEx, IdxEditar: IdxEditar, lista: lista)
        }
    
    //////////////////////////////////////////////////
    
    case 5:
    
        if lista.count == 0 {
        
            print("\nNenhum exercicio registrado\n")
            
            continue
        }
        
        listarTarefas()
        
        print("\nInforme o número do exercicio que você deseja mudar a prioridade: ")
        
        guard let IdxModificar = readLine(), 
        var IdxModificar = Int(IdxModificar) else {
        
            print("Opção inválida"); 
            
            continue
        }
        
        if (IdxModificar > lista.count || IdxModificar <= 0) {
            print("Exercicio não existe")
            
            continue
            
        }
    
        print("\nInforme a nova prioridade do exercicio: ")
        
        guard let IdxNovo = readLine(), 
        var IdxNovo = Int(IdxNovo) else {
            print("Opção inválida"); 
            continue
        }
        
        if (IdxNovo > lista.count || IdxNovo <= 0) {
            
            print("Exercicio não existe")
            
            continue
            
        }
        
        IdxModificar -= 1
        IdxNovo -= 1
        
        lista = mudarPrioridade(IdxModificar: IdxModificar, IdxNovo: IdxNovo, lista: lista)
    
    //////////////////////////////////////////////////
    
    case 6: print("\nsaindo"); exit(0)
    
    //////////////////////////////////////////////////
    
    default: print("Opção inválida")
    
    }
}
