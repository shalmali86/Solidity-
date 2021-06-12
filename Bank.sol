pragma solidity 0.8.4;

contract Bank
{
    address public owner;

    // The balance of everyone
               // key  => value
    mapping (address => uint) public balances;

    mapping (address => bool) public blacklisted;

    modifier isOwner{
        require(msg.sender == owner);
        _;
    }
    modifier isBlackListed{
        if(blacklisted[msg.sender])
            return;
        _;
    }

    // Constructor 
    constructor() {
        owner = msg.sender;
        balances[msg.sender] = 1000000;
    }

    function blacklist(address _addr) 
    public
    isOwner
    {
       // if(msg.sender != owner)
         // return;
        blacklisted[_addr] = true;
        //blacklisted[_addr] = true;
    }
   
    function deposit(uint _amount, address _receiver) 
    public 
    {
        uint cbal;
        cbal = balances[_receiver];
        balances[_receiver] = cbal + _amount;
        
    } 

    function transfer(uint _amount, address _dest) 
    public 
    isOwner
    isBlackListed
    {                                                   
         //   return;
         //if(blacklisted[msg.sender])
           // return;
        if(balances[msg.sender] >= _amount) 
        {
            balances[msg.sender] -= _amount; 
            balances[_dest] += _amount; 
        }
    }
}




