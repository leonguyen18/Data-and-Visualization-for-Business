# Global Earthquake Analysis & Visualization

## Project Description
This project analyzes a comprehensive global earthquake dataset containing 800 unique events, focusing on converting complex seismic data into actionable insights for emergency response and disaster management directors through data visualization techniques.

## Introduction
Earthquakes pose significant threats to communities worldwide, making it essential to have adequate emergency response and disaster management strategies. This project utilizes data visualization techniques with Tableau to analyze global earthquake data, focusing on critical parameters such as magnitude, depth, geographical distribution, and temporal patterns to enhance community resilience through data-driven decision-making.

## Tools Used
- **Python**
  - Data cleaning and preprocessing
  - Handling duplicate records
  - Standardizing geographical information
- **Tableau**
  - Interactive visualizations
  - Geographical mapping
  - Statistical analysis
- **Excel** for data storage and transfer

## Project Components

### 1. Data Preprocessing (Python)
#### Data Cleaning
- Reduced 1,137 initial raw records to 800 unique observations
- Extracted and standardized geographical information
- Handled missing values in continent, country, and alert columns
- Standardized naming conventions across dataset

#### Feature Engineering
- Developed geographical information extraction function
- Created alert level classification system
- Implemented data validation checks
- Standardized date/time formats

### 2. Key Variables
- Geographic: Latitude, Longitude, Country, Continent
- Seismic: Magnitude, Depth, Alert Level
- Location: placeOnly, specific geographical references
- Temporal: Date and time information

### 3. Data Insights

#### Geographic Distribution
- Visualization of Pacific Ring of Fire activity
- High concentration in Indonesia, Japan, and Chile
- Detailed mapping of seismic zones

#### Depth-Magnitude Analysis
- Positive correlation between depth and magnitude
- Most events in shallow depth range (0-100 km)
- Higher magnitude events at varied depths

#### Regional Analysis
- Country-specific earthquake patterns
- Continental distribution of seismic activity
- Tsunami risk assessment by region

## Visualization Highlights
1. Interactive geographical map with magnitude encoding
2. Depth-magnitude correlation scatter plot
3. Calendar-based seasonal analysis
4. Country-specific earthquake characteristics
5. Continental analysis dashboard
6. Comprehensive global earthquake dashboard

## Key Findings
1. Clear visualization of Pacific Ring of Fire seismic activity
2. Positive correlation between earthquake depth and magnitude
3. Most earthquakes cluster in shallow depth ranges
4. Higher magnitude events occur at various depths
5. Regional patterns in seismic activity distribution

## Future Enhancements
1. Real-time data integration capabilities
2. Advanced predictive analytics
3. Enhanced visualization interactivity
4. Population density impact analysis
5. Historical trend comparison features

## Contributing
This is an individual assignment completed as part of BUSA8090: Data and Visualization for Business

## License
This project is part of a university assignment and should be used for educational purposes only.

## Acknowledgments
- Course materials from BUSA8090
- Tableau documentation and best practices
- Global earthquake dataset provided within academic scope
