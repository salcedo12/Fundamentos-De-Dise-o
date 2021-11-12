abstract class Conexion {  
    Dato getDatos();
    void setDatos();
}

class DatabaseService implements Conexion {

    @override
     Dato getDatos() { }

    @override
     void setDatos() { }
}

class APIService implements Conexion{

    @override
     Dato getDatos() { }

    @override
     void setDatos() { }
}
      
      


class AccesoADatos {

     Conexion conexion;

     AccesoADatos(Conexion conexion){
        this.conexion = conexion;
    }

     getDatos(){
        conexion.getDatos();
    }
}

class Dato{}