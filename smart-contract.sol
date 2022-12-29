// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender; //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    }

    receive() external payable {
        balance += msg.value;
    }

    function withdraw(uint256 amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficient funds");
        destAddr.transfer(amount);
        balance -= amount;
    }
}
