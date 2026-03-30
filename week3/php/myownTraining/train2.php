<?php
/*
### Exercise 5: Polymorphism with Animals
**Concepts**: Polymorphism, Method Overriding

Create an `Animal` class with:
- Protected property: `name`
- Method `makeSound()` - returns generic sound
- Method `introduce()` - returns name

Create `Dog`, `Cat`, `Bird` classes that override `makeSound()`:
- Dog: "Woof!"
- Cat: "Meow!"
- Bird: "Tweet!"

Create an array of different animals and loop through them.

```php
$animals = [new Dog("Rex"), new Cat("Whiskers"), new Bird("Tweety")];
foreach ($animals as $animal) {
    echo $animal->introduce() . " says " . $animal->makeSound();
}
*/
class Animal
{
    protected $name;
    function __construct($name)
    {
        $this->name = $name;
    }
    function makeSound() {}
    function introduce() {}
}
class Cat extends Animal{
    
}
class Dog extends Animal
{
    function makeSound()
    {
        echo "haw haw haw";
    }
    function introduce()
    {
        echo "I am " . $this->name;
    }
}
