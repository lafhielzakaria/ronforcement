<?php
/*
### Exercise 4: Basic Inheritance
**Concepts**: extends, parent::, protected

Create a `Vehicle` class with:
- Protected properties: `brand`, `speed`
- Constructor
- Method `accelerate($amount)` - increases speed
- Method `getInfo()` - returns vehicle info

Create `Car` and `Motorcycle` classes that extend `Vehicle`:
- Add specific properties (e.g., `numberOfDoors` for Car)
- Override `getInfo()` to include specific details

```php
$car = new Car("Toyota", 0, 4);
$car->accelerate(50);
echo $car->getInfo(); // Toyota Car with 4 doors, Speed: 50 km/h
*/
class Vehicle
{
    public $brand;
    public $speed;
    function __construct($brand, $speed)
    {
        $this->brand = $brand;
        $this->speed = $speed;
    }
    function accelerate($amount)
    {
        $this->speed = $amount;
    }
    function getInfo()
    {
        echo "car" . $this->brand . $this->speed;
    }
}
class Car extends Vehicle
{
    public $numberOfDoors;
    function __construct($brand, $speed, $numberOfDoors)
    {
        $this->brand = $brand;
        $this->speed = $speed;
        $this->numberOfDoors = $numberOfDoors;
    }
    function getInfo()
    {
        // Toyota Car with 4 doors, Speed: 50 km/h
        echo  $this->brand."car "."with ". $this->numberOfDoors."and speed : ". $this->speed;
    }
}
$car = new Car("Toyota", 0, 4);
$car->accelerate(50);
echo $car->getInfo();
