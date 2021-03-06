# Bird Signs

![build](https://github.com/tipresias/bird-signs/workflows/build/badge.svg)

The AFL data API for the Tipresias app and related data-science services

## Running things

### Setup

- To manage environemnt variables:
    - Install [`direnv`](https://direnv.net/)
    - Add `eval "$(direnv hook bash)"` to the bottom of `~/.bashrc`
    - Run `direnv allow .` inside the project directory
- To build and run the app: `docker-compose up --build`

### Run the app

- `docker-compose up`
- Navigate to `localhost:8080`.

### Testing

- Run `./scripts/test.sh`

### Deploy

- Deploy app to Google Cloud Run:

  - Merge a pull request into `main`
  - Manually trigger a deploy:
    - In the Travis dashboard, navigate to the tipresias repository.
    - Under 'More Options', trigger a build on `main`.
    - This will build the image, run tests, and deploy to Google Cloud Run.
