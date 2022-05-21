from ast import dump
import logging
import pymongo
import os
import azure.functions as func
from bson.json_util import dumps
from bson.objectid import ObjectId


def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    name = req.params.get('name')
    if not name:
        try:
            req_body = req.get_json()

        except ValueError:
            pass
        else:
            name = req_body.get('name')

    if name:
        url = os.environ["APPSETTING_MyDbConnection"] 
        client = pymongo.MongoClient(url)
        database = client['alexeicosmos'] 
        collection = database['users'] 

        myquery = {'name' : name} 
        x = collection.delete_many(myquery)
        return func.HttpResponse(f"Hello, {x.deleted_count} documents have been deleted.")
    else:
        return func.HttpResponse(
             "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.",
             status_code=200
        )
