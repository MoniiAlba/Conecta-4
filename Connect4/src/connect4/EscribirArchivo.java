/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect4;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 *
 * @author Luigi
 */
public class EscribirArchivo {
    
    private static final String FILENAME = "matriz.txt";
    public int [][] megaMatriz;
    
    
    
    public EscribirArchivo(){
        megaMatriz = new int [6][7];
    }
    
    public EscribirArchivo(int [][] nuevaMat){
        megaMatriz = nuevaMat;
    }
    
    public void creaArchivo(){
        TareaIA t = new TareaIA();
        
        BufferedWriter bw = null;
	FileWriter fw = null;
        
        
        try {

		String content = t.matJavaLisp(megaMatriz);

		fw = new FileWriter(FILENAME);
		bw = new BufferedWriter
                 (new OutputStreamWriter(new FileOutputStream(FILENAME), StandardCharsets.UTF_8));

		bw.write(content);

		System.out.println("Done");

		} catch (IOException e) {

                    e.printStackTrace();

		} finally {

			try {

				if (bw != null)
					bw.close();

				if (fw != null)
					fw.close();

			} catch (IOException ex) {

				ex.printStackTrace();

			}

		}

    
    
    System.out.println(t.matJavaLisp(megaMatriz));
    }

    
    
    
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        TareaIA t = new TareaIA();
        
        BufferedWriter bw = null;
	FileWriter fw = null;
        
        int[][] mat = new int [6][7];
    
        mat[0][0]=1;
        mat[0][1]=1;
        mat[1][3]=1;
        mat[2][2]=2;
        mat[4][5]=-1;

	try {

		String content = t.matJavaLisp(mat);

		fw = new FileWriter(FILENAME);
		bw = new BufferedWriter
                 (new OutputStreamWriter(new FileOutputStream(FILENAME), StandardCharsets.UTF_8));

		bw.write(content);

		System.out.println("Done");

		} catch (IOException e) {

                    e.printStackTrace();

		} finally {

			try {

				if (bw != null)
					bw.close();

				if (fw != null)
					fw.close();

			} catch (IOException ex) {

				ex.printStackTrace();

			}

		}

    
    
    System.out.println(t.matJavaLisp(mat));

    }
    
    
}
