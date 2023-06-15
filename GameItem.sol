// This is a Solidity file
// It imports the ERC721 and ERC721URIStorage contracts from OpenZeppelin
// It also imports the Counters and Ownable contracts from OpenZeppelin
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// This is the GameItem contract which inherits from ERC721URIStorage and Ownable
contract GameItem is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // Constructor function which sets the name and symbol of the token
    constructor() ERC721("GameItem", "ITM") {}

    // Function to award an item to a player
    // Only the owner of the contract can call this function
    function awardItem(
        address player,
        string memory tokenURI
    ) public onlyOwner returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}
