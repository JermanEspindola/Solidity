pragma solidity >=0.4.4 <0.8.8;

contract ModificadoresFunciones {

    // Modificador view

    string[] lista_estudiantes;

    function nuevoAlumno(string memory _alumno) public {
        lista_estudiantes.push(_alumno);
    }

    function getAlumno(uint _posicion) public view returns(string memory) {
        return lista_estudiantes[_posicion];
    }

    uint x = 10;
    function sumTox(uint _a) public view returns(uint) {
        return x + _a;
    }

    
    // Modificador pure

    function potencia(uint _a, uint _b) public pure returns(uint) {
        return _a ** _b;
    }

    
    // Modificador payable

    mapping(address => billetera) saldoBilletera;

    struct billetera {
        string nombre;
        address direccion;
        uint saldo;
    }

    function pagar(string memory _nombre, uint _monto) public payable {
        billetera memory miBilletera;

        miBilletera = billetera(_nombre, msg.sender, _monto);
        saldoBilletera[msg.sender] = miBilletera;
    }

    function verSaldo() public view returns(billetera memory) {
        return saldoBilletera[msg.sender];
    }


}