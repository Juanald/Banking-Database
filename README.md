# Banking Database Application

This is a simple banking database application that connects to an Oracle database. It allows users to interact with the database through a graphical user interface (GUI).

## Prerequisites

- Java Development Kit (JDK) installed.
- Oracle JDBC driver (`ojdbc17.jar`).
- An active Oracle database account.

## Running Instructions

1. First, compile the Java code with the following command:

   ```bash
   javac -cp ./ojdbc17.jar JdbcOracleConnectionTemplate.java
   ```

2. Once the code is compiled, run the application:
   ```bash
   java -cp ./ojdbc17.jar JdbcOracleConnectionTemplate
   ```
3. A popup window will appear asking for your CS login and password. Enter your credentials to establish a connection with the database.
4. After successfully logging in, you will have access to the banking application and can interact with the database through the interface.

# Features

- Secure database connection using CS login and password.

- Interaction with the banking database through an easy-to-use GUI.

- Ability to perform common banking operations (details to be expanded based on features implemented in the app).

# Troubleshooting

- If you encounter connection issues, ensure that the database is running and that the ojdbc17.jar is correctly located in your project directory.
- Verify that the CS login credentials you enter are valid and that you have access to the Oracle database.
