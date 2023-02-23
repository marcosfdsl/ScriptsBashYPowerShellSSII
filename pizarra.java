import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files

public class pizarra {

	public static final String ANSI_RED = "\u001B[31m";
	public static final String ANSI_GREEN = "\u001B[32m";
	public static final String ANSI_YELLOW = "\u001B[33m";
	public static final String ANSI_RESET = "\u001B[0m";
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		 try {
		      File myObj = new File(args[0]);
		      Scanner myReader = new Scanner(myObj);
		      
		      switch(args[1].toUpperCase().charAt(0)) {
				case 'R':
					System.out.println(ANSI_RED);
					break;
				case 'G':
					System.out.println(ANSI_GREEN);
					break;
				case 'Y':
					System.out.println(ANSI_YELLOW);
					break;
				default:
					System.out.println("No color");
					break;
		      }
		      while (myReader.hasNextLine()) {
		        String data = myReader.nextLine();
		        System.out.println(data);
		      }
		      System.out.println(ANSI_RESET);
		      myReader.close();
		    } catch (FileNotFoundException e) {
		      System.out.println("This file cannot be read.");
		      e.printStackTrace();
		    }
	}

}
