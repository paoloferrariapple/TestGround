import Foundation

// ================================================
// ================= SCACCHI ======================
// ================================================

class GiocaScacchi {
    var campo: [[String]] = []
    
    init() {
        campo.append(["t", "c", "a", "q", "k", "a", "c", "t"])
        campo.append(Array(repeating: "p", count: 8))
        campo += Array(repeating: Array(repeating: "", count: 8), count: 4)
        campo.append(Array(repeating: "P", count: 8))
        campo.append(["T", "C", "A", "Q", "K", "A", "C", "T"])
    }
    
    func show() {
        for i in self.campo {
            print(i.map( { $0 == "" ? " " : $0 } ))
        }
    }
    
    func checkMove(_ xP: Int, _ yP: Int, _ xA: Int, _ yA: Int) -> Bool {
        switch self.campo[yP][xP] {
        case "p":
            if yP == 1 {
                if yA - yP == 1 && xA == xP { //1 cella da pos iniziale
                    if self.campo[yA][xA] == "" {
                        return true
                    } else {
                        return false
                    }
                } else if yA - yP == 2 && xA == xP { //2 celle da pos iniziale
                    if self.campo[yA][xA] == "" && self.campo[yA-1][xA] == "" {
                        return true
                    } else {
                        return false
                    }
                } else if yA - yP == 1 && (xA - xP == 1 || xA - xP == -1) && self.campo[yA][xA] != "" { //mangia da pos iniziale
                    return true
                } else {
                    return false
                }
            } else {
                if yA - yP == 1 && xA == xP { //1 cella
                    if self.campo[yA][xA] == "" {
                        return true
                    } else {
                        return false
                    }
                } else if yA - yP == 1 && (xA - xP == 1 || xA - xP == -1) && self.campo[yA][xA] != "" { //mangia
                    return true
                } else {
                    return false
                }
            }
        case "P":
            if yP == 6 {
                if yP - yA == 1 && xA == xP { //1 cella da pos iniziale
                    if self.campo[yA][xA] == "" {
                        return true
                    } else {
                        return false
                    }
                } else if yP - yA == 2 && xA == xP { //2 celle da pos iniziale
                    if self.campo[yA][xA] == "" && self.campo[yA+1][xA] == "" {
                        return true
                    } else {
                        return false
                    }
                } else if yP - yA == 1 && (xA - xP == 1 || xA - xP == -1) && self.campo[yA][xA] != "" { //mangia da pos iniziale
                    return true
                } else {
                    return false
                }
            } else {
                if yP - yA == 1 && xA == xP { //1 cella
                    if self.campo[yA][xA] == "" {
                        return true
                    } else {
                        return false
                    }
                } else if yP - yA == 1 && (xA - xP == 1 || xA - xP == -1) && self.campo[yA][xA] != "" { //mangia
                    return true
                } else {
                    return false
                }
            }
        default:
            return false
        }
    }
}

// ================================================
// ================= TELEFONO =====================
// ================================================

class Phone {
    private var codice: String
    private var modello: String
    private var marca: String
    private var prezzo: Double
    private var isDualSim: Bool
    
    init(_ codice: String, _ modello: String, _ marca: String, _ prezzo: Double, _ isDualSim: Bool) {
        self.codice = codice
        self.modello = modello
        self.marca = marca
        self.prezzo = prezzo
        self.isDualSim = isDualSim
        setIsDualSim(isDualSim)
    }
    
    func showInfo() {
        let info: String = self.isDualSim ? "si" : "no"
        print("Codice: \(self.codice), Modello: \(self.modello), Marca: \(self.marca), Prezzo: \(self.prezzo), DualSim: " + info)
    }
    
    func setCodice(_ codice: String) {
        self.codice = codice
    }
    func getCodice() -> String {
        return self.codice
    }
    
    func setModello(_ modello: String) {
        self.modello = modello
    }
    func getModello() -> String {
        return self.modello
    }
    
    func setMarca(_ marca: String) {
        self.marca = marca
    }
    func getMarca() -> String {
        return self.marca
    }
    
    func setPrezzo(_ prezzo: Double) {
        self.prezzo = prezzo
    }
    func getPrezzo() -> Double {
        return self.prezzo
    }
    
    func setIsDualSim(_ isDualSim: Bool) {
        self.isDualSim = self.marca == "Apple" ? false : isDualSim
    }
    func getIsDualSim() -> Bool {
        return self.isDualSim
    }
    
}

// ================================================
// ================== CALCIO ======================
// ================================================

class Player {
    private var nome: String
    private var ruolo: String
    private var numero: Int
    
    init(_ nome: String, _ ruolo: String, _ numero: Int) {
        self.nome = nome
        self.ruolo = ruolo
        self.numero = numero
    }
    
    func showPlayer() {
        print("Nome: \(nome), Ruolo: \(ruolo), Numero: \(numero)")
    }
    
    func getNome() -> String {
        return self.nome
    }
    
    func getRuolo() -> String {
        return self.ruolo
    }
    func setRuolo(_ ruolo: String) {
        self.ruolo = ruolo
    }
    
    func getNumero() -> Int {
        return self.numero
    }
    func setNumero(_ numero: Int) {
        self.numero = numero
    }
}

class Allenatore {
    private var nome: String
    private var ingaggio: Double
    
    init(_ nome: String, _ ingaggio: Double) {
        self.nome = nome
        self.ingaggio = ingaggio
    }
    
    func showAllenatore() {
        print("Nome: \(nome), Ingaggio: \(ingaggio)")
    }
    
    func getNome() -> String {
        return self.nome
    }
    
    func getIngaggio() -> Double {
        return self.ingaggio
    }
    func setIngaggio(_ ingaggio: Double) {
        self.ingaggio = ingaggio
    }
}

class Team {
    private var nome: String
    private var players: [Player]
    private var allenatore: Allenatore
    
    init(_ nome: String, _ players: [Player], _ allenatore: Allenatore) {
        self.nome = nome
        self.allenatore = allenatore
        self.players = []
        if !addPlayers(players) {
            print("Errore: più di un portiere inserito")
        }
    }
    
    func showTeam() {
        print("Allenatore:")
        allenatore.showAllenatore()
        print("Giocatori:")
        for i in players {
            i.showPlayer()
        }
    }
    
    func addPlayers(_ players: [Player]) -> Bool{
        for i in players {
            if i.getRuolo() == "Portiere" && !isPortierePresent() {
                self.players.append(i)
            } else if i.getRuolo() == "Portiere" && isPortierePresent() {
                return false
            } else {
                self.players.append(i)
            }
        }
        return true
    }
    
    func addPlayer(_ player: Player) -> Bool{
        return addPlayers([player])
    }
    
    func isPortierePresent() -> Bool {
        for i in self.players{
            if i.getRuolo() == "Portiere" {
                return true
            }
        }
        return false
    }
}
