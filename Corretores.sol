pragma solidity 0.7.0;
pragma experimental ABIEncoderV2;

import "./Clientes.sol";

contract Corretores is Clientes{

    struct Cliente{
        string nome;
        uint idade;
        string email;
        address account;
    }
    Cliente[] segurados;

    constructor() {}

    function cadastrarCliente(string memory name, uint age, string memory mail, address clientAccount, address insuranceAddress) public {
        Cliente memory novoCliente = Cliente(name, age, mail, clientAccount);
        segurados.push(novoCliente);
        valorSegurado[insuranceAddress] = valorPendente[clientAccount];
        valorPendente[clientAccount] = 0;
        segurosVendidos[clientAccount] = insuranceAddress;
    }

    function atualizarCliente(address clientAccount, address insuranceAddress) public {
        valorSegurado[insuranceAddress] += valorPendente[clientAccount];
        valorPendente[clientAccount] = 0;
    }

    function acionarSeguroCliente(address payable clientAccount, address insuranceAddress) public payable {
        clientAccount.transfer(valorSegurado[insuranceAddress]);
        valorSegurado[insuranceAddress] = 0;
    }

    function verClientes() public view returns (Cliente[] memory){
        return segurados;
    }
}
