// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ICO is ERC20,Ownable{

   constructor() ERC20("Capsicum","CAPSI")
    {
        _mint(msg.sender, 1000000*(10**decimals()));
    }

    function mint(address account,uint amount) public onlyOwner returns(bool){
        require(account != address(this) && amount != uint256(0),"Token minting Invalid");
        _mint(account, amount);
        return true;
    }

    function burn(address account,uint amount) public onlyOwner returns(bool)
    {
        require(account!= address(this) && amount!= uint(0),"Token burning Invalid");
        _burn(account, amount);
        return true;
    }

    function buy() public payable returns(bool){
        require(msg.sender.balance >= msg.value && msg.value != 0 ether,"ICO: input entered exceeds user balance");
        uint amount = msg.value*1000;
        _transfer(owner(), _msgSender(), amount);
        return true;
    }

    function withdraw(uint amount)  public onlyOwner returns(bool)
    {
        require(amount <= address(this).balance,"ICO: Insufficent funds");
        payable(_msgSender()).transfer(amount);
        return true;
    }

}

