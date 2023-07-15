//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
/*
The FLPNFT contract creates the Floppy NFT (built on ERC721) with the following attributes:
- Additional NFTs can be created using the createNFT function
- NFTs can be transferred using the transferNFT function
- NFTs can be transferred using the transferFrom function (extended from ERC721)
- NFTs can be approved using the approveNFT function
- NFTs can be retrieved using the getNFTURI function
*/
import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FLPNFT is ERC721URIStorage {
    using Counters for Counters.Counter;// using the Counters library from OpenZeppelin (Count number, assign id value to nft)
    Counters.Counter private _tokenIds;// tokenid counter
    Counters.Counter private _itemsSold;
    address public owner;// address of the contract creator
    string public NFT_url;// url of the NFT

    mapping(uint256 => uint256) public NFT_price;
    /*
        Constructor of the FLPNFT contract
    */
    constructor() ERC721("Floppy NFT", "FLPNFT") {
        owner = msg.sender;
    }
    /* 
        Create a new NFT with the specified url and mint it to the contract creator
        @param _NFT_url: url of the NFT
        @return newItemId: id of the newly created NFT
    */
    function createNFT(string memory _NFT_url) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, _NFT_url);

        return newItemId;
    }
    /*
        Approve the NFT with the specified id
        @param _tokenId: id of the NFT
        @param _to: address of the approved user
    */
    function approveNFT(uint256 _tokenId) public {
        approve(owner, _tokenId);
    }

    function getAllMyNft() public view returns (uint256[] memory) {
        uint256[] memory result = new uint256[](_tokenIds.current());
        uint256 counter = 0;
        for (uint256 i = 1; i <= _tokenIds.current(); i++) {
            if (ownerOf(i) == msg.sender) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }
    /* 
        Retrieve the url of the NFT with the specified id
        @param tokenId: id of the NFT
        @return tokenURI: url of the NFT
    */
    function getNFTURI(uint256 tokenId) public view returns (string memory) {
        return tokenURI(tokenId);
    }
    /*
        Transfer the NFT with the specified id to the specified address
        @param _to: address of the recipient
        @param _tokenId: id of the NFT
    */
    function transferNFT(address _to, uint256 _tokenId) public {
        safeTransferFrom(msg.sender, _to, _tokenId);
    }
}