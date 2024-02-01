//SPDX-License-Identifier: MIT

pragma solidity  >=0.5.0 < 0.9.0;
contract Vulnerable{
    address winner;
     uint constant public tokensPerEth = 10; 
    uint constant public weiPerEth = 1e18;
    mapping(address => uint) public balances;
   
    

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public{
        
       
        uint bal = balances[msg.sender];
        require(bal >0);

        (bool sent,) = msg.sender.call{value : bal}("");
        require(sent, "Failed to send Ether");

        balances[msg.sender] = 0;
        
    }
    function buyTokens() public payable  {
        uint tokens = msg.value/weiPerEth*tokensPerEth; // convert wei to eth, then multiply by token rate
        balances[msg.sender] += tokens; 
    }
    
    function sellTokens(uint tokens) public {
        require(balances[msg.sender] >= tokens);
        uint eth = tokens/tokensPerEth; 
        balances[msg.sender] -= tokens;
        payable(msg.sender).transfer(eth*weiPerEth); //
    }

    function winnerCheck(uint value) external {
    if (value == block.timestamp%2) 
    {
      winner=msg.sender;
    }
  }
}