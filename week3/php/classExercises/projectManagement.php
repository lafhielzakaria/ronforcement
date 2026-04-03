<?php
/*
Une agence digitale gère des projets composés de tâches. Chaque tâche a une durée estimée.
Le chef de projet veut calculer le budget total d'un projet en se basant sur les heures estimées,
en ajoutant une marge de 10% pour les imprévus. Il veut aussi pouvoir lister les tâches
dépassant un certain seuil d'heures.
*/
class Task
{
    private $id;
    private $description;
    private $estimatedHours;
    function __construct($description, $estimatedHours)
    {
        $this->description = $description;
        $this->estimatedHours = $estimatedHours;
    }
    function isBig($threshold)
    {
        return $this->estimatedHours > $threshold;
    }
    function getDescription()
    {
        return $this->description;
    }
    function getEstimatedHours()
    {
        return $this->estimatedHours;
    }
}
class Project
{
    private $title;
    private $dailyRate;
    private $tasks = [];
    function __construct($title, $dailyRate)
    {
        $this->title = $title;
        $this->dailyRate = $dailyRate;
    }
    function calculateTotalHours()
    {
        $totalHours = 0;
        foreach ($this->tasks as $task) {
            $taskEstimatedHours = $task->getEstimatedHours();
            $totalHours = $totalHours + $taskEstimatedHours;
        }
        return $totalHours;
    }
    function addTask($task)
    {
        $this->tasks[] = $task;
    }
    function calculateTotalWithBuffer($bufferPercent = 10)
    {
        $totalHours = $this->calculateTotalHours();
        $bufferHours =  $totalHours * $bufferPercent % 100;
        $totalHoursWithBuffer = $totalHours + $bufferHours;
        return $totalHoursWithBuffer;
    }
    function calculateBudget()
    {
        /*
        totalHeures * dailyRate / 8 (tauxjournalier / 8h)
        */
        $totalWithBuffer = $this->calculateTotalWithBuffer();
        $projectBudget = $totalWithBuffer * $this->dailyRate / 8;
        return $projectBudget;
    }
    function getBigTasks($threshold)
    {
        //declare new array to stock bigTasks
        //foreach in the tasks array
        //condition 3la kola task 4an nbasiw estimatedHours dyalo lfunction ola returnat true 4adi npushwh ful larray
        $bigArray = [];
        foreach ($this->tasks as $task) {
            if ($task->isBig($task->estimatedHours)) {
                $bigArray[] = $task;
            }
        }
    }
}
$task = new Task("lalalalalla", 12);
$task2 = new Task("lalalalallaq", 20);
$project = new Project("app", 100);
$project->addTask($task);
$project->addTask($task2);
$totalHours = $project->calculateTotalHours();
var_dump($totalHours);