class DatabaseService{  
    //...
    void getDatos() {}
}

class AccesoADatos {

     DatabaseService  databaseService = DatabaseService();

     AccesoADatos(DatabaseService databaseService){
        this.databaseService = databaseService;
    }

    Dato getDatos(){
        databaseService.getDatos();
        //...
    }
}


class Dato{
}