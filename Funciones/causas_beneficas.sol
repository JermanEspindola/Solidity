pragma solidity >=0.4.4 <0.8.8;

contract CausasBeneficas {

    struct causa {
        uint id;
        string nombre;
        uint montoObjetivo;
        uint montoRecaudado;
    }

    uint contadorCausas = 0;
    mapping(string => causa) causas;

    // Esta función permite dar de alta una nueva causa
    function agregar(string memory _nombre, uint _montoObjetivo) public payable {
        contadorCausas += 1;
        causas[_nombre] = causa(contadorCausas, _nombre, _montoObjetivo, 0);

    }

    // Esta función nos permite donar a una causa
    function donar(string memory _nombreCausa, uint _montoDonacion) public payable returns(bool) {
        bool aceptaDonacion = false;

        if (causas[_nombreCausa].montoRecaudado < causas[_nombreCausa].montoObjetivo) {
            causas[_nombreCausa].montoRecaudado += _montoDonacion;
            aceptaDonacion = true;
        }

        return aceptaDonacion;
    }

    // Esta función indica si se ha alcanzado el monto objetivo
    function comprobar(string memory _nombreCausa) public view returns(bool, uint) {
        bool objetivoCumplido = false;

        if (causas[_nombreCausa].montoRecaudado >= causas[_nombreCausa].montoObjetivo) {
            objetivoCumplido = true;
        }

        return (objetivoCumplido, causas[_nombreCausa].montoRecaudado);
    }

}