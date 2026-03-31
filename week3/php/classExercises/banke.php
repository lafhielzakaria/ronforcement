<?php
/*
10.Déclarez la classe CompteBancaire avec 3 attributs private : $titulaire, $iban, $solde
11. Écrivez le constructeur avec les 3 paramètres (solde initial = 0 par défaut si non fourni)
12.Ajoutez les getters : getTitulaire(), getIban(), getSolde()
13.Ajoutez la méthode deposer($montant) : valider que $montant > 0, puis ajouter au solde
14.Ajoutez la méthode retirer($montant) : valider que $montant > 0 ET que le solde est
suffisant, sinon afficher "Solde insuffisant"
15.Ajoutez la méthode afficherInfos() qui affiche toutes les infos du compte
16.Instanciez 2 comptes, effectuez plusieurs dépôts et retraits, vérifiez que les validations
fonctionnent
*/
class CompteBancaire
{
    private $titulaire;
    private $iban;
    private $solde;
    function __construct($iban, $titulaire,$solde = 0)
    {
        $this->titulaire = $titulaire;
        $this->iban = $iban;
        $this->solde = $solde;
    }
    function getTitulaire()
    {
        return $this->titulaire;
    }
    function getIban()
    {
        return $this->iban;
    }
    function getSolde()
    {
        return $this->solde;
    }
    function deposer($montant)
    {
        if ($montant > 0) {
            $this->solde = $this->solde + $montant;
        }
    }
    function retirer($montant)
    {
        if ($montant > 0 && $this->solde >= $montant) {
            $this->solde = $this->solde - $montant;
            return;
        }
        echo "Solde insuffisant";
    }
    function afficherInfos(){
        echo "titulaire : ".$this->titulaire."+ "."Iban  : ".$this->iban."+ "."solde : ".$this->solde;
    }
}
$bank = new CompteBancaire("zzzz", 10 , 200);
$bank->deposer(100);
$bank->retirer(400);
