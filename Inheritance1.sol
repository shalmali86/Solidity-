// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

contract ownerContract{
    
    address public owner;
    
   /* constructor()
    public
    {
        owner = msg.sender;
    } */
    
    modifier checkOwner(){
        require(owner == msg.sender);
        _;
    }
    
    function changeOwner(address _newOwner)
    checkOwner
    public 
    returns (bool result)
    {
        owner = _newOwner;
        result = true;
        
    }
    
   
}

contract priceContract is ownerContract
{
 
 uint public price;
 constructor(address _newOwner)
    public
    {
        owner = _newOwner;
    }
    
 
 function setPrice(uint _price)
 checkOwner
 public 
 returns (bool result)
 {
     price = _price;
     result = true;
 }
 
 
}

contract priceContractFactory is ownerContract
{
   priceContract tempContract;
   uint256 public Ctr;
   
   mapping (address => TempStruct) public priceContracts; 
   mapping (uint => address) public InvMap;
   struct TempStruct{
       string name;
       uint Counter;
   }
    constructor(address _newOwner)
    public
    {
        owner = _newOwner;
    }
    
    function createpriceContract(string memory _str)
    checkOwner
    public
    {
        tempContract = new priceContract(owner);
        Ctr = Ctr + 1;
        InvMap[Ctr] = address(tempContract);
        priceContracts[address(tempContract)] = TempStruct(_str, Ctr); //Key => (str, ctr)
        
    }
}
