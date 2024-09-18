# Museum_DataSet_Project-MySQL

## Overview
This project involves creating and querying a database for managing museum data, focusing on artworks, artists, museums, and sales. The database provides insights into the relationships between these entities, allowing users to extract meaningful information through various SQL queries.

## Database Structure
The database museumdata consists of several tables:

* artist: Contains information about artists, including their full names and nationalities.
* work: Stores details about artworks, including titles and styles, and links to the artists and museums.
* museum: Information about museums, including their names and locations.
* product_size: Details on the sale prices and sizes of the artworks.
* canvas_size: Contains dimensions for the artworks.
* subject: Categories or themes of the artworks.
* museum_hours: Opening hours of each museum.
  
## Queries
The project includes a series of SQL queries designed to analyze the museum data. Below are some key queries:

1. Retrieve Artists and Museums: Lists artists along with the museums displaying their works.
2. Count Works by Artist: Counts how many works each artist has, ordered by count.
3. Top 5 Museums by Work Count: Lists the top 5 museums with the highest number of works.
4. Work Names and Styles with Museums: Displays the names and styles of artworks alongside museum names, limited to the top 10 results.
5. Total Sales Price by Artist: Shows the total sale price of artworks by each artist.
6. Artists with More Than 3 Works: Lists artists who have more than three works.
7. Works with Sale Price Below Regular Price: Retrieves works that are on sale for less than their regular price.
8. Average Height and Width of Artworks: Calculates average dimensions of artworks.
9. Maximum Sale Price by Museum: Finds the highest sale price of artworks in each museum.
10. Concatenated Artist Names and Nationalities: Combines the first and last names of artists with their nationality, along with a count of their works.

## Usage
This database can be used by museum staff, researchers, or anyone interested in art collections to analyze trends, artist contributions, and museum offerings. You can extend this project by adding more data or refining queries based on specific research needs.
## Acknowledgments
Thanks to all contributors and resources that helped in the development of this database project. If you have any questions or suggestions, feel free to reach out!
