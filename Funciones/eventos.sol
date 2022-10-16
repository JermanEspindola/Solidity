pragma solidity >=0.4.4 <0.8.8;
pragma experimental ABIEncoderV2;

contract Eventos {

    // Declaramos los eventos a utilizar
    event evento1 (string _nombrePersona);
    event evento2 (string _nombrePersona, uint _edadPersona);
    event evento3 (string, uint, address, bytes32);
    event evento4 ();

    function emitirEvento1(string memory _nombrePersona) public {
        emit evento1(_nombrePersona);
    }

    function emitirEvento2(string memory _nombrePersona, uint _edadPersona) public {
        emit evento2(_nombrePersona, _edadPersona);
    }

    function emitirEvento3(string memory _nombrePersona, uint _edadPersona) public {
        bytes32 hash_id = keccak256(abi.encodePacked(_nombrePersona, _edadPersona, msg.sender));

        emit evento3(_nombrePersona, _edadPersona, msg.sender, hash_id);
    }

    function emitirEvento4() public {
        emit evento4();
    }

}