package cecs.pkg323.java.project;

import java.sql.*;
import java.util.Scanner;

/**
 *
 * @author Mimi Opkins with some tweaking from Dave Brown
 */
public class CECS323JavaProject {
    //  Database credentials
    static String USER;
    static String PASS;
    static String DBNAME;
    static final String JDBC_DRIVER = "org.apache.derby.jdbc.ClientDriver";
    static String DB_URL = "jdbc:derby://localhost:1527/";
//            + "testdb;user=";
/**
 * Takes the input string and outputs "N/A" if the string is empty or null.
 * @param input The string to be mapped.
 * @return  Either the input string or "N/A" as appropriate.
 */
    public static String dispNull (String input) {
        //because of short circuiting, if it's null, it never checks the length.
        if (input == null || input.length() == 0)
            return "N/A";
        else
            return input;
    }

    public static void mainMenu(Connection conn){
        Scanner in = new Scanner(System.in);
        
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String displayFormat = null;

        try {
            System.out.println("==========================");
            System.out.println("Main Menu");
            System.out.println("1. List all writing groups");
            System.out.println("2. List info for specific group");
            System.out.println("3. List all publishers");
            System.out.println("4. List info for specific publisher");

            String menuChoice = in.nextLine();

            switch(menuChoice){
                case "1":
                    pstmt = conn.prepareStatement(
                        "SELECT groupName, headWriter, yearFormed, subject FROM WritingGroup"
                    );
                    rs = pstmt.executeQuery();

                    displayFormat = "%-15s%-15s%-15s%-15s\n";

                    System.out.printf(displayFormat, "groupName", "headWriter", "yearFormed", "subject");
                    while (rs.next()) {
                        //Retrieve by column name
                        String groupName = rs.getString("groupName");
                        String headWriter = rs.getString("headWriter");
                        String yearFormed = rs.getString("yearFormed");
                        String subject = rs.getString("subject");

                        //Display values
                        System.out.printf(displayFormat, 
                                dispNull(groupName), dispNull(headWriter), dispNull(yearFormed), dispNull(subject));
                    }

                    mainMenu(conn);
                    break;
                case "2":
                    System.out.println("Enter group name:");
                    String desiredGroupName = in.nextLine();

                    pstmt = conn.prepareStatement(
                        "SELECT groupName, headWriter, yearFormed, subject FROM WritingGroup WHERE groupName = ?"
                    );
                    pstmt.setString(1, desiredGroupName);

                    rs = pstmt.executeQuery();

                    displayFormat = "%-15s%-15s%-15s%-15s\n";

                    System.out.printf(displayFormat, "groupName", "headWriter", "yearFormed", "subject");
                    while (rs.next()) {
                        //Retrieve by column name
                        String groupName = rs.getString("groupName");
                        String headWriter = rs.getString("headWriter");
                        String yearFormed = rs.getString("yearFormed");
                        String subject = rs.getString("subject");

                        //Display values
                        System.out.printf(displayFormat, 
                                dispNull(groupName), dispNull(headWriter), dispNull(yearFormed), dispNull(subject));
                    }
                    rs.close();
                    mainMenu(conn);
                    break;
                case "3":
                    pstmt = conn.prepareStatement(
                        "SELECT publisherName, publisherAddress, publisherPhone, publisherEmail FROM Publishers"
                    );
                    rs = pstmt.executeQuery();

                    displayFormat = "%-25s%-25s%-20s%-20s\n";

                    System.out.printf(displayFormat, "publisherName", "publisherAddress", "publisherPhone", "publisherEmail");
                    while (rs.next()) {
                        //Retrieve by column name
                        String publisherName = rs.getString("publisherName");
                        String publisherAddress = rs.getString("publisherAddress");
                        String publisherPhone = rs.getString("publisherPhone");
                        String publisherEmail = rs.getString("publisherEmail");

                        //Display values
                        System.out.printf(displayFormat, 
                                dispNull(publisherName), dispNull(publisherAddress), dispNull(publisherPhone), dispNull(publisherEmail));
                    }

                    mainMenu(conn);
                    break;
                case "4":
                    System.out.println("Enter publisher name:");
                    String desiredPublisherName = in.nextLine();

                    pstmt = conn.prepareStatement(
                        "SELECT publisherName, publisherAddress, publisherPhone, publisherEmail FROM Publishers WHERE publisherName = ?"
                    );
                    pstmt.setString(1, desiredPublisherName);
                    rs = pstmt.executeQuery();

                    displayFormat = "%-25s%-25s%-20s%-20s\n";

                    System.out.printf(displayFormat, "publisherName", "publisherAddress", "publisherPhone", "publisherEmail");
                    while (rs.next()) {
                        //Retrieve by column name
                        String publisherName = rs.getString("publisherName");
                        String publisherAddress = rs.getString("publisherAddress");
                        String publisherPhone = rs.getString("publisherPhone");
                        String publisherEmail = rs.getString("publisherEmail");

                        //Display values
                        System.out.printf(displayFormat, 
                                dispNull(publisherName), dispNull(publisherAddress), dispNull(publisherPhone), dispNull(publisherEmail));
                    }

                    mainMenu(conn);
                    break;
                default:
                    System.out.println("That did not match the menu options.");
                    mainMenu(conn);
                    return;
            }
            
            
            // pstmt.setBigDecimal(1, 153833.00)
            // pstmt.setInt(2, 110592)
            rs.close();
            pstmt.close();
        } catch (SQLException ex){};
    }
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("Name of the database (not the user account): ");
        DBNAME = in.nextLine();
        System.out.print("Database user name: ");
        USER = in.nextLine();
        System.out.print("Database password: ");
        PASS = in.nextLine();
        //Constructing the database URL connection string
        DB_URL = DB_URL + DBNAME + ";user="+ USER + ";password=" + PASS;

        Connection conn = null; //initialize the connection

        try {
            //STEP 2: Register JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL);

            mainMenu(conn);

            conn.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        
        

        System.out.println("Goodbye!");
    }//end main
}//end FirstExample}
