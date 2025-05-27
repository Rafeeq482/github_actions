import yaml # type: ignore
 
with open('first.yml', 'r') as file:
    try:
        print(yaml.safe_load(file))
    except yaml.YAMLError as exc:
       print(exc)