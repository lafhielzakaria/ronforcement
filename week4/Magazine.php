<?php
class Magazine extends Document {
    private $numero;

    public function __construct($titre, $auteur, $prix, $numero) {
        parent::__construct($titre, $auteur, $prix);
        $this->numero = $numero;
    }

    public function getNumero() { return $this->numero; }

    public function getDescription() {
        return "[Magazine] " . $this->titre . " — " . $this->auteur . " (" . $this->prix . "€) | N°" . $this->numero;
    }
}