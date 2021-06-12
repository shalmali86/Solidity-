pragma solidity >=0.4.22 <0.9.0;

contract IITH
{
    
    uint id;
    string name;
    bytes address1;
    
    
    
    address emp1;
    address public owner;
    
    constructor()
    {
      owner = msg.sender;    
    }
    
    
    function set(uint _id, string calldata _name)
    public
    {
    
    id = _id;
    name = _name;
        
    }
    
    function get()
    view
    public 
    returns (uint, string memory)
    {
       
       //id = 5;
       
          return (id, name);
    }
    
    
}
