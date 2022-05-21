from ast import dump
import logging
import pymongo
import os
import azure.functions as func
from bson.json_util import dumps
from bson.objectid import ObjectId


def main(req: func.HttpRequest) -> func.HttpResponse:
    request = req.get_json()
    if request:
        try:
            url = os.environ["APPSETTING_MyDbConnection"] 
            client = pymongo.MongoClient(url)
            database = client['alexeicosmos'] 
            collection = database['users'] 

            query = {'name' : request['name']} 
            user = collection.find_one(query)

            if not user : collection.insert_one(request)
            if user : 
                update_query = {"$set":{"description": request['description'], "age": request['age']}}
                if user : collection.update_many(query, update_query)

            return func.HttpResponse(req.get_body())
        except ValueError:
            return func.HttpResponse('Database connection error.', status_code=500)
    else:
        return func.HttpResponse(
            "Please pass the correct JSON format in the body of the request object",
            status_code=400
        )

