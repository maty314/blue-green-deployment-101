# Blue-Green Deployment 101

# Blue-Green Deployment Project

This project demonstrates a simple blue-green deployment setup using Docker and Docker Compose. It includes two application versions (`blue` and `green`) and an Nginx reverse proxy to switch between them. The project also includes a script to handle the deployment process.
Enjoy learning about blue-green deployment!

## Project Structure

### Files and Directories

- **docker-compose.yml**: Docker Compose configuration file to define and manage the services.
- **deploy.sh**: Shell script to handle the deployment process, switching between blue and green versions.
- **blue/**: Directory containing the Dockerfile and application code for the blue version of the application.
  - **Dockerfile**: Dockerfile for building the blue version of the application.
  - **app.py**: Flask application code for the blue version.

- **green/**: Directory containing the Dockerfile and application code for the green version of the application.
  - **Dockerfile**: Dockerfile for building the green version of the application.
  - **app.py**: Flask application code for the green version.
- **nginx/**: Directory containing the Dockerfile and configuration files for Nginx.
  - **Dockerfile**: Dockerfile for building the Nginx container.
  - **nginx.conf**: Base Nginx configuration file.
  - **blue_conf/nginx.conf**: Nginx configuration file for routing traffic to the blue version.
  - **green_conf/nginx.conf**: Nginx configuration file for routing traffic to the green version.


## Getting Started

### Prerequisites

- Docker installed on your machine.
- Docker Compose installed on your machine.

### Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/blue-green-deployment.git
    cd blue-green-deployment
    ```

2. **Build and run the Docker containers**:
    ```bash
    docker-compose up --build -d
    ```

3. **Verify the deployment**:
    Open your browser and navigate to `http://localhost`. You should see either "Blue Version Active" or "Green Version Active" displayed, indicating which version is currently active.

### Switching Between Blue and Green

To switch between the blue and green versions, run the `deploy.sh` script:

```bash
./deploy.sh
```
This script checks the currently active version and switches to the other version by updating the Nginx configuration and sending a HUP signal to reload the configuration.

## Detailed Explanation

### docker-compose.yml

The Docker Compose file defines three services: `blue`, `green`, and `nginx`.

- **blue**: Builds the blue version of the application and maps port 8001 to port 5000.
- **green**: Builds the green version of the application and maps port 8002 to port 5000.
- **nginx**: Builds the Nginx reverse proxy and maps port 80. It depends on both the `blue` and `green` services.

### blue/app.py and green/app.py

Both files contain a simple Flask application that returns a message indicating which version is active.

### deploy.sh

The deployment script checks the current version running behind Nginx and switches to the other version by copying the appropriate Nginx configuration file and sending a HUP signal to Nginx to reload the configuration.

### nginx/

This directory contains the Dockerfile and configuration files for Nginx. The `nginx.conf` files in `blue_conf` and `green_conf` directories are used to route traffic to the respective versions of the application.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

If you would like to contribute to this project, please fork the repository and create a pull request.

## Acknowledgements

Thanks to the open-source community for providing the tools and resources that made this project possible.


Feel free to modify the placeholders like the GitHub repository URL and the acknowledgements section according to your needs.


















