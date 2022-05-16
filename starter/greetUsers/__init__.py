import logging

import azure.functions as func


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
        if name == "alessio" : return func.HttpResponse(f"Hello, {name}. You are a very BG ;-)")
        if name == "shirley" : return func.HttpResponse(f"Hello, {name}. You are a baby killer!!!!.")
        if name == "ouassim" : return func.HttpResponse(f"Hello, {name}. You are seriously a very elegant and handsome man!!!")
        return func.HttpResponse(f"Hello, {name}. Who are you ????.")
    else:
        return func.HttpResponse(
             "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.",
             status_code=200
        )
