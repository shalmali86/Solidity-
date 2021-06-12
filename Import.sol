pragma solidity >=0.4.22 <0.9.0; // Compiler


import "./owned.sol"; // importing

contract test1   //contract
{

  uint val1; 
  string str;
  bytes b1;
  
  owned instance1;
  
  address owner;
  
  constructor()
  {
      instance1 = new owned();
  }
  
  function set(uint _val1, string memory _str, bytes memory _b1)
  public 
  
  {
      val1 = _val1;
      str  = _str;
      b1= _b1;
      instance1.changeOwner(msg.sender);
  }
  
  
  function get()
  view
  public 
  returns(uint, string memory, bytes memory)
  {
      return(val1, str, b1);
  }
    
}
