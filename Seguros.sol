pragma solidity 0.7.0;

contract Seguros {

    uint valorSeguroVida = 0.001 ether;
    mapping (address => address) segurosVendidos;
    mapping (address => uint) valorPendente;
    mapping (address => uint) valorSegurado;
}
