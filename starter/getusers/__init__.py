import logging
import pymongo
import os
import azure.functions as func
from bson.json_util import dumps
from bson.objectid import ObjectId


def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')
    try:
        url = os.environ["APPSETTING_MyDbConnection"]
        client = pymongo.MongoClient(url)
        database = client['alexeicosmos'] 
        collection = database['users'] 

        # result = collection.find()
        # return func.HttpResponse(result, mimetype="application/json")

        result = collection.find()
        result = dumps(result)
        return func.HttpResponse(result, mimetype="application/json")
        
    except ConnectionError as e:
        return func.HttpResponse(f"Database connection error.", status_code=400)
