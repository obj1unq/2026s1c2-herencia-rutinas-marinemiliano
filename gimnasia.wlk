import personas.*


class Rutina
{
        
    method descanso(_tiempo)
    
    method intensidad() 

    
    method cantidadCaloriasQuemadasEn(_tiempo) {
      
      return self.calculoCalorias(_tiempo)
    }


    method calculoCalorias(_tiempo) {
      
      return 100 * (_tiempo - self.descanso(_tiempo)) * self.intensidad()
    }

}

class Running inherits Rutina
{

    //intensidad es una clase abstracta a la
    //cual cada clase le setea lo propio
    const property intensidad

    override method descanso(_tiempo) {
      
      return if (_tiempo > 20) {

            5
        
      } else {
        
            2
      }
    }

}


class Maraton inherits Running
{
    override method cantidadCaloriasQuemadasEn(_tiempo) {
      
      return super(_tiempo) * 2
    }

}


class Remo inherits Rutina
{

    override method intensidad() = 1.3

    override method descanso(_tiempo) {return _tiempo / 5}
}


class Remo_Competicion inherits Remo
{

    var property tiempoRestadoExtra = 3 

    //100 * (tiempo - descanso) * intensidad
    override method intensidad() = 1.7

    override method descanso(_tiempo) {
        

        return (super(_tiempo) - self.evaluarTiempoExtra(_tiempo)).abs()
    
    }

    method evaluarTiempoExtra(_tiempo) {
      
        
        return 2.max(_tiempo).min(3) 
    }

}
