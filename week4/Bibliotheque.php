<?php
class Bibliotheque {
    private $documents = [];
    private $tarifRetardJour;

    public function __construct($tarifRetardJour) {
        $this->tarifRetardJour = $tarifRetardJour;
    }

    public function ajouterDocument($d) {
        $this->documents[] = $d;
    }

    public function getDisponibles() {
        return array_filter($this->documents, function($d) {
            return $d->estDisponible();
        });
    }

    public function calculerRetard($d, $joursRetard) {
        return !$d->estDisponible() ? $joursRetard * $this->tarifRetardJour : 0;
    }

    public function getResume() {
        $total = count($this->documents);
        $dispos = count($this->getDisponibles());
        return $total . " doc(s) au total, " . $dispos . " disponible(s)";
    }
}