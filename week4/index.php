<?php
require_once 'Empruntable.php';
require_once 'Document.php';
require_once 'Livre.php';
require_once 'Magazine.php';
require_once 'Bibliotheque.php';

$bib = new Bibliotheque(0.50);

$l1 = new Livre('1984', 'Orwell', 12.50, '978-2070368228');
$l2 = new Livre('Le Petit Prince', 'Saint-Exupéry', 10.00, '978-2070408504');
$m1 = new Magazine('Nat. Geographic', 'NGS', 5.99, 312);
$m2 = new Magazine('Science & Vie', 'Reworld', 4.50, 1245);

$bib->ajouterDocument($l1);
$bib->ajouterDocument($l2);
$bib->ajouterDocument($m1);
$bib->ajouterDocument($m2);

$l1->emprunter();

echo "Documents disponibles :\n";
foreach ($bib->getDisponibles() as $doc) {
    echo "- " . $doc->getDescription() . "\n";
}

echo "\nTest Retard :\n";
echo "Livre emprunté (5j) : " . $bib->calculerRetard($l1, 5) . "€\n";
echo "Livre disponible (5j) : " . $bib->calculerRetard($l2, 5) . "€\n";

echo "\nRésumé :\n";
echo $bib->getResume() . "\n";