// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

contract sampleToken {

address owner;
uint256 bal = 0;

modifier requireOwner {

    require(msg.sender == owner, "Only owner can access these functions.");
    _;

}

function setOwner() public {
    owner = msg.sender;
}

function setBalance(uint256 _bal) public requireOwner {
    bal += _bal;
    assert(_bal > 0);
}

function getBalance() public view requireOwner returns(uint256) {

    if (bal <= 0){
        revert("Address balance is empty");
    }else{
        return bal;
    }