from fastapi import FastAPI


app = FastAPI(title='Template of FastAPI')


@app.get('/')
def read_root():
    return {'message':'Hello world'}
    