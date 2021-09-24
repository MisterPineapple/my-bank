pragma solidity >=0.8.7;

import "../openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "../openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";

/**
 * @title Patcharapol Token
 * @dev Very simple ERC20 Token example, where all 1000000 tokens are pre-assigned to the creator.
 */
contract PatcharapolToken is ERC20, ERC20Detailed {
    // modify token name
    string public constant NAME = "Patcharapol Token";
    // modify token symbol
    string public constant SYMBOL = "PTOKEN";
    // modify token decimals
    uint8 public constant DECIMALS = 18;
    // modify initial token supply
    uint256 public constant INITIAL_SUPPLY = 1000000 * (10 ** uint256(DECIMALS)); // 1000000 tokens

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */
    constructor () public ERC20Detailed(NAME, SYMBOL, DECIMALS) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    uint8 private clientCount;
    mapping (address => uint) private balances;
    address public owner;

  // Log the event about a deposit being made by an address and its amount
    event LogDepositMade(address indexed accountAddress, uint amount);

    // Constructor is "payable" so it can receive the initial funding of 0.002, 
    // required to reward the first 3 clients
    constructor() public payable {
        require(msg.value == INITIAL_SUPPLY , "1000000 PTOKEN initial funding required");
        /* Set the owner to the creator of this contract */
        owner = msg.sender;
        clientCount = 0;
    }

    /// @notice Enroll a customer with the bank, 
    /// giving the first 3 of them 10 ether as reward
    /// @return The balance of the user after enrolling
    function enroll() public returns (uint) {
        if (clientCount < 3) {
            clientCount++;
            balances[msg.sender] = 1000 ;
        }
        return balances[msg.sender];
    }

    /// @notice Deposit ether into bank, requires method is "payable"
    /// @return The balance of the user after the deposit is made
    function deposit() public payable returns (uint) {
        balances[msg.sender] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        return balances[msg.sender];
    }

    /// @notice Withdraw ether from bank
    /// @return remainingBal - The balance remaining for the user 
    function withdraw(uint withdrawAmount) public returns (uint remainingBal) {
        // Check enough balance available, otherwise just return balance
        if (withdrawAmount <= balances[msg.sender]) {
            balances[msg.sender] -= withdrawAmount;
            payable(msg.sender).transfer(withdrawAmount);
        }
        return balances[msg.sender];
    }

    /// @notice Just reads balance of the account requesting, so "constant"
    /// @return The balance of the user
    function balance() public view returns (uint) {
        return balances[msg.sender];
    }

    /// @return The balance of the Simple Bank contract
    function depositsBalance() public view returns (uint) {
        return address(this).balance;
    }
}
