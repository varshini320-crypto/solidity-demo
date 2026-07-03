// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    address public owner;
    mapping(address => uint) public balances;

    event Deposited(address indexed user, uint amount);
    event Withdrawn(address indexed user, uint amount);

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Must deposit > 0 ETH");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Not the owner");
        require(_amount > 0, "Amount must be > 0");
        require(balances[owner] >= _amount, "Insufficient balance");
        balances[owner] -= _amount;
        payable(owner).transfer(_amount);
        emit Withdrawn(owner, _amount);
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}