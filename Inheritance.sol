// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract ownerContract{
    
    address public owner;
    
    constructor()
    public
    {
        owner = msg.sender;
    }
    
    modifier checkOwner(){
        require(owner == msg.sender);
        _;
    }
    
    function changeOwner(address _newOwner)
    checkOwner
    public 
    returns (bool)
    {
        owner = _newOwner;
    }
    
   
}

contract priceContract is ownerContract
{
 
 uint public price;
 
 
 function setPrice(uint _price)
 checkOwner
 public 
 returns (bool result)
 {
     price = _price;
     result = true;
 }
 
 
}


