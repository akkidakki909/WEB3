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
    //Functions
    //"Functions" or "methods" execute a subset of code when called
    function store(int _fanum) public//here we created a function called store , int_favnum is the variable that gets passed into this fn, public means the fn is public
       {fanum= _fanum;
       
       }
}