//
//  main.swift
//  TestGround
//
//  Created by user on 06/06/22.
//

import Foundation
import Numerics

/*
// input 2 numeri e operzioni
print("inserisci a:")
let a = Int(readLine()!) ?? 0
print("inserisci b:")
let b = Int(readLine()!) ?? 0
print("la somma è: \(a + b)")
print("la differenza è: \(a - b)")
print("il prodotto è: \(a * b)")
print("il quoziente è: \(a / b)")
print("il modulo è: \(a % b)")

//input 2 numeri e operazioni
print("inserisci a:")
if let a = Int(readLine()!) {
    print("inserisci b:")
    if let b = Int(readLine()!) {
        print("la somma è: \(a + b)")
        print("la differenza è: \(a - b)")
        print("il prodotto è: \(a * b)")
        print("il quoziente è: \(a / b)")
        print("il modulo è: \(a % b)")
    }
}

//input un numero e definizione pari o dispari
print("inserisci a:")
let a = Int(readLine()!) ?? 0

a % 2 == 0 ? print("il numero è pari") : print("il numero è dispari")
    
/*
if (a%2) == 0 {
    print("il numero è pari")
} else {
    print("il numero è dispari")
} */
 

//intero in input definizione se maggiorenne
print("inserisci età:")
let a = Int(readLine()!) ?? 0

a >= 18 ? print("ok") : print("no")


//stampa la tabelina del 2
for i in 0...10 {
    print(" 2 * \(i) = \(2 * i)")
}

 
//input 2 numeri ed eleva a potenza
print("inserisci a:")
let a = Int(readLine()!) ?? 0
print("inserisci b:")
let b = Int(readLine()!) ?? 0
var potenza = a
for _ in 1..<b {
    potenza *= a
}
print("\(a) elevato a \(b) = \(potenza)")


//input numero calcolo fattoriale
print("inserisci a:")
let a = Int(readLine()!) ?? 0

if(a > 0) {
    print(calcoloFattoriale(numero: a))
} else if(a < 0) {
    print(calcoloFattoriale(numero: a * -1))
} else {
    print("My dog stepped on a bee T-T")
}

func calcoloFattoriale(numero: Int) -> Int{
    var fattoriale = 1
    
    for i in 1...numero {
        fattoriale *= i
    }
    
    return fattoriale
}

//fattoriale approssimato
print("inserisci a:")
let a = Double(readLine()!) ?? 0

var risultato = sqrt(2 * Double.pi * a) * pow(a / exp(1), a)

print(risultato)

//input 5 numeri, somma totale
var somma: Int = 0
for i in 1...5 {
    print("numero \(i): ", terminator: "")
    let a = Int(readLine()!) ?? 0
    somma += a
}
print("la somma è: \(somma)")


//sommatoria tra 2 numeri
print("primo limite: ", terminator: "")
let a = Int(readLine()!) ?? 0
print("secondo limite: ", terminator: "")
let b = Int(readLine()!) ?? 0

var somma: Int = 0

if a > b {
    for i in b...a {
        somma += i
    }
} else {
    for i in a...b {
        somma += i
    }
}
print("la somma è: \(somma)")


//conta i numeri pari inseriti
var numeriPari: Int = 0
for i in 1...5 {
    print("numero \(i): ", terminator: "")
    let a = Int(readLine()!) ?? 0
    if a % 2 == 0 {
        numeriPari += 1
    }
}
print("ho contato \(numeriPari) numeri pari")


//sequenza che termina con 0, stampa media
var numero: Int = 0
var count: Int = 0
var media: Double = 0
repeat {
    count += 1
    print("numero \(count): ", terminator: "")
    numero = Int(readLine()!) ?? 0
    
    media += Double(numero)
    
} while numero != 0

media /= Double(count - 1)

print(media)


//inserito un positivo stampa divisori
var numero: Int = 0
var tryNumber: Int = 0

repeat {
    print("inserisci un numero positivo: ", terminator: "")
    numero = Int(readLine()!) ?? 0
    
    if numero > 0 {
        print("i divisori di \(numero) sono:")
        for i in 1...(numero/2) {
            if numero % i == 0{
                print("\(i)|", terminator: "")
            }
        }
        print("\(numero)")
    } else {
        print("numero non valido")
        tryNumber += 1
    }
    
} while numero <= 0 && tryNumber < 3

if(tryNumber == 3) {
    print("Se non sai leggere l'italiano torna più tardi")
}


//numero primo
print("inserisci un numero positivo: ", terminator: "")
var numero = Int(readLine()!) ?? 0
var divisori: Int = 0
for i in 2...(numero/2) {
    if numero % i == 0{
        divisori += 1
    }
}

if divisori == 0 {
    print("\(numero) è primo")
} else {
    print("\(numero) non è primo")
}


//inseriti numeri torna pari, dispari e nulli
var numeriPositivi: Int = 0
var numeriNegativi: Int = 0
var nulli: Int = 0

for i in 1...10 {
    print("numero \(i): ", terminator: "")
    let a = Int(readLine()!) ?? 0
    if a < 0 {
        numeriNegativi += 1
    } else if a > 0 {
        numeriPositivi += 1
    } else {
        nulli += 1
    }
}
print("ho contato \(numeriPositivi) numeri positivi")
print("ho contato \(numeriNegativi) numeri negativi")
print("ho contato \(nulli) zeri")


func sommaMatriceRandom() -> Int{
    var matrice: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: 3)
    matrice = matrice.map{ $0.map {_ in Int.random(in: 0...10) } }
    let sommeParziali = matrice.compactMap{ $0.reduce(0, { x, y in x + y } ) }
    return sommeParziali.reduce(0, { x, y in x + y } )
}

func stringaPiuLunga(_ stringhe: [String]) -> String {
    return stringhe.sorted(by: { $0.count > $1.count })[0]
}

func trovaProdotto(_ n: Int, _ matrice: [[Int]]) -> [Int] {
    var flatten = matrice.flatMap( { $0 } )
    var output: [Int] = [-1]
    
    for i in flatten {
        for j in flatten {
            if i * j == n && !output.contains(i){
                output = [j, i]
                break
            }
        }
    }
    
    print(flatten)
    return output
}

func ifRigheXColonne(_ mat: [[Int]]) -> Bool {
    let righe = mat.map{ $0.reduce(1, { x, y in x * y } ) }
    var colonne: [Int] = []
    
    for i in 0..<mat.count {
        var prod: Int = 1
        for j in 0..<mat.count {
            prod *= mat[j][i]
        }
        colonne.append(prod)
    }
    
    print("righe: \(righe)")
    print("colonne: \(colonne)")
    
    for i in righe {
        if colonne.contains(i) {
            return true
        }
    }
    
    return false
}
 
 func maggioreDei3(_ a: Int, _ b: Int, _ c: Int) -> Int {
     return [a, b, c].sorted(by: { $0 > $1 } )[0]
 }

 func minInSec(minuti: Int) -> Int {
     if minuti <= 0 {
         return 0
     } else {
         return minuti * 60
     }
 }
*/

var squadra: Team = Team("TeamA", [Player("Marco", "Portiere", 10), Player("Antonio", "Portiere", 12)], Allenatore("Mario", 12000.0))

squadra.showTeam()
