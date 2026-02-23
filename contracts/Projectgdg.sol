// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JointFund {
    address public firstOwner;
    address public secondOwner;
    uint256 public releaseTime;
    bool public isFundReleased;

    
    struct WithdrawalConsent {
        bool firstOwnerConsent;
        bool secondOwnerConsent;
    }

    WithdrawalConsent public withdrawalConsent;

 
    mapping(address => bool) public isJointOwner;


    event FundsDeposited(address indexed sender, uint256 amount);
    event ConsentGiven(address indexed owner);
    event FundsReleased(address indexed to, uint256 amount);

    modifier onlyJointOwner(){
        require(isJointOwner[msg.sender],"Not a Joint Owner");
        _;
    }

   
    constructor(address _secondOwner, uint256 _releaseTime) {
        require(_secondOwner != msg.sender, "Owners must be different");
        require(_releaseTime > block.timestamp, "Release time must be in future");

        firstOwner = msg.sender;
        secondOwner = _secondOwner;
        releaseTime = _releaseTime;

        isJointOwner[firstOwner] = true;
        isJointOwner[secondOwner] = true;
    }

 
    receive() external payable {
        require(!isFundReleased, "Fund already released");
        require(!isFundReleased,"Already released");

        emit FundsDeposited(msg.sender,msg.value);
    }

    
    function giveWithdrawalConsent() public {
        require(isJointOwner[msg.sender], "Not a joint owner");
        require(!isFundReleased, "Fund already released");

        if (msg.sender == firstOwner) {
            require(!withdrawalConsent.firstOwnerConsent, "Already approved");
            withdrawalConsent.firstOwnerConsent = true;
        } else if (msg.sender == secondOwner) {
            require(!withdrawalConsent.secondOwnerConsent, "Already approved");
            withdrawalConsent.secondOwnerConsent = true;
        }
        emit ConsentGiven(msg.sender);
    }

   
    function releaseFunds() public {
    require(isJointOwner[msg.sender], "Not a joint owner");
    require(block.timestamp >= releaseTime, "Fund is still locked");
    require(
        withdrawalConsent.firstOwnerConsent &&
        withdrawalConsent.secondOwnerConsent,
        "Both owners must agree"
    );
    require(!isFundReleased, "Fund already released");

    uint256 balance = address(this).balance;
    require(balance > 0, "No funds");



    isFundReleased = true;

    (bool success, ) = firstOwner.call{value: address(this).balance}("");
    require(success, "Transfer failed");

    emit FundsReleased(firstOwner, balance);
}


    function getFundBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getRemainingLockTime() public view returns (uint256) {
        if (block.timestamp >= releaseTime) {
            return 0;
        }
        return releaseTime - block.timestamp;
    }

     
    function getTimeBreakdown()
        public
        view
        returns (
            uint256 daysRemaining,
            uint256 hoursRemaining,
            uint256 minutesRemaining,
            uint256 secondsRemaining
        )
    {
        uint256 remaining = getRemainingLockTime();

        daysRemaining = remaining / 86400;
        remaining = remaining % 86400;

        hoursRemaining = remaining / 3600;
        remaining = remaining % 3600;

        minutesRemaining = remaining / 60;
        secondsRemaining = remaining % 60;
    }

    
    function getVaultStatus()
        public
        view
        returns (
            uint256 balance,
            bool locked,
            bool firstApproved,
            bool secondApproved,
            bool released
        )
    {
        balance = address(this).balance;
        locked = block.timestamp < releaseTime;
        firstApproved = withdrawalConsent.firstOwnerConsent;
        secondApproved = withdrawalConsent.secondOwnerConsent;
        released = isFundReleased;
    }
}
