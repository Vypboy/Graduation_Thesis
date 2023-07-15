//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
/*
The Floppy contract creates the FLP token (built on ERC20)
*/
import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Floppy is ERC20("Floppy", "FLP"), Ownable {
    uint256 private cap = 50_000_000_000 * 10**uint256(18);
    /**
     * Construct
     * Initialize and donate 1 amount of tokens to owner
     */
    constructor(){
        console.log("owner: %s", msg.sender);
        _mint(msg.sender, cap);
        transferOwnership(msg.sender);
    }
    /**
     * mint for owner a amount of tokens
     * @param _to address of the minter
     * @param _amount amount of tokens
     */
    function mint(address _to, uint256 _amount) public onlyOwner {
        require(
            ERC20.totalSupply() + _amount <= cap,
            "FloppyToken: cap exceeded"
        );
        _mint(_to, _amount);
    }
    /**
     * transfer tokens to receiver's address
     * @param _to address of the receiver
     * @param _amount amount of tokens
     */
    function transfer(
        address _to,
        uint256 _amount
    ) public override returns (bool) {
        console.log("balanceOf: %s", ERC20.balanceOf(_to));
        console.log("amount: %s", _amount);
        console.log("cap: %s", cap);
        return super.transfer(_to, _amount);
    }
}