pragma solidity ^0.5.0;

contract SelfDestructSample {
    address payable owner = msg.sender;

    function () external payable {}

    function close() public{
        if (owner != msg.sender) revert();
        selfdestruct(owner);
    }

    function Balance() public view returns (uint) {
        return address (this).balance;
    }
}