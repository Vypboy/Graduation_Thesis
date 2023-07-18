//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CropInfoContract {
    struct Crop {
        uint256 cropId;
        string cropType;
        uint256 plantingDate;
        uint256 harvestDate;
        string fertilizers;
        string pesticides;
        // Thêm các thông tin khác về cây trồng tùy thuộc vào yêu cầu của bạn
    }

    mapping(uint256 => Crop) public crops;
    uint256 public cropCount;

    function addCropInfo(string memory _cropType, uint256 _plantingDate, uint256 _harvestDate, string memory _fertilizers, string memory _pesticides) public {
        cropCount++;
        crops[cropCount] = Crop(cropCount, _cropType, _plantingDate, _harvestDate, _fertilizers, _pesticides);
    }
}