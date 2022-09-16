//SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract MappingExampleWithdrawls {
    mapping(address => uint) public balanceReceived;

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // Checks, Effects, Interactions Pattern.
    // Details of pattern: https://fravoll.github.io/solidity-patterns/checks_effects_interactions.html
    function withdrawAllMoney(address payable _to) public {
        // Checks
        //require(balanceReceived[msg.sender] >= amount);
        uint balanceToSend = balanceReceived[msg.sender];

        // Effects
        balanceReceived[msg.sender] = 0;

        // Interactions
        _to.transfer(balanceToSend);
        // msg.sender.transfer(amount);
    }
}