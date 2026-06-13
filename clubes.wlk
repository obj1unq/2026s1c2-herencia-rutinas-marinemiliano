class Club
{
    const property predios = #{}

     method mejorPredioParaPersona(persona) {
        return predios.max({ predio => predio.totalCaloriasQuemadasEnRutinasPor(persona) })
    }


    method prediosTranquisDeUnClubPara(_persona) {

      return predios.filter({ predio => 
      
             predio.rutinasDeConMenosDe500Calorias(_persona)})

    }


    method rutinaMasExigentePara(_persona)
    {
        //el mapeo devuelve una lista no un conjunto
        return predios.map({predio => predio.rutinaMasExigentePara(_persona)})
    }
}


class Predio{

    const property rutinas = #{}

    method totalCaloriasQuemadasEnRutinasPor(_persona) {

        return rutinas.sum({rutina => rutina.cantidadCaloriasQuemadasEn(_persona.tiempo()) })
    }

    method rutinasDeConMenosDe500Calorias(_persona) {
      
      return rutinas.any({rutina => self.quemoMenosDe500CaloriasEn(rutina,_persona) })
    }

    method quemoMenosDe500CaloriasEn(_rutina,_persona)
    {

        return _rutina.cantidadCaloriasQuemadasEn(_persona.tiempo()) < 500 
    }


    method rutinaMasExigentePara(_persona) {
      
      return rutinas.max({rutina => rutina.cantidadCaloriasQuemadasEn(_persona.tiempo())})
    }


}