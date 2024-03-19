from typing import Union
import sqlalchemy
import mysql.connector as mysql


from fastapi import FastAPI

app = FastAPI()

@app.get("/getdata")
def get_data(q: Union[str, None] = None):

    # connection = mysql.connect(user='root', password='supersecretpassw0rd', database='mysql', host='127.0.0.1', port=3306)
    
    # cursor = connection.cursor()
    # # cursor.execute("show tables;")
    # cursor.execute("""SELECT first_name, last_name, email, city.city, country.country
    #                 FROM customer
    #                 LEFT JOIN address ON address.address_id=customer.address_id
    #                 LEFT JOIN city ON city.city_id=address.city_id
    #                 LEFT JOIN country ON city.country_id=country.country_id
    #                 WHERE country.country="Canada"
    #                 ORDER BY city.city;""")
    
    # for row in cursor.fetchall():
    #     print(row)
    
    # cursor.close()
    # connection.close()
    
    return "Done"