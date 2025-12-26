//SPDX-License-Identifier: MIT
pragma solidity >=0.8.7; //stating that the version will be greater than or equal to 0.8.7
//ctrl+s saves and compiles the code
contract SimpleStorage//contract is a keyword in solidity and tells the compiler that the next section of the code will define the contract 
{
    //boolean(true/false),uint(unsigned integer),int(integer),address(wallet address),bytes are primitive data types
    bool hasfavnum=true;//hasfavnum is a variable
    uint favnum=123;
    int fanum;
    string favnumit="five";
    address akkiadd = 0x1066618d0973e44EfD2Fe5114fD18b64c6420AbB;
    //the scope of these variables is global because they are outside the function
    //scope of variables inside function is local
    //Functions
    //"Functions" or "methods" execute a subset of code when called
    function store(int _fanum) public//here we created a function called store , int_favnum is the variable that gets passed into this fn, public means the fn is public
       {fanum= _fanum;

       }
//4 types of visibility specifiers for functions
//public,private,external,internal
function retrieve() public view returns(uint){
    return favnum;
 }// view and pure functions,when called alone ,don't spend gas
//purpose of view:Declares a function that reads state variables from the blockchain but does not modify them.
//purpose of pure: Declares a function that doesn't read from or write to the blockchain's state.
//if a gas calling function calls a view or pure function-only then will it cost gas
uint256 public favoriteNumber;//type of object,visibility,variable name
People public person=People({favoriteNumber:2,name:"Patrick"});
struct People{ //using structure to store multiple fields of data for many people    uint256 favoriteNumber;
    uint256 favoriteNumber;
    string name;
 }
//an array stores a list of data objects
People[] public people;//type of object(here array),visibility,variable name
function addperson(string memory _name,uint256 _favoriteNumber) public{
    People memory newPerson = People({favoriteNumber: _favoriteNumber,name: _name});
    people.push(newPerson);
 }
}
