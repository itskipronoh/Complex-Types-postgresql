# Complex Types in PostgreSQL

## Overview

This project showcases the usage of various complex types in PostgreSQL, demonstrating their application in different scenarios. The complex types covered include JSON, Hstore, network data types, case-insensitive unique data, composite types, bytea data types, and XML data types.

## 1. Complex Data Types

### 1.1 JSON Data

#### Orders Table

- Table Name: `Orders`
- Description: Stores orders in JSON format.

Example Usage:

```sql
SELECT * FROM Orders;
```

#### Inventory Table

- Table Name: `Inventory`
- Description: Manages inventory information in JSON format.

Example Usage:

```sql
SELECT * FROM Inventory;
```

### 1.2 Hstore Data

#### Book Table

- Table Name: `Book`
- Description: Records information about books using the Hstore data type.

Example Usage:

```sql
SELECT * FROM Book;
```

#### Music Table

- Table Name: `Music`
- Description: Stores information about music using the Hstore data type.

Example Usage:

```sql
SELECT * FROM Music;
```

### 1.3 Network Data Types

#### WiFiNetworkDataType Table

- Table Name: `tbl_WiFiNetworkDataType`
- Description: Demonstrates the usage of network data types (`INET` and `MACADDR`).

Example Usage:

```sql
SELECT * FROM tbl_WiFiNetworkDataType;
```

### 1.4 Case-Insensitive Unique Data

#### Users Table

- Table Name: `users`
- Description: Manages user data with case-insensitive unique email addresses.

Example Usage:

```sql
SELECT * FROM users;
```

### 1.5 Composite Types

#### Customer Data Table

- Table Name: `customer_data`
- Description: Utilizes composite types to manage customer information and total purchases.

Example Usage:

```sql
SELECT * FROM customer_data;
```

### 1.6 Bytea Data Types

#### Laptop Table

- Table Name: `laptop`
- Description: Handles image data using the `bytea` data type.

Example Usage:

```sql
SELECT * FROM laptop;
```

#### Book Table

- Table Name: `book`
- Description: Manages book information with cover images using the `bytea` data type.

Example Usage:

```sql
SELECT * FROM book;
```

### 1.7 XML Data Types

#### Hostel Table

- Table Name: `hostel`
- Description: Extracts and integrates data from XML documents for hostels.

Example Usage:

```sql
SELECT * FROM hostel;
```

#### Student Hostel Table

- Table Name: `student_hostel`
- Description: Extracts and integrates data from XML documents for student hostels.

Example Usage:

```sql
SELECT * FROM student_hostel;
```

Feel free to explore and run the provided SQL queries to better understand the functionality of each table. Adjustments and modifications can be made based on specific project requirements.
