//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract SensorDataContract {
    struct SensorData {
        uint256 cropId;
        uint256 timestamp;
        uint256 temperature;
        uint256 humidity;
        uint256 lightIntensity;
        // Thêm các dữ liệu cảm biến khác tùy thuộc vào yêu cầu của bạn
    }

    mapping(uint256 => SensorData[]) public cropSensorData;

    function addSensorData(uint256 _cropId, uint256 _temperature, uint256 _humidity, uint256 _lightIntensity) public {
        uint256 timestamp = block.timestamp;
        SensorData memory newData = SensorData(_cropId, timestamp, _temperature, _humidity, _lightIntensity);
        cropSensorData[_cropId].push(newData);
    }
}