pragma solidity 0.7.0;

import "./Seguros.sol";

contract Clientes is Seguros{

    constructor(){}

    function contratarSeguro() public payable {
        require(msg.value == valorSeguroVida, "Valor insuficiente para contratacao");
        valorPendente[msg.sender] += msg.value;

    }

    function atualizarSeguro() public payable {
        valorPendente[msg.sender] += msg.value;
    }

    function verSeguro() public view returns (address) {
        return segurosVendidos[msg.sender];
    }

    function verValorPendente() public view returns (uint) {
        return valorPendente[msg.sender];
    }

    function verValorSegurado(address insuranceAddress) public view returns (uint) {
        return valorSegurado[insuranceAddress];
    }
}
