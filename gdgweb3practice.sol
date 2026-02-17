//SPDX-License-Identifier: MIT
pragma solidity >=0.8.7; //stating that the version will be greater than or equal to 0.8.7
//ctrl+s saves and compiles the code

contract SimpleStorage//contract is a keyword in solidity and tells the compiler that the next section of the code will define the contract 
{
    //boolean(true/false),uint(unsigned integer),int(integer),address(wallet address),bytes are primitive data types
    bool hasfavnum=true;//hasfavnum is a variable
    uint favnum=123;
    uint fanum; //here fanum gets initialised to zero
    string favnumit="five";
    address akkiadd = 0x1066618d0973e44EfD2Fe5114fD18b64c6420AbB;
    bytes32 favbytes="cat" ; 
    
    //the scope of these variables is global because they are outside the function
    //scope of variables inside function is local


    //Functions
    //"Functions" or "methods" execute a subset of code when called
    function store(uint _fanum) public//here we created a function called store , int_fanum is the variable that gets passed into this fn, public means the fn is public
    {favnum= _fanum;

       }//the more things you do in a function, the more gas is used up

//4 types of visibility specifiers for functions
//public,private,external,internal
//the default visibility is internal


function retrieve() public view returns(uint256){// returns(uint256) specifies that the function retrieve will return uint256 format number
    return favnum;
 }
 
 // view and pure functions,when called alone ,don't spend gas because they disallow modification of state
//purpose of view:Declares a function that reads state variables from the blockchain but does not modify them.
//purpose of pure: Declares a function that doesn't read from or write to the blockchain's state.
//if a gas calling function calls a view or pure function-only then will it cost gas

 
uint256 public favoriteNumber;//type of object,visibility,variable name
People public person=People({favoriteNumber:2,name:"Patrick"});


struct People{ //using structure to store multiple fields of data for many people   
    uint256 favoriteNumber;
    string name;
 } 


//an array stores a list of data objects
People[] public people;//type of object(here array),visibility,variable name
//here people[] array is dynamic array as size is not mentioned beforehand
//hence people[n] array is fixed size array where n belongs to natural number


function addperson(string memory _name,uint256 _favoriteNumber) public{
    People memory newPerson = People({favoriteNumber: _favoriteNumber,name: _name});
    people.push(newPerson);
 }
 //alternative
 function addperson(string memory _name,uint256 _favnum) public {
    people.push(People(_favnum,_name));
    nametofavnum[_name]=_favnum;
 }
//the keyword memory is used to specify that a variable or data structure (like an array or struct) should be stored temporarily in the Ethereum Virtual Machine (EVM) during the execution of a function. 
//there are 6 types of data location:(evm can access and store info in 6 places
//1.Stack
//2.Memory:temporary variables that can be modified
//3.Storage : permanent variables that can be modified
//4.Calldata:temporary variables that cannot be modified
//5.Code
//6.Logs

// data location can only be specified for array,struct or mapping types
//hence we need memory keyword at _name and not at _favnum


//warnings appear in yellow numbers, they dont stop your code from working but it's usually a good idea to check them out
mapping(string => uint256) public nametofavnum;
}