// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract InvoiceNFT is ERC721, ERC721URIStorage, ERC721Burnable, Ownable{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    address manager;
    mapping (uint256=>uint256) public face_val;
    mapping (uint256=>string) public SO;
    //Tax Invoice will have a unique id from Income Tax department
    mapping (uint256=>string) public GST_NO;
    constructor() ERC721("InvoiceToken", "INV"){
       manager = msg.sender;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://centralrepo.xyz/";
    }

    function safeMint(address to, string memory uri, uint256 _face_val, string memory _SO, string memory _GST) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        face_val[tokenId]=_face_val;
        SO[tokenId]=_SO;
        GST_NO[tokenId]=_GST; 
    }

    function safeDeposit(address _to, uint256 _tokenid) public {
        safeTransferFrom(ownerOf(_tokenid), _to, _tokenid);
    }
    function getFaceValue(uint256 _tokenid) public view returns (uint256){
        return face_val[_tokenid];
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }


}