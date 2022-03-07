pragma solidity ^0.5.0;

contract Tether {
    string public name = 'Fake Tether';
    string public symbol = 'mUSDT';
    uint256 public totalSupply = 1000000000000000000000000; // 1 million tokens
    uint8 public decimals = 18;
    
    mapping (address => uint256) public balanceOf;
    mapping(address => mapping (address => uint256)) public allowance;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint indexed _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint _value
    );


    constructor(){
        balanceOf[msg.sender] = totalSupply
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        require(balanceOf[msg.sender] >= _value);
        balanceOf(msg.sender) -= value;
        balanceOf[_to] += value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_value <= balanceOf[_from]);
        require(_value <= balanceOf[_from][msg.sender]);
        balanceOf[_to] += value;
        balanceOf[_from] -= value;
        allowance[msg.sender][_from] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}