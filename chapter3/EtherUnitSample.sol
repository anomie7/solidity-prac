pragma solidity ^0.5.0;

contract EtherUnitSample{
    function() external payable {}
    
    function getEther() public payable returns (uint _wei, uint _szabo, uint __finney, uint _ether) {
        uint amount = address (this).balance;
        _wei = amount / 1 wei;
        _szabo = _wei / 1 szabo;
        __finney = _wei / 1 finney;
        _ether = _wei / 1 ether;
    }
}