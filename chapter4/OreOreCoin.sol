pragma solidity ^0.5.0;

contract OreOreCoin {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping (address => uint256) public balanceOf;
    mapping (address => int8) blackList;
    address public owner;

    modifier onlyOwner() { 
        require(msg.sender == owner, "this function can invoke contract owner!"); 
        // "_;" 를 깜빡하지 마세요! 수정자가
        // 사용 될 때, "_;"가 실제 함수
        // 본문으로 대체됩니다.
        _; 
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Blacklisted(address indexed target);
    event DeleteFromBlacklist(address indexed target);
    event RejectedPaymentToBlacklistedAddr(address indexed from, address indexed to, uint256 value);
    event RejectedPaymentFromBlacklistAddr(address indexed from, address indexed to, uint256 value);

    constructor (uint256 _supply, string memory _name, string memory _symbol, uint8 _decimals) public{
        balanceOf[msg.sender] = _supply;
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _supply;
        owner = msg.sender;
    }

    function blacklisting(address _addr) public onlyOwner {
        blackList[_addr] = 1;
        emit Blacklisted(_addr);
    }

    function deleteFromBlacklist(address _addr) public onlyOwner {
        blackList[_addr] = -1;
        emit DeleteFromBlacklist(_addr);
    }

    function transfer(address _to, uint256 _value) public payable{
        if (balanceOf[msg.sender] < _value) revert("value invalid");
        if (balanceOf[_to] + _value < balanceOf[_to]) revert("value invalid");

        if (blackList[msg.sender] > 0) {
            emit RejectedPaymentFromBlacklistAddr(msg.sender, _to, _value);
        } else if (blackList[_to] > 0){
            emit RejectedPaymentToBlacklistedAddr(msg.sender, _to, _value);
        } else {

            balanceOf[msg.sender] -= _value;
            balanceOf[_to] += _value;
            emit Transfer(msg.sender, _to, _value);
        }
    }
}