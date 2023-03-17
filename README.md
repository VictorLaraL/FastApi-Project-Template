# FastApi-Project-Template

## Run in local

First create a virtual enviroment with nexty command:

```
    python3 -m venv venv
```

Later start the venv with:

```
    source venv/bin/activate
```

Now the venv is activate install the requirements, go to the folder "requirements" and install with next command:

```
    pip install -r requirements.local.txt
```
And now for the last step, run the server, so go to the main.py file and run:

```
    uvicorn main:app
```

For this steps u can go to the localhost:8000 and see the app run, if you need the documentation go to localhost:8000/docs or localhost:8000/redoc

## Run in local with Docker Compose

