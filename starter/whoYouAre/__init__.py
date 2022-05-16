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
        return func.HttpResponse(f"Hello, {name}. Who are you ????.")
    else:
        return func.HttpResponse(
             "Pass a name in the query string if you want to know who you are!!!!!!!.",
             status_code=200
        )
