//SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract MappingExample {
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setAddress() public {
        myAddressMapping[msg.sender] = true;
    }

    // Double Mapping Example
    mapping(uint => mapping(uint => bool)) public uIntUintBoolMapping;
    
    function setUintUintBoolMapping(uint _index, uint _index2, bool _value) public {
        uIntUintBoolMapping[_index][_index2] = _value;
    }
}