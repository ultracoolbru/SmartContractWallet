//SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract MappingExample {
    mapping(uint => bool) public myMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }
}