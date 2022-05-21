import logging
import pymongo
import os
import azure.functions as func
from bson.json_util import dumps
from bson.objectid import ObjectId


def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    name = req.params.get('name')
    if name :
        try:
            url = os.environ["APPSETTING_MyDbConnection"]
            client = pymongo.MongoClient(url)
            database = client['alexeicosmos'] 
            collection = database['users'] 

            query = {'name' : name} 
            result = collection.find_one(query)
            result = dumps(f"Tu as {result['age']} ans et tu es {result['description']}")
            return func.HttpResponse(result, mimetype="application/json")
        
        except ConnectionError as e:
            return func.HttpResponse(f"Database connection error.", status_code=400)

    else:
        return func.HttpResponse("Tape des prénoms comme shirley, rachid, ouassim...",  status_code=200)
