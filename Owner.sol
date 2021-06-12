pragma solidity >=0.4.22 <0.9.0;
contract owned{
    
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
