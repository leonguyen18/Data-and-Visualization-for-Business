# Assignment 1: Pro App Platform Database Design

## Project Description
This project is for the Data and Visualisation for Business unit. The project involves designing and implementing a relational database system for a professional services platform that connects customers with tradespeople.

## Introduction
The effective management of Pro App requires a robust database system to handle complex relationships between customers, tradespeople, tasks, and certifications. This database design facilitates service matching, transaction tracking, and certification management while maintaining data integrity and supporting business operations.

## Tools Used
- **MySQL**
- **SQL Workbench**
- **Draw.io** (for ERD diagrams)

## Project Components

### 1. Database Design
#### Core Tables
- `customers` - Customer profiles and contact information
- `tradespeople` - Tradesperson details and qualifications
- `tasks` - Service requests and their statuses
- `transactions` - Offer management and service ratings

#### Supporting Tables
- `suppliers` and `materials` - Resource management
- `training_providers` and `certificates` - Certification tracking
- `task_materials` - Material requirements for tasks
- `tradesperson_certificates` - Certification records

### 2. Implementation Features
- Foreign key constraints with appropriate cascade rules
- ENUM types for status fields
- CHECK constraints for rating values
- Unique constraints for email addresses
- Default values for common fields

### 3. Database Overview
This database system is designed to support the Pro App platform where:
- Customers can post tasks and connect with qualified tradespeople
- Tradespeople can manage their certifications and bid on tasks
- Suppliers can provide materials for tasks
- Training providers can issue professional certifications

## Sample Queries
The database supports various business operations:

1. Finding qualified tradespeople in a specific area
2. Tracking task status and material requirements
3. Managing certification validity
4. Analyzing customer satisfaction ratings
5. Monitoring supplier relationships

## Future Enhancements

1. Add payment processing tables
2. Implement scheduling system
3. Add service area mapping
4. Include insurance and liability tracking
5. Develop notification system structure

## Contributing
This is an individual assignment completed as part of university coursework.

## License
This project is part of a university assignment and should be used for educational purposes only.

## Acknowledgments
- Database design patterns based on business standards
- Sample data generated for testing purposes
