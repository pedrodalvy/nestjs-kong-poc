# NestJS and Kong POC

This Proof of Concept (POC) is designed to illustrate the configuration of Kong in DB-Less mode, showcasing its
integration within a NestJS application. The primary objective is to streamline the versioning process of Kong
configurations, providing a more manageable approach.

## Prerequisites

Ensure you have the following tools installed:

- Docker
- Docker Compose

## Installation

Follow these steps to set up the project:

- Run `make dev` to initiate the development server.
- Run `make prod` to start the production server.
- Run `make down` to stop the server.
- Set the public and private JWT keys in the `.env` file.

## Observation

- Kong is accessible on port `8000` with the `/app` prefix.
- NestJS operates on port `3000` without any prefix.
- Find the `kong.yml` configuration file in the `kong` directory.
- A rate-limiting plugin is pre-installed, limiting requests to 10 per minute.

## Usage

- Login Endpoint:
    ```sh
    curl --location 'localhost:8000/app/auth/login' \
    --header 'Accept: application/json' \
    --header 'Content-Type: application/json' \
    --data '{
        "username": "guess",
        "password": "guess"
    }'
    ```

- Private Endpoint:
    ```sh
    curl --location 'localhost:8000/app/private' \
    --header 'Authorization: Bearer <token>'
    ```

- Public Endpoint:
    ```sh
    curl --location 'localhost:8000/app/open'
    ```
