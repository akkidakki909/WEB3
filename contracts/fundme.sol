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

    function getPrice() public{
        //ABI
        //Address 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
    }
    
    //function getVersion() public view returns (uint256){
      // AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
      // return priceFeed.version();
   // }
        function getConversionRate()public{}
    }