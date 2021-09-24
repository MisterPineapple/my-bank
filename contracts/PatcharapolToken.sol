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
}
