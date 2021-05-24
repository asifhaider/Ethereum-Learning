// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
  //add minter variable (of address data type)
  address public minter;

  //add minter changed event
  event MinterChanged(address indexed from, address to);  // wtf it does?

  constructor() public payable ERC20("Decentralized Bank Currency", "DCB") {
    //asign initial minter
    minter = msg.sender;
  }

  //Add pass minter role function
  function passMinterRole(address dBank) public returns(bool) {
    require(msg.sender == minter, 'Error, msg.sender does not have minter role!');  // if every argument inside this function is true only then it'll be executed
    minter = dBank;

    emit MinterChanged(msg.sender, dBank);  // wtf it does?
    return true; 
  }

  //This function is responsible for creating tokens 
  function mint(address account, uint256 amount) public {
    //check if msg.sender have minter role
    require(msg.sender == minter, 'Error, msg.sender does not have minter role!');  // if every argument inside this function is true only then it'll be executed

		_mint(account, amount);
	}
}