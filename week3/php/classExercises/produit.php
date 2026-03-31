<?php
class Produit
{
    private $nom;
    private $prix;
    private $stock;
    function __construct($nom, $prix, $stock)
    {
        echo "he create";
        $this->nom = $nom;
        $this->prix = $prix;
        $this->stock = $stock;
    }
    function getName()
    {
        echo "name : ";
        return $this->nom;
    }
    function getPrix()
    {
        return $this->nom;
    }
    function getStock()
    {
        return $this->stock;
    }
    function setPrix($prix)
    {
        echo "he set";
        if ($prix > 0){$this->prix = $prix;return;}
        echo "prix invalide";
    }
    function setStock($stock)
    {
        if ($stock >= 0){$this->stock = $stock;}
    }
    function afficher(){
        echo "name : ".$this->nom."prix : ".$this->prix."stock : ".$this->stock;
    }
}
$produit = new Produit("idda" , 30 , 10);
$name = $produit->getName();
echo $name;
$produit2 = new Produit("iddaa" , -20 , 40);