// - Guilherme Draghetti
// - Marcelo Azevedo
// - Paulo Aranha
// - Thomas Pozzer

class {:autocontracts} Set {

    var content:array<nat>;

    var qtd:nat;
    
    ghost var mirror:set<nat>;
    
    predicate Valid()   
    reads this;   
    {
      content.Length >= 0    
    }

    constructor(size:nat)
    ensures Valid();
    { 
      content := new nat[size];
      qtd := 0;
    }

    method Add(element:nat) returns(success: bool)
    requires qtd < content.Length
    ensures success == true ==> qtd == old(qtd) + 1 
    ensures success == false ==> qtd == qtd
    ensures success == false ==> old(content) == content
    //conteudo mais elemento
    {
      var i := 0;
      success := true;
      if qtd >= content.Length {
        success := false;
      }else{
        while(i < qtd){
          if(content[i] == element){
            success := false;    
          }  
          i := i + 1;
        }

        if(success){
          content[qtd] := element;
          qtd := qtd + 1;
          // mirror :=  new set<nat>[0..content.Length
        }
      }
    }

    method Remove(element:nat) returns(success: bool)
    requires qtd > 0;
    requires content.Length > 0;
    ensures success == true ==> qtd == old(qtd) - 1
    ensures success == false ==> old(content) == content
    {
      var i := 0;
      success := false;
      if( element in content){
        
      }
    }
}

method Main(){

}