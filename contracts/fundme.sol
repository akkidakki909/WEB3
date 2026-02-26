//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract fundme{
    uint256 public minimumUsd=50;
    function fund() public payable{
        //Want to be able to set a minimum fund amount in USD 
        //1.How do we send ETH to this contract?
        require(msg.value>= minimumUsd, "Didn't send enough");//1e18==1*10**18==1000000000000000000
        //what is reverting?
        //undo any action before, and send remaining gas back 
    }
}