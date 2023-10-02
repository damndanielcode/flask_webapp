# Flask-WebApp-with-PostgreSQL-DB
Artists Booking Venues powered by Python (Flask) and PostgreSQL Database

## Development Setup
1. **Download the project starter code locally**
```
git clone https://github.com/John0Isaac/Flask-WebApp-with-PostgreSQL-DB.git
cd Flask-WebApp-with-PostgreSQL-DB
```

2. **Before and After editing your code, Use the commands below:**

before editing anything pull new changes from GitHub.
```
git pull
```
Once you are done editing, you can push the local repository to your Github account using the following commands.
```
git add .
git commit -m "your comment message"
git push
```

3. **Initialize and activate a virtualenv using:**
```
python -m virtualenv venv
source venv/bin/activate
```
>**Note** - In Windows, the `venv` does not have a `bin` directory. Therefore, you'd use the analogous command shown below:
```
source venv/Scripts/activate
deactivate
```

4. **Install the dependencies:**
```
pip install -r requirements.txt
```

5. **Run the development server:**
```
export FLASK_APP=app.py
export FLASK_ENV=development
export FLASK_DEBUG=true
flask run --reload
```

6. **Verify on the Browser**<br>
Navigate to project homepage [http://127.0.0.1:5000/](http://127.0.0.1:5000/) or [http://localhost:5000](http://localhost:5000)


# Adding Routes
## To add a new page
* Create the html, css, js in the specified folder using the same folder structure.
* Create a new route in the [app.py](./app.py) file with the name you want using only dashes to seperate words.
```PYTHON
@app.route('NEW-ROUTE')
```
* Define your serving function using a unique name not used before in the whole application.
```PYTHON
def NEW_UNIQUE_NAME():
```
* Return your html file path using render_template.
```PYTHON
return render_template('FOLDER_PATH/FILE_PATH.html')
```
* Your newely created route should look like this.
```PYTHON
@app.route('NEW-ROUTE')
def NEW_UNIQUE_NAME():
    return render_template('FOLDER_PATH/FILE_PATH.html')
```

## To run the development server
* Open git bash terminal
```bash
FLASK_APP=app.py
FLASK_ENV=development
flask run --reload
```

## Deploying to Google Cloud

1. Open the Google Cloud Shell and execute the following command:

```
git clone https://github.com/John0Isaac/Flask-WebApp-with-PostgreSQL-DB.git
cd Flask-WebApp-with-PostgreSQL-DB
```

2. Create the env_variables.yaml file that contains your secret environment variables.

```
nano env_variables.yaml
```

3. Add your Google Cloud SQL database connection details
```
env_variables:
  DB_USER_NAME: 'secret'
  DB_PASSWORD: 'secret'
  DB_NAME: 'secret'
  DB_HOST: '111.111.111.111'
  DB_PORT: '5432'
  DB_CONNECTOR: 'postgresql+pg8000'
  INSTANCE_UNIX_SOCKET: '/cloudsql/Connection name'
  DEPLOYMENT_LOCATION: 'gcp'
```

4. save and exit the file CTRL+x followed by y followed by Enter.
5. Deploy the web application.
```
gcloud app deploy app.yaml
```


## Deploying After Deleting Everything
1. Create a Cloud SQL instance using the following parameters:
    - Specify instance name and password.
    - Select production instead of production plus.
    - Select Single Zone.
    - Specify the machine configuration of 2 vCPUs and 8 GB Memory.
    - Select the smallest storage option available 10 GB.
    - Add your IP to the Instance Network.
    - Select Create.
    - Create a database and call it fyyur.
    - Create a user and call it john.
    - Grant All privileges to user john.
2. Import Data dump.
3. Pull the code to the Cloud Shell.
4. Create environment variables .yaml file.
5. Enable App Engine.
6. execute the following command `gcloud beta app repair`.
7. execute the following command `gcloud app deploy --no-cache`.
