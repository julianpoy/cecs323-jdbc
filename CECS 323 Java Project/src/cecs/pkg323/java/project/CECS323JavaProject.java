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
        //Our input scanner
        Scanner in = new Scanner(System.in);
        
        //Initialize shared variables
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String displayFormat = null;

        try {
            //Print out main menu options
            System.out.println("\n\n==========================");
            System.out.println("Main Menu");
            System.out.println("1. List all writing groups");
            System.out.println("2. List info for specific group");
            System.out.println("3. List all publishers");
            System.out.println("4. List info for specific publisher");
            System.out.println("5. List all books");
            System.out.println("6. List info for specific book");
            System.out.println("7. Create a new book");
            System.out.println("8. Create a new publisher");
            System.out.println("9. Remove a book");

            System.out.println("10. Quit");

            String menuChoice = in.nextLine();
            //Add a line break
            System.out.println("");

            switch(menuChoice){
                case "1":
                    pstmt = conn.prepareStatement(
                        "SELECT groupName, headWriter, yearFormed, subject FROM WritingGroup"
                    );
                    rs = pstmt.executeQuery();

                    displayFormat = "%-30s%-15s%-15s%-15s\n";

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

                    displayFormat = "%-30s%-15s%-15s%-15s\n";

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
                case "5":
                    pstmt = conn.prepareStatement(
                        "SELECT groupName, bookTitle, publisherName, yearPublished, numberPages FROM Books"
                    );
                    rs = pstmt.executeQuery();

                    displayFormat = "%-35s%-40s%-35s%-20s%-10s\n";

                    System.out.printf(displayFormat, "groupName", "bookTitle", "publisherName", "yearPublished", "numberPages");
                    while (rs.next()) {
                        //Retrieve by column name
                        String groupName = rs.getString("groupName");
                        String bookTitle = rs.getString("bookTitle");
                        String publisherName = rs.getString("publisherName");
                        String yearPublished = rs.getString("yearPublished");
                        String numberPages = rs.getString("numberPages");

                        //Display values
                        System.out.printf(displayFormat, 
                                dispNull(groupName),
                                dispNull(bookTitle),
                                dispNull(publisherName),
                                dispNull(yearPublished),
                                dispNull(numberPages));
                    }

                    mainMenu(conn);
                    break;
                case "6":
                    System.out.println("Enter book title:");
                    String desiredBookTitle = in.nextLine();

                    pstmt = conn.prepareStatement(
                        "SELECT groupName, bookTitle, publisherName, yearPublished, numberPages FROM Books WHERE bookTitle = ?"
                    );
                    pstmt.setString(1, desiredBookTitle);
                    rs = pstmt.executeQuery();

                    displayFormat = "%-35s%-40s%-35s%-20s%-10s\n";

                    System.out.printf(displayFormat, "groupName", "bookTitle", "publisherName", "yearPublished", "numberPages");
                    while (rs.next()) {
                        //Retrieve by column name
                        String groupName = rs.getString("groupName");
                        String bookTitle = rs.getString("bookTitle");
                        String publisherName = rs.getString("publisherName");
                        String yearPublished = rs.getString("yearPublished");
                        String numberPages = rs.getString("numberPages");

                        //Display values
                        System.out.printf(displayFormat, 
                                dispNull(groupName),
                                dispNull(bookTitle),
                                dispNull(publisherName),
                                dispNull(yearPublished),
                                dispNull(numberPages));
                    }

                    mainMenu(conn);
                    break;
                case "7":
                    System.out.println("Enter book title:");
                    String bookTitle = in.nextLine();
                    System.out.println("Enter group name:");
                    String groupName = in.nextLine();
                    System.out.println("Enter publisher name:");
                    String publisherName = in.nextLine();

                    Integer yearPublished = null;
                    while (yearPublished == null) {
                        System.out.println("Enter year published:");
                        String yr = in.nextLine();
                        try {
                            yearPublished = Integer.parseInt(yr);
                        } catch (Exception e) {
                            System.out.println("Not a valid year. Try again.");
                        }
                    }

                    Integer numberPages = null;
                    while (numberPages == null) {
                        System.out.println("Enter number of pages:");
                        String num = in.nextLine();
                        try {
                            numberPages = Integer.parseInt(num);
                        } catch (Exception e) {
                            System.out.println("Not a valid page. Try again.");
                        }
                    }

                    pstmt = conn.prepareStatement(
                        "INSERT INTO Books (groupName, bookTitle, publisherName, yearPublished, numberPages) VALUES (?, ?, ?, ?, ?)"
                    );
                    pstmt.setString(1, groupName);
                    pstmt.setString(2, bookTitle);
                    pstmt.setString(3, publisherName);
                    pstmt.setInt(4, yearPublished);
                    pstmt.setInt(5, numberPages);
                    pstmt.execute();

                    System.out.println("Inserted.");

                    mainMenu(conn);
                    break;
                case "8":
                    System.out.println("Enter publisher name:");
                    String pubName = in.nextLine();
                    System.out.println("Enter publisher address:");
                    String pubAddress = in.nextLine();
                    System.out.println("Enter publisher phone:");
                    String pubPhone = in.nextLine();
                    System.out.println("Enter publisher email:");
                    String pubEmail = in.nextLine();
                    
                    pstmt = conn.prepareStatement(
                        "INSERT INTO Publishers (publisherName, publisherAddress, publisherPhone, publisherEmail) VALUES (?, ?, ?, ?)"
                    );
                    pstmt.setString(1, pubName);
                    pstmt.setString(2, pubAddress);
                    pstmt.setString(3, pubPhone);
                    pstmt.setString(4, pubEmail);
                    pstmt.execute();
                    
                    System.out.println("New publisher created.");
                    System.out.println("");

                    System.out.println("Do you want this publisher to replace an old publisher? (Y/n):");
                    String resp = in.nextLine();
                    if(resp.equals("Y")){
                        System.out.println("Enter the old publisher name:");
                        String oldPubName = in.nextLine();
                        
                        pstmt = conn.prepareStatement(
                            "UPDATE Books "
                                    + "SET publisherName=? "
                                    + "WHERE publisherName=?"
                        );
                        pstmt.setString(1, pubName);
                        pstmt.setString(2, oldPubName);
                        pstmt.execute();

                        System.out.println("Updated any books with publisher " + oldPubName + " to reference new publisher.");
                    }
                    
                    mainMenu(conn);
                    break;
                case "9":
                    System.out.println("Enter book name:");
                    String bookToRemove = in.nextLine();
                    
                    pstmt = conn.prepareStatement(
                        "DELETE FROM Books" +
                        " WHERE bookTitle = ?");
                    pstmt.setString(1, bookToRemove);
                    pstmt.execute();
                    
                    System.out.println("Removed any books with the title " + bookToRemove + ".");

                    mainMenu(conn);
                    break;
                case "10":
                    break;
                default:
                    System.out.println("That did not match the menu options.");
                    mainMenu(conn);
                    return;
            }
            
            
            // pstmt.setBigDecimal(1, 153833.00)
            // pstmt.setInt(2, 110592)
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
        } catch (SQLIntegrityConstraintViolationException ex){
            System.out.println("You referenced an invalid item. Please try again.");
            mainMenu(conn);
        } catch (SQLException ex){
            System.out.println("That was an invalid entry. Please try again.");
            mainMenu(conn);
        };
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
            System.out.println("Could not connect to specified JDBC database.");
        } catch (Exception e) {
            //Handle errors for Class.forName
            System.out.println("Could not load jdbc client driver.");
        } finally {
            //finally block used to close resources
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                System.out.println("Could not end database connection.");
            }//end finally try
        }//end try
        
        System.out.println("Goodbye!");
    }//end main
}//end FirstExample}
