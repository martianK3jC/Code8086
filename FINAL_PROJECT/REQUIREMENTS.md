# CS243 LAB FINAL PROJECT - REQUIREMENTS SPECIFICATIONS

## 1. FULL NAME
KESHA JANE L. CENIZA

## 2. NAME OF SYSTEM
Online Food Ordering System

## 3. BRIEF DESCRIPTION OF SYSTEM CAPABILITIES
The Online Food Ordering System is a console-based application developed in Assembly Language that allows customers to register, log in, and manage food orders. The system provides full CRUD (Create, Read, Update, Delete) operations for food order records during runtime.

**Key Capabilities:**
- Customer registration with username and password validation
- Secure customer login authentication
- Create new food orders with item details and quantities
- View all existing food orders
- Update existing order information
- Delete unwanted orders
- Support for up to 10 order records simultaneously
- Session-based operation (data exists only during runtime)
- Logout functionality that returns to login screen without terminating the program

## 4. LIST OF ALL REQUIRED INPUTS

**A. Customer Registration Inputs:**
1. Username (String, alphanumeric, max 20 characters)
2. Password (String, max 20 characters)
3. Confirm Password (String, must match password)
4. Full Name (String, max 30 characters)

**B. Customer Login Inputs:**
1. Username (String)
2. Password (String)

**C. Create Order Inputs:**
1. Order ID (Auto-generated or manual input, numeric)
2. Food Item Name (String, max 30 characters)
3. Quantity (Numeric, 1-99)
4. Price per Item (Numeric, decimal format)
5. Customer Address (String, max 50 characters)
6. Contact Number (String, 11 digits)

**D. Update Order Inputs:**
1. Order ID to Update (Numeric)
2. New Food Item Name (Optional)
3. New Quantity (Optional)
4. New Price (Optional)
5. New Address (Optional)
6. New Contact Number (Optional)

**E. Delete Order Inputs:**
1. Order ID to Delete (Numeric)
2. Confirmation (Y/N)

**F. Menu Navigation Inputs:**
1. Menu Choice (Numeric, 1-6)

## 5. LIST OF ALL REQUIRED PROCESSES (FUNCTIONS)

**A. User Management Processes:**
1. REGISTER_CUSTOMER (Validate uniqueness, password strength, confirmation)
2. LOGIN_CUSTOMER (Validate credentials, grant access)
3. LOGOUT_CUSTOMER (Clear session, return to login)

**B. Order Management Processes:**
4. CREATE_ORDER (Check limit, validate inputs, calculate total, store)
5. VIEW_ORDERS (Display formatted table with all fields including Contact)
6. UPDATE_ORDER (Search, display current, valid inputs, recalculate total)
7. DELETE_ORDER (Search, confirm, remove, shift arrays)

**C. Utility Processes:**
8. DISPLAY_OPENING_SCREEN (ASCII art, programmer name, date)
9. DISPLAY_MAIN_MENU (Options 1-6)
10. CLEAR_SCREEN
11. VALIDATE_INPUT (Numeric ranges, string lengths, formats)
12. CALCULATE_TOTAL (Qty * Price)
13. SEARCH_ORDER (Find index by ID)
14. DISPLAY_ERROR

## 6. LIST OF ALL REQUIRED OUTPUTS

**A. Screen Displays:**
- Opening Screen (Logo, Info)
- Registration Screen
- Login Screen
- Main Menu Screen
- Create Order Screen
- View Orders Screen (Table)
- Update Order Screen
- Delete Order Screen

**B. Data Outputs:**
- Calculated Total Price
- Order Count
- Order ID
- Messages (Success, Error, Validation)

## 7. UI DRAFTS (Summary)
- **Opening Screen**: Specific borders and emoji/ASCII art.
- **Main Menu**: Welcome message with name, logic flow.
- **Validation Rules**: 
    - Username: 4-20 chars.
    - Password: 6-20 chars.
    - Contact: 11 digits, starts with 09.
    - Price: >0, max 9999.99.
