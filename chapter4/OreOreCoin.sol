pragma solidity ^0.5.0;

contract OreOreCoin {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping (address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor (uint256 _supply, string memory _name, string memory _symbol, uint8 _decimals) public{
        balanceOf[msg.sender] = _supply;
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _supply;
    }

    function transfer(address _to, uint256 _value) public payable{
        if (balanceOf[msg.sender] < _value) revert("value invalid");
        if (balanceOf[_to] + _value < balanceOf[_to]) revert("value invalid");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
    }
}