//ex1
function nettoyer(tableau) {
    let clainTable = table.filter((num) => {
        if (num != undefined && num != null && num != '' && num != 0) {
            return num;
        }
    });
    let arrayWithoutDeplication = new Set(clainTable);
    console.log(arrayWithoutDeplication);
}
let table = [3, 1, 2, 1, 3, 0, '', 5, null, 2];
nettoyer(table);
//ex1 end
//ex2 start
function rotate(tableau, index) {
    //fuction katxd array okatraj3 element mol l'index howa lakhr les elements li3la limn katgibhom homa lowlin
    let selectedElement = array.find((element) => {
        if (array.indexOf(element) == index) {
            return element;
        }
    });
    for (let i = index + 1; i < array.length; i++) {
        if (array[i] == selectedElement){
            break;
        }
        let currentElement = array[i];
        array.splice(i, 1);
        // array.splice(0, 0,currentElement);
        array.unshift(currentElement);
        // i--;
        // array.unshift(currentElement);
    
    }
    // array.push(selectedElement);
    console.log("result"+array);
}
let array = [1,2,3,4,5];
rotate(array, 2);
//ex2 end
//ex3 start
function flatten(tableau) {
  let flattenArray = tableau.filter((element)=>{
   console.log("element"+element);
  });
  console.log(flattenArray);
}
let array2 = [1,[2,3],[4,[5,6]]];
flatten(array2);
//ex3 end