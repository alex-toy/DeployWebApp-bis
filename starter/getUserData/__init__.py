import logging
import pymongo
import os
import azure.functions as func
from bson.json_util import dumps
from bson.objectid import ObjectId



def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    id = req.params.get('id')
    if id :
        try:
            url = os.environ["MyDbConnection"] 
            client = pymongo.MongoClient(url)
            database = client['alexeimondb'] 
            collection = database['person']  

            query = {'_id' : ObjectId(id)} 
            result = collection.find_one(query)
            result = dumps(result)

            return func.HttpResponse(result, mimetype="application/json")
        
        except ConnectionError as e:
            return func.HttpResponse(f"Database connection error.", status_code=400)

    else:
        return func.HttpResponse(
             "Please pass an id to the query string.",
             status_code=200
        )
