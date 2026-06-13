import gimnasia.*


class Persona
{

    var property peso

    method tiempo() 

    method kilosPorCalorias() 

    method realizarRutina(_rutina) 
    {

        peso = self.formulaParaRutina(_rutina)
        
    }

    method formulaParaRutina(_rutina) {

      
       return self.peso() - 
                _rutina.cantidadCaloriasQuemadasEn(self.tiempo())

    }
    
    method validarSiPuede(_rutina) 

    method puedeRealizar(_rutina)

    method cartel(_rutina) 

}


class Persona_sedentaria inherits Persona
{

    const property tiempo  

    override method kilosPorCalorias() {return  7000} 
    //override method kilosPorCalorias() = 7000 

    override method realizarRutina(_rutina)
    {

        self.validarSiPuede(_rutina)

        peso = ( self.peso() - (_rutina.cantidadCaloriasQuemadasEn(self.  
        
                              tiempo()) / self.kilosPorCalorias())).truncate(3)

    }

    override method validarSiPuede(_rutina) {
      
      //no tiene porque tener un return ya que 
      //el self.error no procude valores
      if(not self.puedeRealizar(_rutina)) {
        
         self.error(self.cartel(_rutina))
      }
    }

    override method puedeRealizar(_rutina) {return self.peso() > 50}

    //aca si porque el metodo cartel devuelve algo 
    override method cartel(_rutina)
    {
        return  "No se puede realizar la rutina: " + _rutina
    }
    
}


class Persona_atleta inherits Persona
{

    //usa el getter de la superclase abstracta
    override method tiempo() = 90
  //override method tiempo() {return 90}

    override method kilosPorCalorias() {return  8000} 
  //override method kilosPorCalorias() = 8000 


    override method realizarRutina(_rutina)
    {


        self.validarSiPuede(_rutina)

        peso = (self.peso() - (_rutina.cantidadCaloriasQuemadasEn
        
                             (self.tiempo()) / self.kilosPorCalorias() - 1)).truncate(3)
    }

    override method validarSiPuede(_rutina) {
      
      
      //no tiene porque tener un return ya que 
      //el self.error no procude valores
      if(not self.puedeRealizar(_rutina)) {
        
         self.error(self.cartel(_rutina))
      }
    }

    override method puedeRealizar(_rutina) {
          
        
        return _rutina.cantidadCaloriasQuemadasEn(self.tiempo()) > 10000
    }

    //aca si porque el metodo cartel devuelve algo 
    override method cartel(_rutina)
    {
        return  "No se puede realizar la rutina: "
    }


}
