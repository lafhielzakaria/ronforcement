<?php
/*
### Exercise 6: Abstract Classes
**Concepts**: abstract, abstract methods
Create an abstract `Shape` class with:
- Abstract method `calculateArea()`
- Abstract method `calculatePerimeter()`
- Method `describe()` - returns shape info with area and perimeter

Create concrete classes:
- `Rectangle` (width, height)
- `Circle` (radius)
- `Triangle` (base, height, side1, side2, side3)

```php
$shapes = [
    new Rectangle(5, 10),
    new Circle(7),
    new Triangle(6, 8, 6, 8, 10)
];
foreach ($shapes as $shape) {
    echo $shape->describe();
}
*/
abstract class Shape{
 abstract function calculateArea ();
 abstract function calculatePerimeter ();
 function descripe(){}  
}