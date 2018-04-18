/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect4;

/**
 *
 * @author Luigi
 */
public class TareaIA {
    public static int nivel;
    public TareaIA(int niv){
        nivel = niv;
    }
    
    public String matJavaLisp(int[][] matriz){
        StringBuilder sb = new StringBuilder();
        
        for(int i = 0; i < 6; i++){
            sb.append("(");
            for(int j = 0; j < 7; j++){
                
                int aux = matriz[i][j];
                
                if(aux == 0)
                    sb.append("a ");
                else if (aux == 1)
                    sb.append("r ");
                else
                    sb.append("nil ");
            }
            sb.append(")");
        }
        
        sb.insert(0, "(");
        sb.append(")");
        sb.insert(0, "(setq tableroIni (make-array '(6 7) :initial-contents " +
"	'");
        sb.append("))");
        //sb.append("(print tableroIni)");
        sb.append("(setq depth "+nivel+")");
        sb.append("(print depth)");
        
        return sb.toString();
    }
    
}
