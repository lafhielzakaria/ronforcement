//Start Ex1
function fusionProfonde(obj1, obj2) {

}
fusionProfonde(
    { a: 1, b: { x: 1, y: 2 } },
    { b: { y: 99, z: 3 }, c: 4 }
)
/*output{{ a:1, b:{ x:1, y:99, z:3 },
c:4 }*/
//Ex1 end
//start Ex2
function pivoter(releves) {
    //forach
    //filter
    //reduce
    //splice
    //map
    let newReleves = [];
    let updatedReleves = [];
    let deletedReleves = [];
    console.log(releves);
    releves.forEach(releve => {
        let currentReleve = releve;
        if (updatedReleves.find(releve => releve.vendeur == currentReleve.vendeur)) {
            let index = releves.indexOf(currentReleve);
            console.log(index);
            releves.splice(index, 1);
            deletedReleves.push(currentReleve);
        }
        else {
            let filteredByVendeur = releves.filter(releve => releve.vendeur === currentReleve.vendeur);
            console.log(filteredByVendeur);
            let totalVentes = filteredByVendeur.reduce((a, b) => a.ventes + b.ventes);
            console.log("total" + totalVentes);
            releve.ventes = totalVentes;
            updatedReleves.push(currentReleve);
        }

    })
    console.log(releves);
}
const releves = [
    { vendeur: 'Alice', mois: 'Jan', ventes: 12000 },
    { vendeur: 'Bob', mois: 'Jan', ventes: 8500 },
    { vendeur: 'Alice', mois: 'Fev', ventes: 15000 },
    { vendeur: 'Bob', mois: 'Fev', ventes: 11000 },
    { vendeur: 'Clara', mois: 'Jan', ventes: 9200 },
    { vendeur: 'Clara', mois: 'Fev', ventes: 13400 },
];
/*output : => { Alice:27000, Bob:19500,
Clara:22600 } */
pivoter(releves);
// classement(releves);
//Ex2 end