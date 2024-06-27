## Step 1 - Create a private docker network
```bash
cd /mydata
sudo docker network create nonrtric-docker-net
```
## Step 2 - Create configuration file for running with the SDNC A1-Controller
```bash
sudo vi /mydata/application_configuration.json
```
### Enter the following json text
* {
    "config": {
        "controller": [
            {
                "name": "a1controller",
                "baseUrl": "https://a1controller:8443",
                "userName": "admin",
                "password": "Kp8bJ4SXszM0WXlhak3eHlcse2gAw84vaoGGmJvUy2U"
            }
        ],
        "ric": [
            {
                "name": "ric1",
                "baseUrl": "http://ric1:8085/",
                "controller": "a1controller",
                "managedElementIds": [
                    "kista_1",
                    "kista_2"
                ]
            },
            {
                "name": "ric2",
                "baseUrl": "http://ric2:8085/",
                "controller": "a1controller",
                "managedElementIds": [
                    "kista_3",
                    "kista_4"
                ]
            },
            {
                "name": "ric3",
                "baseUrl": "http://ric3:8085/",
                "controller": "a1controller",
                "managedElementIds": [
                    "kista_5",
                    "kista_6"
                ]
            }
        ]
    }
}
## Step 3: Start the container with the following command
```bash
sudo docker run --rm -v /mydata/application_configuration.json:/opt/app/policy-agent/data/application_configuration.json -p 8081:8081 -p 8433:8433 --network=nonrtric-docker-net --name=policy-agent-container nexus3.o-ran-sc.org:10002/o-ran-sc/nonrtric-plt-a1policymanagementservice:2.7.0
```
