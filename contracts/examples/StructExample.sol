//SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract Wallet {

    PaymentReceived public payment;

    function PayContract() public payable {
        payment = new PaymentReceived(msg.sender, msg.value);
    }
}

contract PaymentReceived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}

contract PaymentReceived2 {
    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }
}

// Preferred options below because of the gas cost savings.
contract Wallet2 {
    // Good to save costs on gas when using structs.
    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }

    PaymentReceivedStruct public payment;

    function payContract() public payable {
        //payment = PaymentReceivedStruct(msg.sender, msg.value);
        // OR
        payment.from = msg.sender;
        payment.amount = msg.value;
    }
}

contract Wallet3 is PaymentReceived2 {
    PaymentReceivedStruct public payment;

    function payContract() public payable {
        //payment = PaymentReceivedStruct(msg.sender, msg.value);
        // OR
        payment.from = msg.sender;
        payment.amount = msg.value;
    }
}